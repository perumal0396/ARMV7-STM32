# 1 "main.c"
# 1 "/home/linux/Documents/STM/STM32F401CC/TIMER9_INTERRUPT//"
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

volatile unsigned int *TIM9_CR1 = (volatile unsigned int *)0x40014000;
volatile unsigned int *TIM9_CNT = (volatile unsigned int *)0x40014024;
volatile unsigned int *TIM9_PSC = (volatile unsigned int *)0x40014028;
volatile unsigned int *TIM9_ARR = (volatile unsigned int *)0x4001402C;
volatile unsigned int *TIM9_SR = (volatile unsigned int *)0x40014010;
volatile unsigned int *TIM9_EGR = (volatile unsigned int *)0x40014014;
volatile unsigned int *TIM9_DIER = (volatile unsigned int *)0x4001400C;

volatile unsigned int (*NVIC_ISER)[8] = (volatile unsigned int (*)[8])0xE000E100;
volatile unsigned int (*NVIC_ICER)[8] = (volatile unsigned int (*)[8])0xE000E180;
volatile unsigned int (*NVIC_ISPR)[8] = (volatile unsigned int (*)[8])0xE000E200;
volatile unsigned int (*NVIC_ICPR)[8] = (volatile unsigned int (*)[8])0xE000E280;
volatile unsigned int (*NVIC_IABR)[8] = (volatile unsigned int (*)[8])0xE000E300;
volatile unsigned int (*NVIC_IPR)[60] = (volatile unsigned int (*)[60])0xE000E400;


void TIM1_BRK_TIM9_IRQHandler(void);
void RCC_CONFIG(void);
void TIMER9_CONFIG(void);
void NVIC_CONFIG(void);
void GPIO_CONFIG(void);
void LED_BLINK(void);

int main()
{
     RCC_CONFIG();
     TIMER9_CONFIG();
     GPIO_CONFIG();
     NVIC_CONFIG();
     while(1)
     {

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

      *RCC_APB2ENR = *RCC_APB2ENR |(1<<16);

}
void TIMER9_CONFIG(void)
{
        *TIM9_CR1 = *TIM9_CR1 |(1<<7);

        *TIM9_CR1 = *TIM9_CR1 &~(0<<3);

        *TIM9_CR1 = *TIM9_CR1 &~(0<<2);

        *TIM9_CR1 = *TIM9_CR1 &~(0<<1);

        *TIM9_DIER = *TIM9_DIER |(1<<0);

        *TIM9_SR = *TIM9_SR &~(1<<0);

        *TIM9_EGR = *TIM9_EGR |(1<<0);

        *TIM9_CNT = 100;

 *TIM9_PSC = 1000;

        *TIM9_ARR = 2500;

        *TIM9_CR1 = *TIM9_CR1 |(1<<0);

}
  void NVIC_CONFIG(void)
  {


        (*NVIC_ICPR)[0] = (*NVIC_ICPR)[0] |(1<<24);


 (*NVIC_ISER)[0] = (*NVIC_ISER)[0] |(1<<24);
  }

void GPIO_CONFIG(void)
{
       *GPIOC_MODER = 0x04000000;
       *GPIOC_OTYPER = 0x00002000;
       *GPIOC_ODR = 0x00002000;
}
void LED_BLINK(void)
{


        while(!(*TIM9_SR & (1<<0)));
        *TIM9_SR = *TIM9_SR & (~(1<<0));

  if(*GPIOC_ODR & 0x00002000)
    {

  *GPIOC_ODR = *GPIOC_ODR &(~0x00002000);
    }
  else
   {

    *GPIOC_ODR = *GPIOC_ODR |(0x00002000);
     }







}
void TIM1_BRK_TIM9_IRQHandler(void)
{

 *TIM9_SR = *TIM9_SR & (~(1<<0));
          if(*GPIOC_ODR & 0x00002000)
         {
                 *GPIOC_ODR = *GPIOC_ODR &(~0x00002000);

          }
          else
          {
                 *GPIOC_ODR = *GPIOC_ODR |(0x00002000);

          }
}
