/**
  @page TIM_OutputCompare TIM example

  @verbatim
  ******************************************************************************
  * @file    Examples_LL/TIM/TIM_OutputCompare/readme.txt
  * @author  MCD Application Team
  * @brief   Description of the TIM_OutputCompare example.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  @endverbatim

@par Example Description

Configuration of the TIM peripheral to generate an output
waveform in different output compare modes. This example is based on the
STM32L5xx TIM LL API. The peripheral initialization uses
LL unitary service functions for optimization purposes (performance and size).

In this example TIM3 input clock (TIM3CLK) frequency is set to APB2 clock (PCLK2),
    since APB2 pre-scaler is equal to 1.
    TIM3CLK = PCLK2
    PCLK2 = HCLK
    => TIM2CLK = HCLK = SystemCoreClock (110 Mhz)

To set the TIM3 counter clock frequency to 10 KHz, the pre-scaler (PSC) is
calculated as follows:
PSC = (TIM3CLK / TIM3 counter clock) - 1
PSC = (SystemCoreClock /10 KHz) - 1

SystemCoreClock is set to 110 MHz for STM32L5xx Devices.

Auto-reload (ARR) is calculated to get a time base period of 100 ms,
meaning a time base frequency of 10 Hz.
ARR = (TIM3 counter clock / time base frequency) - 1
ARR = (TIM3 counter clock / 10) - 1

The capture/compare register (CCR2) of the output channel is set to half the
auto-reload value. Therefore the timer output compare delay is 50 ms.
Generally speaking this delay is calculated as follows:
CC2_delay = TIM3 counter clock / CCR2

The timer output channel is mapped on the pin PC.07 (connected to LED1 on board
NUCLEO-L552ZE-Q).
Thus LED1 status (on/off) mirrors the timer output level (active v.s. inactive).

User push-button can be used to change the output compare mode:
  - When the output channel is configured in output compare toggle:  LED1
    TOGGLES when the counter (CNT) matches the capture/compare register (CCR2).
  - When the output channel is configured in output compare active:  LED1
    switched ON when the counter (CNT) matches the capture/compare register
    (CCR2).
  - When the output channel is configured in output compare inactive:  LED1
    switched OFF when the counter (CNT) matches the capture/compare register
    (CCR2).

Initially the output channel is configured in output compare toggle mode.

@note The instruction cache (ICACHE) must be enabled by software to get a 0 wait-state execution
      from Flash memory and external memories, and reach the maximum performance.

@par Keywords

Timers, TIM, Output, Compare mode, signals, Autoreload, Waveform, Counter, Toggle mode.

@par Directory contents

  - TIM/TIM_OutputCompare/Inc/stm32l5xx_it.h          Interrupt handlers header file
  - TIM/TIM_OutputCompare/Inc/main.h                  Header for main.c module
  - TIM/TIM_OutputCompare/Inc/stm32_assert.h          Template file to include assert_failed function
  - TIM/TIM_OutputCompare/Src/stm32l5xx_it.c          Interrupt handlers
  - TIM/TIM_OutputCompare/Src/main.c                  Main program
  - TIM/TIM_OutputCompare/Src/system_stm32l5xx.c      STM32L5xx system source file


@par Hardware and Software environment

  - This example runs on STM32L552xx devices.

  - This example has been tested with NUCLEO-L552ZE-Q board and can be
    easily tailored to any other supported device and development board.

@par How to use it ?

In order to make the program work, you must do the following :
 - Open your preferred toolchain
 - Rebuild all files and load your image into target memory
 - Run the example


 */
