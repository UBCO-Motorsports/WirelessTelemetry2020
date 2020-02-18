/* ###################################################################
**     Filename    : main.c
**     Processor   : S32K11x
**     Abstract    :
**         Main module.
**         This module contains user's application code.
**     Settings    :
**     Contents    :
**         No public methods
**
** ###################################################################*/
/*!
** @file main.c
** @version 01.00
** @brief
**         Main module.
**         This module contains user's application code.
*/
/*!
**  @addtogroup main_module main module documentation
**  @{
*/
/* MODULE main */


/* Including necessary module. Cpu.h contains other modules needed for compiling.*/
#include "Cpu.h"
#include <math.h>

  volatile int exit_code = 0;

/* User includes (#include below this line is not maintained by Processor Expert) */

//Hardware definitions
//LED1
#define LED1PORT PTA
#define LED1PIN 13
//LED2
#define LED2PORT PTA
#define LED2PIN 12


//Variables
volatile int send_WD = 0;

//Converts an 16 bit integer into a string ready for UART output
uint8_t Char_Convert (uint16_t input, uint8_t *output, uint8_t offset);
uint8_t Char_Convert (uint16_t input, uint8_t *output, uint8_t offset) {
uint16_t temp = input;
uint8_t curDigit = 0;
uint8_t asciiDigit = 0;
uint8_t tempOut[8] = {0};
int i = 0;
if (temp == 0) {
//If zero, output asccii zero
tempOut[0] = 48U;
} else {
while (temp > 0) {
//Extract next digit

curDigit = (temp % 10);

//Convert digit to ascii
asciiDigit =  curDigit + 48U;
//Load into output array
tempOut[i] = asciiDigit;
i++;
temp = temp / 10;
}
}
//Loop through string reversing endianess for UART
int i2 = i;
while (i2 >= 0 ) {
output[i-i2 + offset] = tempOut[i2];
i2--;
}

return i+1;
}





void Init_SBC(void);
void Init_SBC(void) {
	uint8_t rec_buffer[2];
	uint8_t SBC_Setup[2];


	//Setup watchdog
	SBC_Setup[0] = 0x0;
	SBC_Setup[1] = 0xE;
	LPSPI_DRV_MasterTransferBlocking(LPSPICOM1,SBC_Setup, rec_buffer, 2, 1000);


	//Force normal mode and enable v2 for CAN transciever
	SBC_Setup[0] = 0x0;
	SBC_Setup[1] = 0x2E;
	LPSPI_DRV_MasterTransferBlocking(LPSPICOM1,SBC_Setup, rec_buffer, 2, 1000);
}

void FeedWatchDog (void);
void FeedWatchDog(void) {
	uint8_t SBC_Setup[2];
	SBC_Setup[0] = 0x0;
	SBC_Setup[1] = 0xE;
	status_t result;
	result = LPSPI_DRV_MasterTransferBlocking(LPSPICOM1, SBC_Setup, NULL, 2, 1000);
	//result = LPSPI_DRV_MasterTransfer(LPSPICOM1, SBC_Setup, NULL, 2);
}

void LPIT_ISR(void);
void LPIT_ISR(void) {
	send_WD = 1;
	LPIT_DRV_ClearInterruptFlagTimerChannels(INST_LPIT1,1);
}

void SendCANData(uint32_t mailbox, uint32_t messageId, uint8_t * data, uint32_t len)
{
    flexcan_data_info_t dataInfo =
    {
            .data_length = 2,
            .msg_id_type = FLEXCAN_MSG_ID_STD,
    };

    /* Configure TX message buffer with index TX_MSG_ID and TX_MAILBOX*/
    FLEXCAN_DRV_ConfigTxMb(INST_CANCOM1, mailbox, &dataInfo, messageId);

    /* Execute send non-blocking */
    FLEXCAN_DRV_Send(INST_CANCOM1, mailbox, &dataInfo, messageId, data);
}


void Init_Board(void);
void  Init_Board(void) {

	//Initialize clock and set configuration
	CLOCK_SYS_Init(g_clockManConfigsArr, CLOCK_MANAGER_CONFIG_CNT, g_clockManCallbacksArr, CLOCK_MANAGER_CALLBACK_CNT);
	CLOCK_SYS_UpdateConfiguration(0U, CLOCK_MANAGER_POLICY_AGREEMENT);

	//Initialize pins
	PINS_DRV_Init(NUM_OF_CONFIGURED_PINS, g_pin_mux_InitConfigArr);
	//Turn on both LEDS on the board
	PINS_DRV_WritePin(LED1PORT, LED1PIN, 1);
	PINS_DRV_WritePin(LED2PORT, LED2PIN, 1);

	//Initialize CAN and message buffer masks
	FLEXCAN_DRV_Init(INST_CANCOM1, &canCom1_State, &canCom1_InitConfig0);

	//Initialize SPI
	LPSPI_DRV_MasterInit(LPSPICOM1,&lpspiCom1State,&lpspiCom1_MasterConfig0);

	//Initialize UART
	LPUART_DRV_Init(INST_LPUART1, &lpuart1_State, &lpuart1_InitConfig0);

	//Initialize timer interrupt for SBC watchdog triggering
	LPIT_DRV_Init(INST_LPIT1, &lpit1_InitConfig);
	LPIT_DRV_InitChannel(INST_LPIT1, 0U, &lpit1_ChnConfig0);
	LPIT_DRV_SetTimerPeriodByUs(INST_LPIT1, 0U, 100000);
	LPIT_DRV_StartTimerChannels(INST_LPIT1,1);
	//Install LPIT Interrupt handler
	INT_SYS_InstallHandler(LPIT0_IRQn, &LPIT_ISR, (isr_t *)0);

	//Initialize SBC
	Init_SBC();
	//FeedWatchDog();
}

//CAN bus init data
const flexcan_data_info_t dataInfo =
	{
			.data_length = 8U,
			.msg_id_type = FLEXCAN_MSG_ID_STD,
	};

volatile flexcan_msgbuff_t data;

struct message {
	uint32_t id;
	uint8_t  bit;
	uint16_t value;
	double scaling;
	double offset;
};
volatile struct message messageArray[] = {


		{0x360UL, 0, 0,    1,     0}, //Engine RPM values
		{0x361UL, 2, 0,    1,     -1013}, //Oil Pressure values
		{0x390UL, 0, 10,    1,     0}, //Oil Temperature

		{0x3E0UL, 0, 0,    1,     -2730}, //Coolant Temperature values
		{0x360UL, 4, 0,    1,     0}, //Throttle Position values
		{0x390UL, 0, 10,    1,     0}, //Brake Pressure

		{0x390UL, 0, 10,    1,     0}, //Brake Bias
		{0x390UL, 0, 10,    1,     0}, //Lat Accel
		{0x373UL, 0, 10,    1,     -2730}, //EGT 1

		{0x368UL, 0, 0,    1,     0}, //Wideband values
		{0x390UL, 0, 10,    1,     0}, //GPS Speed
		{0x3EBUL, 4, 0,    1,     0}, //Ignition Angle values

		{0x390UL, 0, 10	,    1,     0}, //Long Accel

};
const int messageArrayLength = sizeof(messageArray)/sizeof(messageArray[0]);

//Parse data from the frame and put it into message array
void parse_data(flexcan_msgbuff_t *data);
void parse_data(flexcan_msgbuff_t *data){
	int i;
	//Go through all messages in array and update the data in the messages with same ID
	for(i=0; i<messageArrayLength; i++){
		if(messageArray[i].id == data->msgId){
			messageArray[i].value = (data->data[messageArray[i].bit+1] & 0xFF)
								   + ((data->data[messageArray[i].bit] << 8) & 0xF00);
		}
	}
}

//Setup the CAN message callback
void CANCallback(uint8_t instance, flexcan_event_type_t eventType,
        uint32_t buffIdx, flexcan_state_t *flexcanState );
void CANCallback(uint8_t instance, flexcan_event_type_t eventType,
        uint32_t buffIdx, flexcan_state_t *flexcanState ) {

	if (eventType == FLEXCAN_EVENT_RX_COMPLETE) {
		switch (buffIdx) {
			case 0UL:
					parse_data(&data);
					FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 0UL, &dataInfo, 0x360UL); //Engine RPM values
					FLEXCAN_DRV_Receive(INST_CANCOM1,0UL,&data);
					break;
			case 1UL:
					parse_data(&data);
					FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 1UL, &dataInfo, 0x361UL); //Oil Pressure values
					FLEXCAN_DRV_Receive(INST_CANCOM1,1UL,&data);
					break;
			case 2UL:
					parse_data(&data);
					FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 2UL, &dataInfo, 0x3E0UL); //Coolant Temperature values
					FLEXCAN_DRV_Receive(INST_CANCOM1,2UL,&data);
					break;
			case 3UL:
					parse_data(&data);
					FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 3UL, &dataInfo, 0x368UL); //Wideband values
					FLEXCAN_DRV_Receive(INST_CANCOM1,3UL,&data);
					break;
			case 4UL:
					parse_data(&data);
					FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 4UL, &dataInfo, 0x3EBUL); //Ignition Angle values
					FLEXCAN_DRV_Receive(INST_CANCOM1,4UL,&data);
					break;
			case 5UL:
					parse_data(&data);
					FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 5UL, &dataInfo, 0x373UL); //Ignition Angle values
					FLEXCAN_DRV_Receive(INST_CANCOM1,5UL,&data);
					break;
			default:
				break;
		}
	}
}


void init_CAN(void);
void init_CAN(void){
	//Initialize message buffers
	FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 0UL, &dataInfo, 0x360UL); //Engine RPM values
	FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 1UL, &dataInfo, 0x361UL); //Oil Pressure values
	FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 2UL, &dataInfo, 0x3E0UL); //Coolant Temperature values
	FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 3UL, &dataInfo, 0x368UL); //Wideband values
	FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 4UL, &dataInfo, 0x3EBUL); //Ignition Angle values
	FLEXCAN_DRV_ConfigRxMb(INST_CANCOM1, 5UL, &dataInfo, 0x373UL); //Ignition Angle values

	//Install callback
	FLEXCAN_DRV_InstallEventCallback(INST_CANCOM1, CANCallback,NULL);

	//Start receiving
	FLEXCAN_DRV_Receive(INST_CANCOM1,0UL, &data);
	FLEXCAN_DRV_Receive(INST_CANCOM1,1UL, &data);
	FLEXCAN_DRV_Receive(INST_CANCOM1,2UL, &data);
	FLEXCAN_DRV_Receive(INST_CANCOM1,3UL, &data);
	FLEXCAN_DRV_Receive(INST_CANCOM1,4UL, &data);
	FLEXCAN_DRV_Receive(INST_CANCOM1,5UL, &data);
}


//Insert Double into a message



/*!
  \brief The main function for the project.
  \details The startup initialization sequence is the following:
 * - startup asm routine
 * - main()
*/
int main(void)
{
  /* Write your local variable definition here */

  /*** Processor Expert internal initialization. DON'T REMOVE THIS CODE!!! ***/
  #ifdef PEX_RTOS_INIT
    PEX_RTOS_INIT();                   /* Initialization of the selected RTOS. Macro is defined by the RTOS component. */
  #endif
  /*** End of Processor Expert internal initialization.                    ***/

  /* Write your code here */


    Init_Board();
	init_CAN();

    for (;;) {

    	if (send_WD == 1) {
    		FeedWatchDog();
    		send_WD = 0;

    		//Init CAN messages


    		uint8_t uartmessage[128];
    		uint8_t length;
    		int i;
    		double value;
    		uint16_t valueBeforeDecimal;
    		uint16_t valueAfterDecimal;

    		length = 0;
    		value = messageArray[0].value * messageArray[0].scaling +messageArray[0].offset;
    		valueBeforeDecimal = (uint16_t)floor(value);
    		valueAfterDecimal = (uint16_t)round((value - valueBeforeDecimal)*10);

    		length = length + Char_Convert((uint16_t)(valueBeforeDecimal), uartmessage, length);
//    		uartmessage[length] = 46;
//    		length++;
//    		length = length + Char_Convert((uint16_t)(valueAfterDecimal), uartmessage, length);


    		for (i = 1;i<messageArrayLength;i++) {
    		uartmessage[length] = 44;
    		length++;
//    		uartmessage[length] = 32;
//    		length++;
    		//Scale the value from the message and split it into value before and after decimal place
    		value = messageArray[i].value * messageArray[i].scaling +messageArray[i].offset;
    		if (value >=0){
				valueBeforeDecimal = floor(value);
				valueAfterDecimal =  round((value - valueBeforeDecimal)*10);
    		}else{
        		uartmessage[length] = 45;
        		length++;
    			value = -value;
				valueBeforeDecimal = floor(value);
				valueAfterDecimal =  floor((value - valueBeforeDecimal)*10);
    		}
    		length = length + Char_Convert(valueBeforeDecimal, uartmessage, length);
//    		uartmessage[length] = 46;
//    		length++;
//    		length = length + Char_Convert(valueAfterDecimal, uartmessage, length);
    		}



    		//\r\n
    		uartmessage[length] = 13;
    		uartmessage[length+1] = 10;
    		LPUART_DRV_SendDataBlocking(INST_LPUART1,uartmessage, length+2, 1000);


    		uint8_t receiveBuffer[8];
    		receiveBuffer[0] = 0;
    		LPUART_DRV_ReceiveDataBlocking(INST_LPUART1,receiveBuffer,1,10);

//    		//Example sending over UART
//
//    		uint8_t uartmessage[8];
//    		uint8_t length;
//    		length = Char_Convert(messageArray[0].value, uartmessage);
//
//
//			//\r\n
//    		uartmessage[length] = 13;
//    		uartmessage[length+1] = 10;
//    		LPUART_DRV_SendDataBlocking(INST_LPUART1,uartmessage, length+2, 1000);


    		PINS_DRV_TogglePins(LED1PORT, 1 << LED1PIN);
    	}
    }


  /*** Don't write any code pass this line, or it will be deleted during code generation. ***/
  /*** RTOS startup code. Macro PEX_RTOS_START is defined by the RTOS component. DON'T MODIFY THIS CODE!!! ***/
  #ifdef PEX_RTOS_START
    PEX_RTOS_START();                  /* Startup of the selected RTOS. Macro is defined by the RTOS component. */
  #endif
  /*** End of RTOS startup code.  ***/
  /*** Processor Expert end of main routine. DON'T MODIFY THIS CODE!!! ***/
  for(;;) {
    if(exit_code != 0) {
      break;
    }
  }
  return exit_code;
  /*** Processor Expert end of main routine. DON'T WRITE CODE BELOW!!! ***/
} /*** End of main routine. DO NOT MODIFY THIS TEXT!!! ***/

/* END main */
/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.1 [05.21]
**     for the Freescale S32K series of microcontrollers.
**
** ###################################################################
*/
