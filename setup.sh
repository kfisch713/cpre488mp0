######################################################################
# Joseph Zambreno
# setup.sh - shell configuration for CprE 488 labs
######################################################################


# Confirm that you have not already run the setup.sh
if [ "$ZED_SETUP" == "1" ]; then
  printf "Error: ZED_SETUP already defined.\n"
  printf "Please open a new terminal to apply new changes, or set the\n"
  printf "configuration variables directly.\n"
  return 1
fi

export ZED_SETUP="1"


SDIR=`dirname "$BASH_SOURCE"`
CDIR=`readlink -f "$SDIR"`

export XLNX_VER=14.6
export VVDO_VER=2013.2
export ARCH_VER=64
export VSIM_VER=10.1c

printf "Setting up environment variables for %s-bit Xilinx ISE tools, version %s..." $ARCH_VER $XLNX_VER 
source /remote/Xilinx/$XLNX_VER/settings$ARCH_VER.sh
printf "done.\n"

printf "Setting up environment variables for %s-bit Xilinx Vivado tools, version %s..." $ARCH_VER $VVDO_VER
source /remote/Xilinx/$VVDO_VER/settings$ARCH_VER.sh
printf "done.\n"

printf "Setting up path for %s-bit Modelsim tools, version %s..." $ARCH_VER $VSIM_VER
export PATH=$PATH:/remote/Modelsim/$VSIM_VER/modeltech/linux_x86_64/
printf "done.\n"

printf "Setting up license file..."
export LM_LICENSE_FILE=1717@io.ece.iastate.edu:27006@io.ece.iastate.edu
printf "done.\n"
