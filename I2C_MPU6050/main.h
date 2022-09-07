/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-UART_DMA              */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/
#ifndef MAIN_H
#define MAIN_H

#include<string.h>
#include<stdio.h>
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
struct USART_s *USART2 = (struct USART_s *)0x40004400;

struct RCC_s
{
	unsigned int CR;	//0x00
	unsigned int PLLCFGR;	//0x04
	unsigned int CFGR;	//0x08
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

	unsigned int MODER;
	unsigned int OTYPER;
	unsigned int OSPEEDR;
	unsigned int PUPDR;
	unsigned int IDR;
	unsigned int ODR;
	unsigned int BSRR;
	unsigned int LCKR;
	unsigned int AFRL;
	unsigned int AFRH;
};
struct GPIO_s *GPIOA = (struct GPIO_s *)0x40020000;
struct GPIO_s *GPIOB = (struct GPIO_s *)0x40020400;


struct I2C_s
{
	unsigned int CR1;
	unsigned int CR2;
	unsigned int OAR1;
	unsigned int OAR2;
	unsigned int DR;
	unsigned int SR1;
	unsigned int SR2;
	unsigned int CCR;
	unsigned int TRISE;
	unsigned int FLTR;
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


void usart_init(void);
void usart_tx(unsigned char var);
unsigned char usart_rx(void);
void usart_print(unsigned char *s);

//I2C_FUNCTION
void i2c1_init(void);
void i2c1_write(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes );
void i2c1_read(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes );
void delay(void);

void mpu_read(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes);
void mpu_init(void);
void mpu_calculate(void);

void mpu_tmperature(void);
#endif //MAIN_H