/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-I2C1 and MPU6050      */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/

#ifndef MAIN_H
#define MAIN_H


#include<string.h>




//interrupt
volatile unsigned int (*NVIC_ISER)[8] = (volatile unsigned int (*)[8])0xE000E100;
volatile unsigned int (*NVIC_ICER)[8] = (volatile unsigned int (*)[8])0xE000E180;
volatile unsigned int (*NVIC_ISPR)[8] = (volatile unsigned int (*)[8])0xE000E200;
volatile unsigned int (*NVIC_ICPR)[8] = (volatile unsigned int (*)[8])0xE000E280;
volatile unsigned int (*NVIC_IABR)[8] = (volatile unsigned int (*)[8])0xE000E300;
volatile unsigned int (*NVIC_IPR)[60] = (volatile unsigned int (*)[60])0xE000E400;

struct USART_s
{
	unsigned int SR;	//0x00
	unsigned int DR;	//0x04
	unsigned int BRR;	//0x08	
	unsigned int CR1;	//0x0C
	unsigned int CR2;	//0x10
	unsigned int CR3;	//0x14
	unsigned int GTPR;	//0x18
};
struct USART_s *USART1 = (struct USART_s *)0x40011000;

struct RCC_s
{
	unsigned int CR; 	   //0x00
	unsigned int PLLCFGR;  //0x04
	unsigned int CFGR;	   //0x08
	unsigned int CIR;
	unsigned int AHB1RSTR;
	unsigned int AHB2RSTR;
	unsigned int reserved1;
	unsigned int reserved2;
	unsigned int APB1RSTR;
	unsigned int APB2RSTR;
	unsigned int reserved3;
	unsigned int reserved4;
	unsigned int AHB1ENR;
	unsigned int AHB2ENR;
	unsigned int reserved5;
	unsigned int reserved6;
	unsigned int APB1ENR;
	unsigned int APB2ENR;
	unsigned int reserved7;
	unsigned int reserved8;
	unsigned int AHB1LPENR;
	unsigned int AHB2LPENR;
	unsigned int reserved9;
	unsigned int reserved10;
	unsigned int APB1LPENR;
	unsigned int APB2LPENR;
	unsigned int reserved11;
	unsigned int reserved12;
	unsigned int BDCR;
	unsigned int CSR;
	unsigned int reserved13;
	unsigned int reserved14;
	unsigned int SSCGR;
	unsigned int PLLI2SCFGR;
	unsigned int DCKCFGR;
};
struct RCC_s *RCC = (struct RCC_s *)0x40023800;

struct GPIO_s
{

	unsigned int MODER;  //0x00
	unsigned int OTYPER; //0x04 
	unsigned int OSPEEDR;//0x08
	unsigned int PUPDR;  //0x0c
	unsigned int IDR;    //0x20
	unsigned int ODR;    //0x14
	unsigned int BSRR;   
	unsigned int LCKR;
	unsigned int AFRL;   //0x20
	unsigned int AFRH;   //0x24
};
struct GPIO_s *GPIOA = (struct GPIO_s *)0x40020000;
struct GPIO_s *GPIOB = (struct GPIO_s *)0x40020400;
struct GPIO_s *GPIOC = (struct GPIO_s *)0x40020800;


struct I2C_s
{
	unsigned int CR1;  //0x00
	unsigned int CR2;  //0x04
	unsigned int OAR1; //0x08
	unsigned int OAR2; //0x0c
	unsigned int DR;   //0x10
	unsigned int SR1;  //0x14
	unsigned int SR2;  //0x18
	unsigned int CCR;  //0x1c
	unsigned int TRISE;//0x20
	unsigned int FLTR; //0x24
};

struct I2C_s *I2C1 = (struct I2C_s *)0x40005400;

struct DMA_STREAM_s
{

	unsigned int CR;
	unsigned int NDTR;
	unsigned int PAR;
	unsigned int M0AR;
	unsigned int M1AR;
	unsigned int FCR;

};

struct DMA_s
{

	unsigned int LISR;
	unsigned int HISR;
	unsigned int LIFCR;
	unsigned int HIFCR;
	struct DMA_STREAM_s S[8];
};
struct DMA_s *DMA2 = (struct DMA_s *)0x40026400;



void RCC_CONFIG(void);
void GPIO_CONFIG(void);

void USART1_INIT(void);


//I2C_FUNCTION
void I2C1_EV_IRQHandler(void);
void i2c1_init(void);
void i2c1_write(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes );
void i2c1_read(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes );
void NVIC_CONFIG(void);


void DMA_INIT(void);
void DMA2_SEND(unsigned int src,int len);

#endif
