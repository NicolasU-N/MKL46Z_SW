################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../amazon-freertos/FreeRTOS/event_groups.c \
../amazon-freertos/FreeRTOS/list.c \
../amazon-freertos/FreeRTOS/queue.c \
../amazon-freertos/FreeRTOS/stream_buffer.c \
../amazon-freertos/FreeRTOS/tasks.c \
../amazon-freertos/FreeRTOS/timers.c 

OBJS += \
./amazon-freertos/FreeRTOS/event_groups.o \
./amazon-freertos/FreeRTOS/list.o \
./amazon-freertos/FreeRTOS/queue.o \
./amazon-freertos/FreeRTOS/stream_buffer.o \
./amazon-freertos/FreeRTOS/tasks.o \
./amazon-freertos/FreeRTOS/timers.o 

C_DEPS += \
./amazon-freertos/FreeRTOS/event_groups.d \
./amazon-freertos/FreeRTOS/list.d \
./amazon-freertos/FreeRTOS/queue.d \
./amazon-freertos/FreeRTOS/stream_buffer.d \
./amazon-freertos/FreeRTOS/tasks.d \
./amazon-freertos/FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
amazon-freertos/FreeRTOS/%.o: ../amazon-freertos/FreeRTOS/%.c amazon-freertos/FreeRTOS/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MKL46Z256VLL4 -DCPU_MKL46Z256VLL4_cm0plus -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DFSL_RTOS_FREE_RTOS -DSDK_OS_FREE_RTOS -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\board" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\source" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\amazon-freertos\FreeRTOS\portable" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\freertos\portable" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\amazon-freertos\include" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\drivers" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\drivers\freertos" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\utilities" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\startup" -I"C:\Users\nico3\Documents\MCUXpressoIDE_11.5.0_7232\workspace\MKL46Z4_SW\CMSIS" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


