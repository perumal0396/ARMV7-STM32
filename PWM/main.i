# 1 "main.c"
# 1 "/home/linux/Documents/STM/STM32F401CC/PWM//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 11 "main.c"
volatile unsigned int *RCC_CR = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR = (volatile unsigned int *)0x40023804;
volatile unsigned int *RCC_CFGR = (volatile unsigned int *)0x40023808;
volatile unsigned int *RCC_AHB1ENR = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_APB2ENR = (volatile unsigned int *)0x40023844;


volatile unsigned int *GPIOB_MODER = (volatile unsigned int *)0x40020400;
volatile unsigned int *GPIOB_OTYPER = (volatile unsigned int *)0x40020404;
volatile unsigned int *GPIOB_ODR = (volatile unsigned int *)0x40020414;
volatile unsigned int *GPIOB_PUPDR = (volatile unsigned int *)0x4002040C;
volatile unsigned int *GPIOB_AFRL = (volatile unsigned int *)0x40020420;
volatile unsigned int *GPIOB_AFRH = (volatile unsigned int *)0x40020424;


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

void RCC_CONFIG(void);
void TIMER10_CONFIG(void);
void GPIO_CONFIG(void);
void TIMER10_LED(void);
void delay(void);
int main()
{
  unsigned int i;
     RCC_CONFIG();
     TIMER10_CONFIG();
     GPIO_CONFIG();
     while(1)
     {
     for(i=25;i<=50;i++)
      {
           *TIM10_CCR1 = i;
      delay();
         }
      for(i=50;i>=25;i--)
         {
         *TIM10_CCR1 = i;
           delay();
 }
    }
}
void RCC_CONFIG(void)
{
      *RCC_AHB1ENR = *RCC_AHB1ENR |(1<<2);
      *RCC_AHB1ENR = *RCC_AHB1ENR |(1<<1);
      *RCC_CR = *RCC_CR &(~0x00010000);
      *RCC_CR = *RCC_CR | (1<<16);
      while((*RCC_CR & 1<<17)==0);

      *RCC_CFGR = *RCC_CFGR & (~0x00000003);
      *RCC_CFGR = *RCC_CFGR | (1<<0);
      while(!(*RCC_CFGR & 0x00000004)==4);

      *RCC_APB2ENR = *RCC_APB2ENR |(1<<17);
}
void TIMER10_CONFIG(void)
{

 *TIM10_CR1 = *TIM10_CR1 |(1<<7);

 *TIM10_CR1 = *TIM10_CR1 &~(0<<3);

 *TIM10_CR1 = *TIM10_CR1 &~(0<<2);

 *TIM10_CR1 = *TIM10_CR1 &~(0<<1);

 *TIM10_SR = *TIM10_SR &~(1<<0);

 *TIM10_EGR = *TIM10_EGR |(1<<0);

 *TIM10_CNT = 0;

 *TIM10_PSC = 1000;

 *TIM10_ARR = 500;

        *TIM10_CCMR1 = *TIM10_CCMR1 &~(0x7<<4);

        *TIM10_CCMR1 = *TIM10_CCMR1 |(6<<4);

        *TIM10_CCER = *TIM10_CCER |(1<<0);



 *TIM10_CR1 = *TIM10_CR1 |(1<<0);
}
void GPIO_CONFIG(void)
{
       *GPIOB_MODER = *GPIOB_MODER &~(1<<17);
       *GPIOB_MODER = *GPIOB_MODER |(1<<17);

       *GPIOB_OTYPER = *GPIOB_OTYPER &~(0<<8);
       *GPIOB_ODR = *GPIOB_ODR |(1<<8);

       *GPIOB_PUPDR = *GPIOB_PUPDR |(1<<17);

       *GPIOB_AFRH = *GPIOB_AFRH &(~0x00000003);
       *GPIOB_AFRH = *GPIOB_AFRH |(0x00000003);
}
void delay()
{

 volatile unsigned int i=0;
 for(i=0;i<1000000;i++);
}
void TIMER10_LED(void)
{
        while(!(*TIM10_SR & (1<<0)));
        *TIM10_SR = *TIM10_SR & (~(1<<0));

 if(*GPIOB_ODR & 1<<8)
 {
  *GPIOB_ODR = *GPIOB_ODR &~(1<<8);
 }
 else
 {

  *GPIOB_ODR = *GPIOB_ODR |(1<<8);
 }
}
