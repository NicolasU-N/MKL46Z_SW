################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../amazon-freertos/FreeRTOS/portable/port.c 

OBJS += \
./amazon-freertos/FreeRTOS/portable/port.o 

C_DEPS += \
./amazon-freertos/FreeRTOS/portable/port.d 


# Each subdirectory must supply rules for building sources it contributes
amazon-freertos/FreeRTOS/portable/%.o: ../amazon-freertos/FreeRTOS/portable/%.c amazon-freertos/FreeRTOS/portable/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MKL46Z256VLL4 -DCPU_MKL46Z256VLL4_cm0plus -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DFSL_RTOS_FREE_RTOS -DSDK_OS_FREE_RTOS -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\board" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\source" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\amazon-freertos\FreeRTOS\portable" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\freertos\portable" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\amazon-freertos\include" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\drivers" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\drivers\freertos" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\utilities" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\startup" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\CMSIS" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


