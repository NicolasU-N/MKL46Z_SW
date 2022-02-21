#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "MKL46Z4.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define ALLOFF 0
#define ST1 1
#define ST2 2
#define ST3 3
/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/
volatile bool pitIsrFlag = false;

char state = ALLOFF;
char counter = 0;	//TIMER
char turnOn = 0;
char lasTurnOn = -1;
/*******************************************************************************
 * Code
 ******************************************************************************/
void initPit() {
	//Enable clock to PIT module
	SIM->SCGC6 |= SIM_SCGC6_PIT_MASK;
	//Enable module, freeze timers in debug mode
	PIT->MCR &= ~PIT_MCR_MDIS_MASK; //enable mdis

	//Initialize PIT0 to count down from starting_value
	PIT->CHANNEL[0].LDVAL = 0x4FFFFF;				//every 400ms   V = 0.5 * 10485760–1    T(seconds) 10485760(Bus Clock)
	PIT->CHANNEL[0].TCTRL &= PIT_TCTRL_CHN_MASK;	//No chaining of timers
	PIT->CHANNEL[0].TCTRL |= PIT_TCTRL_TEN_MASK;
	PIT->CHANNEL[0].TCTRL |= PIT_TCTRL_TIE_MASK;//Let the PIT channel generate interrupt requests
	NVIC_SetPriority(PIT_IRQn, 3);
	NVIC_ClearPendingIRQ(PIT_IRQn); //Clear any pending IRQ from PIT
	NVIC_EnableIRQ(PIT_IRQn); //Enable the PIT interrupt in the NVIC
}

void readSwOn(void) {
	if ((((PTE->PDIR) >> 18) & 0x01U) && lasTurnOn != 0) {
		turnOn = 0;
		PTE->PCOR = (1U << 2U); //OFF led Toggle on target S1
	} else if ((((PTE->PDIR) >> 19) & 0x01U) && lasTurnOn != 1) {
		turnOn = 1;
		PTE->PCOR = (1U << 3U); //OFF led Toggle on target S2
	} else if ((((PTE->PDIR) >> 31) & 0x01U) && lasTurnOn != 2) {
		turnOn = 2;
		PTE->PCOR = (1U << 6U); //OFF led Toggle on target S3
	}

	lasTurnOn = (state == ST2) ? turnOn : -1;
}

void PIT_IRQHandler(void) {
	if (PIT->CHANNEL[0].TFLG & PIT_TFLG_TIF_MASK) {
		/* Clear interrupt flag.*/
		PIT->CHANNEL[0].TFLG &= PIT_TFLG_TIF_MASK;
		pitIsrFlag = true;
		PTE->PSOR |= (1U << 2U) | (1U << 3U) | (1U << 6U); //ON LED
	}
}

/*!
 * @brief Main function
 */
int main(void) {
	//Initialize timer
	initPit();

	/* Initialize and enable LED */
	SIM->SCGC5 |= SIM_SCGC5_PORTE_MASK; // Enable clock  to PORT E

	PORTE->PCR[2] |= PORT_PCR_MUX(1); // PORT E MUX
	PORTE->PCR[3] |= PORT_PCR_MUX(1); // PORT E MUX
	PORTE->PCR[6] |= PORT_PCR_MUX(1); // PORT E MUX

	PTE->PDDR |= (1u << 2U) | (1u << 3U) | (1u << 6U); // Outputs
	PTE->PCOR = (1U << 2U) | (1U << 3U) | (1U << 6U); //OFF led

	/* Initialize and enable SW */
	PORTE->PCR[18] |= PORT_PCR_MUX(1);
	PORTE->PCR[19] |= PORT_PCR_MUX(1);
	PORTE->PCR[31] |= PORT_PCR_MUX(1);

	/* Enable internal pullup resistor */
	PORTE->PCR[18] |= PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	PORTE->PCR[19] |= PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	PORTE->PCR[31] |= PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;

	PTE->PDDR &= ~((1u << 18) | (1u << 19) | (1u << 31));

	while (true) {
		/* Check whether occur interupt and toggle LED */
		if (pitIsrFlag) {

			//evaluate ports
			state = (((PTE->PDIR) >> 18) & 0x01U)
					+ (((PTE->PDIR) >> 19) & 0x01U)
					+ (((PTE->PDIR) >> 31) & 0x01U);

			switch (state) {
			case ALLOFF:
				PTE->PSOR |= (1U << 2U) | (1U << 3U) | (1U << 6U); //ON LED
				break;
			case ST1: //blink 1Hz
				if (counter == 0) {
					readSwOn();
				} else {
					PTE->PSOR |= (1U << 2U) | (1U << 3U) | (1U << 6U); //ON LED
				}
				counter >= 1 ? counter = 0 : counter++;
				break;
			case ST2:
				if (counter == 0) {
					readSwOn();
				} else if (counter == 2) {
					readSwOn();
				} else {
					PTE->PSOR |= (1U << 2U) | (1U << 3U) | (1U << 6U); //ON LED
				}
				counter >= 3 ? counter = 0 : counter++;
				break;
			case ST3:
				if (counter == 0) {
					PTE->PCOR = (1U << 2U); //OFF led Toggle on target S1
				} else if (counter == 2) {
					PTE->PCOR = (1U << 3U); //OFF led Toggle on target S2
				} else if (counter == 4) {
					PTE->PCOR = (1U << 6U); //OFF led Toggle on target S3
				} else {
					PTE->PSOR |= (1U << 2U) | (1U << 3U) | (1U << 6U); //ON LED
				}
				counter >= 5 ? counter = 0 : counter++;
				break;
			}
			pitIsrFlag = false;
		}
	}
}
