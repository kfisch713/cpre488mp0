################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/NESCore/M6502.c \
../src/NESCore/NESCore.c \
../src/NESCore/NESCore_Mapper.c \
../src/NESCore/NESCore_pAPU.c 

OBJS += \
./src/NESCore/M6502.o \
./src/NESCore/NESCore.o \
./src/NESCore/NESCore_Mapper.o \
./src/NESCore/NESCore_pAPU.o 

C_DEPS += \
./src/NESCore/M6502.d \
./src/NESCore/NESCore.d \
./src/NESCore/NESCore_Mapper.d \
./src/NESCore/NESCore_pAPU.d 


# Each subdirectory must supply rules for building sources it contributes
src/NESCore/%.o: ../src/NESCore/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"../src/NESCore/" -I"../src/" -I"../src/xilsd/" -I"../../xilsd/" -I"../../src/NESCore/" -c -fmessage-length=0 -I../../standalone_bsp_0/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


