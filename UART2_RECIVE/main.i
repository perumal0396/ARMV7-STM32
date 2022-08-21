# 1 "main.c"
# 1 "/home/linux/Documents/STM/STM32F401CC/UART2_RECIVE//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 10 "main.c"
volatile unsigned int *RCC_CR = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR = (volatile unsigned int *)0x40023804;
volatile unsigned int *RCC_CFGR = (volatile unsigned int *)0x40023808;
volatile unsigned int *RCC_AHB1ENR = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_APB2ENR = (volatile unsigned int *)0x40023844;
volatile unsigned int *RCC_APB1ENR = (volatile unsigned int *)0x40023840;

volatile unsigned int *GPIOB_MODER = (volatile unsigned int *)0x40020400;
volatile unsigned int *GPIOB_OTYPER = (volatile unsigned int *)0x40020404;
volatile unsigned int *GPIOB_ODR = (volatile unsigned int *)0x40020414;
volatile unsigned int *GPIOB_PUPDR = (volatile unsigned int *)0x4002040C;
volatile unsigned int *GPIOB_AFRL = (volatile unsigned int *)0x40020420;
volatile unsigned int *GPIOB_AFRH = (volatile unsigned int *)0x40020424;

volatile unsigned int *GPIOA_MODER = (volatile unsigned int *)0x40020000;
volatile unsigned int *GPIOA_OTYPER = (volatile unsigned int *)0x40020004;
volatile unsigned int *GPIOA_ODR = (volatile unsigned int *)0x40020014;
volatile unsigned int *GPIOA_PUPDR = (volatile unsigned int *)0x4002000C;
volatile unsigned int *GPIOA_AFRL = (volatile unsigned int *)0x40020020;


volatile unsigned int *TIM10_CR1 = (volatile unsigned int *)0x40014400;
volatile unsigned int *TIM10_CNT = (volatile unsigned int *)0x40014424;
volatile unsigned int *TIM10_PSC = (volatile unsigned int *)0x40014428;
volatile unsigned int *TIM10_ARR = (volatile unsigned int *)0x4001442C;
volatile unsigned int *TIM10_SR = (volatile unsigned int *)0x40014410;
volatile unsigned int *TIM10_EGR = (volatile unsigned int *)0x40014414;
volatile unsigned int *TIM10_DIER = (volatile unsigned int *)0x4001440C;
volatile unsigned int *TIM10_CCMR1 = (volatile unsigned int *)0x40014418;
volatile unsigned int *TIM10_CCR1 = (volatile unsigned int *)0x40014434;
volatile unsigned int *TIM10_CCER = (volatile unsigned int *)0x40014420;


volatile unsigned int (*NVIC_ISER)[8] = (volatile unsigned int (*)[8])0xE000E100;
volatile unsigned int (*NVIC_ICER)[8] = (volatile unsigned int (*)[8])0xE000E180;
volatile unsigned int (*NVIC_ISPR)[8] = (volatile unsigned int (*)[8])0xE000E200;
volatile unsigned int (*NVIC_ICPR)[8] = (volatile unsigned int (*)[8])0xE000E280;
volatile unsigned int (*NVIC_IABR)[8] = (volatile unsigned int (*)[8])0xE000E300;
volatile unsigned int (*NVIC_IPR)[60] = (volatile unsigned int (*)[60])0xE000E400;


volatile unsigned int *USART2_SR = (volatile unsigned int *)0x40004400;
volatile unsigned int *USART2_DR = (volatile unsigned int *)0x40004404;
volatile unsigned int *USART2_BRR = (volatile unsigned int *)0x40004408;
volatile unsigned int *USART2_CR1 = (volatile unsigned int *)0x4000440C;
volatile unsigned int *USART2_CR2 = (volatile unsigned int *)0x40004410;
volatile unsigned int *USART2_CR3 = (volatile unsigned int *)0x40004414;
volatile unsigned int *USART2_GTPR = (volatile unsigned int *)0x40004418;


void RCC_CONFIG(void);
void TIMER10_CONFIG(void);
void GPIO_CONFIG(void);

void USART2_INIT(void);
unsigned char USART2_RX(void);
void USART2_TX(unsigned char var);
void print(char *s);
void delay(void);

int main()
{
  unsigned int tmp;
     RCC_CONFIG();
     GPIO_CONFIG();
     USART2_INIT();

     while(1)
     {
     tmp= USART2_RX();
     USART2_TX(tmp);

    }
}
void RCC_CONFIG(void)
{
      *RCC_AHB1ENR = *RCC_AHB1ENR |(1<<2);
      *RCC_AHB1ENR = *RCC_AHB1ENR |(1<<1);
      *RCC_AHB1ENR = *RCC_AHB1ENR |(1<<0);

      *RCC_CR = *RCC_CR &(~0x00010000);
      *RCC_CR = *RCC_CR | (1<<16);
      while((*RCC_CR & 1<<17)==0);

      *RCC_CFGR = *RCC_CFGR & (~0x00000003);
      *RCC_CFGR = *RCC_CFGR | (1<<0);
      while(!(*RCC_CFGR & 0x00000004)==4);

      *RCC_APB2ENR = *RCC_APB2ENR |(1<<17);

      *RCC_APB1ENR = *RCC_APB1ENR|(1<<17);
}
void GPIO_CONFIG(void)
{
       *GPIOA_MODER = *GPIOA_MODER &~(0x0f<<4);
       *GPIOA_MODER = *GPIOA_MODER |(0x0A<<4);

       *GPIOA_OTYPER = *GPIOA_OTYPER &~(0<<2);

       *GPIOA_PUPDR = *GPIOA_PUPDR &~(0x0f<<4);

       *GPIOA_AFRL = *GPIOA_AFRL &~(0xf<<8);
       *GPIOA_AFRL = *GPIOA_AFRL |(7<<8);

       *GPIOA_AFRL = *GPIOA_AFRL &~(0xf<<12);
       *GPIOA_AFRL = *GPIOA_AFRL |(7<<12);
}
void USART2_INIT(void)
{

 *USART2_CR1 = *USART2_CR1 |(1<<13);

 *USART2_BRR = *USART2_BRR &~(0xfff<<4);

 *USART2_BRR = *USART2_BRR |(325<<4);

 *USART2_BRR = *USART2_BRR &~(0x0000000f);

        *USART2_BRR = *USART2_BRR|4;

 *USART2_CR1 = *USART2_CR1 |(1<<15);

 *USART2_CR1 = *USART2_CR1 &~(1<<12);

 *USART2_CR1 = *USART2_CR1 |(1<<2);

        *USART2_CR1 = *USART2_CR1 |(1<<3);
}
unsigned char USART2_RX(void)
{

  while(!(*USART2_SR & 1<<5));
          return *USART2_DR;

}

void USART2_TX(unsigned char var)
{
 *USART2_SR = *USART2_SR &~(1<<6);

 while(!(*USART2_SR & 1<<7));
        *USART2_DR=var;

 *USART2_DR=var;
 while(!(*USART2_SR & 1<<6));


}
void print(char *s)
{
 while(*s)
 {

  USART2_TX(*s++);
 }
}
void delay()
{

 volatile unsigned int i=0;
 for(i=0;i<1000000;i++);
}
