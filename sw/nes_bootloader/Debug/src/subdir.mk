################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/NESCore_Callback.c \
../src/bmp_misc.c \
../src/nes_bootloader.c \
../src/utils.c \
../src/wav_misc.c 

LD_SRCS += \
../src/lscript.ld 

OBJS += \
./src/NESCore_Callback.o \
./src/bmp_misc.o \
./src/nes_bootloader.o \
./src/utils.o \
./src/wav_misc.o 

C_DEPS += \
./src/NESCore_Callback.d \
./src/bmp_misc.d \
./src/nes_bootloader.d \
./src/utils.d \
./src/wav_misc.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"../src/NESCore/" -I"../src/" -I"../src/xilsd/" -I"../../xilsd/" -I"../../src/NESCore/" -c -fmessage-length=0 -I../../system_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


