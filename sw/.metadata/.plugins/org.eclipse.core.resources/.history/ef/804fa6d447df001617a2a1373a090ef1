/*****************************************************************************
 * Joseph Zambreno
 * Phillip Jones
 * Department of Electrical and Computer Engineering
 * Iowa State University
 *****************************************************************************/

/*****************************************************************************
 * vga_test.c - example VGA out using a v_tc timing controller and vdma
 * module.
 *
 *
 * NOTES:
 * 10/11/13 by JAZ::Design created.
 *****************************************************************************/


#include <stdio.h>
#include "xparameters.h"
#include "xvtc.h"
#include "xaxivdma.h"


u16 test_image[480][640];

int main() {

	XVtc Vtc;
    XVtc_Config *VtcCfgPtr;

    int i, j;


    // Enable the VTC module
    VtcCfgPtr = XVtc_LookupConfig(XPAR_AXI_VDMA_0_DEVICE_ID);
    XVtc_CfgInitialize(&Vtc, VtcCfgPtr, VtcCfgPtr->BaseAddress);
    XVtc_Enable(&Vtc, XVTC_EN_GENERATOR);

    // Initialize Test image for VDMA transfer to VGA monitor
    for (i = 0; i < 480; i++) {
      for (j = 0; j < 640; j++) {

        if (j < 213) {
          test_image[i][j] = 0x000F; // red pixels
        }
        else if(j < 426 ) {
          test_image[i][j] = 0x00F0; // green pixels
        }
        else {
          test_image[i][j] = 0x0F00; // blue pixels
        }

      }
    }

    Xil_DCacheFlush();

    // Set up VDMA config registers
	#define CHANGE_ME 0

    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_CR_OFFSET,  CHANGE_ME);  // Circular Mode and Start bits set, VDMA MM2S Control
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_HI_FRMBUF_OFFSET, CHANGE_ME);  // VDMA MM2S Reg_Index
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_FRMSTORE_OFFSET, CHANGE_ME);  // VDMA MM2S Number FRM_Stores
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_START_ADDR_OFFSET, CHANGE_ME);  // VDMA MM2S Start Addr 1
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_STRD_FRMDLY_OFFSET, CHANGE_ME);  // 1280 bytes, VDMA MM2S FRM_Delay, and Stride
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_HSIZE_OFFSET, CHANGE_ME);  // 1280 bytes, VDMA MM2S HSIZE
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_VSIZE_OFFSET, CHANGE_ME);  // 480 lines, VDMA MM2S VSIZE  (Note: Starts VDMA transaction

    return 0;
}
