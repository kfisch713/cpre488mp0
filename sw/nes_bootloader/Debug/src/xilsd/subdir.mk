################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/xilsd/ff.c \
../src/xilsd/mmc.c \
../src/xilsd/xilsd.c 

OBJS += \
./src/xilsd/ff.o \
./src/xilsd/mmc.o \
./src/xilsd/xilsd.o 

C_DEPS += \
./src/xilsd/ff.d \
./src/xilsd/mmc.d \
./src/xilsd/xilsd.d 


# Each subdirectory must supply rules for building sources it contributes
src/xilsd/%.o: ../src/xilsd/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"../src/NESCore/" -I"../src/" -I"../src/xilsd/" -I"../../xilsd/" -I"../../src/NESCore/" -c -fmessage-length=0 -I../../system_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


