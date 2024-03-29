# 1 "main.c"
# 1 "/home/linux/Documents/STM/STM32F401CC/led_blink//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 11 "main.c"
volatile unsigned int *RCC_CR = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR = (volatile unsigned int *)0x40023804;
volatile unsigned int *RCC_CFGR = (volatile unsigned int *)0x40023808;
volatile unsigned int *RCC_AHB1ENR = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_APB2ENR = (volatile unsigned int *)0x40023844;

volatile unsigned int *GPIOC_MODER = (volatile unsigned int *)0x40020800;
volatile unsigned int *GPIOC_OTYPER = (volatile unsigned int *)0x40020804;
volatile unsigned int *GPIOC_ODR = (volatile unsigned int *)0x40020814;

volatile unsigned int *STK_CTRL = (volatile unsigned int *)0xE000E010;
volatile unsigned int *STK_LOAD = (volatile unsigned int *)0xE000E014;
volatile unsigned int *STK_VAL = (volatile unsigned int *)0xE000E018;

volatile unsigned int *TIM10_CR1 = (volatile unsigned int *)0x40014400;
volatile unsigned int *TIM10_CNT = (volatile unsigned int *)0x40014424;
volatile unsigned int *TIM10_PSC = (volatile unsigned int *)0x40014428;
volatile unsigned int *TIM10_ARR = (volatile unsigned int *)0x4001442C;
volatile unsigned int *TIM10_SR = (volatile unsigned int *)0x40014410;
volatile unsigned int *TIM10_EGR = (volatile unsigned int *)0x40014414;
volatile unsigned int *TIM10_DIER = (volatile unsigned int *)0x4001440C;

void RCC_CONFIG(void);
void TIMER10_CONFIG(void);

void GPIO_CONFIG(void);
void LED_BLINK(void);

int main()
{

     RCC_CONFIG();
     TIMER10_CONFIG();

     GPIO_CONFIG();
     while(1)
     {
      LED_BLINK();
     }
}

void RCC_CONFIG(void)
{
      *RCC_AHB1ENR = *RCC_AHB1ENR |(1<<2);
      *RCC_CR = *RCC_CR &(~0x00010000);
      *RCC_CR = *RCC_CR | (1<<16);
      while((*RCC_CR & 1<<17)==0);

      *RCC_CFGR = *RCC_CFGR & (~0x00000003);
      *RCC_CFGR = *RCC_CFGR | (1<<0);
     while(!(*RCC_CFGR & 0x00000004)==4);

      *RCC_APB2ENR = *RCC_APB2ENR |(1<<17);

}
void TIMER10_CONFIG()
{

  *TIM10_CR1 = *TIM10_CR1 |(1<<7);


 *TIM10_CR1 = *TIM10_CR1 &~(0<<3);


 *TIM10_CR1 = *TIM10_CR1 &~(0<<2);


 *TIM10_CR1 = *TIM10_CR1 &~(0<<1);


 *TIM10_DIER = *TIM10_DIER |(1<<0);


 *TIM10_SR = *TIM10_SR &~(1<<0);


 *TIM10_EGR = *TIM10_EGR |(1<<0);


  *TIM10_CNT = 1000;

 *TIM10_PSC = 25000;


 *TIM10_ARR = 1000;

 *TIM10_CR1 = *TIM10_CR1 |(1<<0);


}

void GPIO_CONFIG(void)
{
       *GPIOC_MODER = 0x04000000;
       *GPIOC_OTYPER = 0x00002000;
       *GPIOC_ODR = 0x00002000;
}
void LED_BLINK(void)
{


        while(!(*TIM10_SR & (1<<0)));
       *TIM10_SR = *TIM10_SR & (~(1<<0));

  if(*GPIOC_ODR & 0x00002000)
    {

  *GPIOC_ODR = *GPIOC_ODR &(~0x00002000);
    }
  else
   {
         *GPIOC_ODR = *GPIOC_ODR |(0x00002000);

   }






}
