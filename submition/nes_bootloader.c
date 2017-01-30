/*****************************************************************************
 * Joseph Zambreno
 * Phillip Jones
 *
 * Department of Electrical and Computer Engineering
 * Iowa State University
 *****************************************************************************/

/*****************************************************************************
 * nes_bootloader.c - main nes_bootloader application code. The bootloader
 * reads a .nes file from the SD card, and uses this information to
 * load and emulate the NES rom.
 *
 *
 * NOTES:
 * 10/25/13 by JAZ::Design created.
 *****************************************************************************/

#include "nes_bootloader.h"
#include "NESCore.h"


// Main function. Performs Xilinx-specific initialization, and then goes into the main polling loop
int main() {

	// Initialize all memory space
	xil_init();

	// Initialize the NESCore
	NESCore_Init();


	// Enable the cache
    Xil_DCacheEnable();


    // Main polling loop. For now, you can hard-code the .nes ROM you would like to load.
    // Later, improve the code to have user-specified entry and exit options
	while (1) {
		nes_load();
	}

}



// Runs the main NES emulation
void nes_load() {

	int32_t result = 0, i;
	uint8_t nes_fname[17];

	nes_strncpy(nes_fname, "zelda.nes", 10);

	usleep(100000);

	if (bootstate.debug_level >= 1)
		xil_printf("nes_load(): loading %s\r\n", nes_fname);


	// Disable the cache so it will play nice with xilsd (needed here)
	Xil_DCacheDisable();
	result = NESCore_LoadROM(nes_fname);
	if (result != 0) {
		xil_printf("nes_load(): invalid ROM load. Returning\r\n");
	}
	// Enable the cache for performance reasons
    Xil_DCacheEnable();



	result = NESCore_Reset();
	if (result != 0) {
		xil_printf("nes_load(): invalid reset. Returning\r\n");
	}

	if (bootstate.debug_level >= 1)
		xil_printf("nes_load(): beginning emulation of %s\r\n", nes_fname);


	bootstate.nes_playing = 1;
	usleep(100000);
	ptv = 0;

	// Runs the emulator 20 cycles at a time. Currently there is no exit condition.
	do {

		for (i = 0; i < RESET_TIME; i++) {
			NESCore_Cycle();
		}

	} while (1);


	bootstate.nes_playing = 0;

	return;

}





// Initializes bootloader state, the Xilinx peripherals, and the front buffer
void xil_init() {

	XStatus Status = XST_SUCCESS;
	uint32_t i;
	uint16_t *ptr;

	// Setup the bootloader state variables.
	bootstate.nes_playing = 0;
	bootstate.activeBuffer = (uint32_t *)FBUFFER_BASEADDR;


	bootstate.debug_level = 1;

	// For now, we disable the DCache as it causes problems with xilsd and vdma
	Xil_DCacheDisable();


	// Initialize the VTC module
	if (bootstate.debug_level >= 1)
		print("xil_init(): Initializing v_tc module\r\n");

	VtcCfgPtr = XVtc_LookupConfig(XPAR_V_TC_0_DEVICE_ID);
	XVtc_CfgInitialize(&Vtc, VtcCfgPtr, VtcCfgPtr->BaseAddress);
	XVtc_Enable(&Vtc, XVTC_EN_GENERATOR);


	// Initialize the front buffer
	if (bootstate.debug_level >= 1)
		print("xil_init(): Initializing front buffer\r\n");

	// Initialize the framebuffer. We can overwrite the edges with 0s.
	ptr = (uint16_t *)FBUFFER_BASEADDR;
	for (i = 0; i < WIDTH*HEIGHT; i++) {
		ptr[i] = INIT_COLOR;
		if (i % WIDTH == 0)
			ptr[i] = 0;
	}

	// Initialize the back buffer
	if (bootstate.debug_level >= 1)
		print("xil_init(): Initializing back buffer\r\n");

	ptr = (uint16_t *)BBUFFER_BASEADDR;
	for (i = 0; i < WIDTH*HEIGHT; i++) {
		ptr[i] = INIT_COLOR;
		if (i % WIDTH == 0)
			ptr[i] = 0;
	}

	// Initialize the VDMA module
	if (bootstate.debug_level >= 1)
		print("xil_init(): Initializing vdma module\r\n");


    // Set up VDMA config registers. Copy-paste solution from vga_test.c (but note difference in framebuffer start address)
	#define CHANGE_ME 0

    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_CR_OFFSET,  CHANGE_ME);  // Circular Mode and Start bits set, VDMA MM2S Control
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_HI_FRMBUF_OFFSET, CHANGE_ME);  // VDMA MM2S Reg_Index
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_FRMSTORE_OFFSET, CHANGE_ME);  // VDMA MM2S Number FRM_Stores
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_START_ADDR_OFFSET, CHANGE_ME);  // VDMA MM2S Start Addr 1
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_STRD_FRMDLY_OFFSET, CHANGE_ME);  // 1280 bytes, VDMA MM2S FRM_Delay, and Stride
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_HSIZE_OFFSET, CHANGE_ME);  // 1280 bytes, VDMA MM2S HSIZE
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_VSIZE_OFFSET, CHANGE_ME);  // 480 lines, VDMA MM2S VSIZE  (Note: Starts VDMA transaction


  	return;
}


