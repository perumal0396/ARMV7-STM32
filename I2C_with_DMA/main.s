	.cpu cortex-m4
	.arch armv7e-m
	.fpu fpv4-sp-d16
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	NVIC_ISER
	.data
	.align	2
	.type	NVIC_ISER, %object
	.size	NVIC_ISER, 4
NVIC_ISER:
	.word	-536813312
	.global	NVIC_ICER
	.align	2
	.type	NVIC_ICER, %object
	.size	NVIC_ICER, 4
NVIC_ICER:
	.word	-536813184
	.global	NVIC_ISPR
	.align	2
	.type	NVIC_ISPR, %object
	.size	NVIC_ISPR, 4
NVIC_ISPR:
	.word	-536813056
	.global	NVIC_ICPR
	.align	2
	.type	NVIC_ICPR, %object
	.size	NVIC_ICPR, 4
NVIC_ICPR:
	.word	-536812928
	.global	NVIC_IABR
	.align	2
	.type	NVIC_IABR, %object
	.size	NVIC_IABR, 4
NVIC_IABR:
	.word	-536812800
	.global	NVIC_IPR
	.align	2
	.type	NVIC_IPR, %object
	.size	NVIC_IPR, 4
NVIC_IPR:
	.word	-536812544
	.global	USART1
	.align	2
	.type	USART1, %object
	.size	USART1, 4
USART1:
	.word	1073811456
	.global	RCC
	.align	2
	.type	RCC, %object
	.size	RCC, 4
RCC:
	.word	1073887232
	.global	GPIOA
	.align	2
	.type	GPIOA, %object
	.size	GPIOA, 4
GPIOA:
	.word	1073872896
	.global	GPIOB
	.align	2
	.type	GPIOB, %object
	.size	GPIOB, 4
GPIOB:
	.word	1073873920
	.global	I2C1
	.align	2
	.type	I2C1, %object
	.size	I2C1, 4
I2C1:
	.word	1073763328
	.global	DMA1
	.align	2
	.type	DMA1, %object
	.size	DMA1, 4
DMA1:
	.word	1073897472
	.global	i2c_tx_buffer
	.bss
	.align	2
	.type	i2c_tx_buffer, %object
	.size	i2c_tx_buffer, 10
i2c_tx_buffer:
	.space	10
	.global	i2c_rx_buffer
	.align	2
	.type	i2c_rx_buffer, %object
	.size	i2c_rx_buffer, 10
i2c_rx_buffer:
	.space	10
	.global	mystr
	.data
	.align	2
	.type	mystr, %object
	.size	mystr, 18
mystr:
	.ascii	"\015\012SCHOOL OF LINUX\000"
	.global	str
	.align	2
	.type	str, %object
	.size	str, 31
str:
	.ascii	"\015\012ARM CORTEX STM32F PROESSOR\015\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 18 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 20 16
	movs	r3, #0
	strb	r3, [r7, #7]
	.loc 1 22 11
	ldr	r0, .L3
	bl	strlen
	mov	r3, r0
	.loc 1 22 6
	str	r3, [r7, #12]
	.loc 1 23 11
	ldr	r0, .L3+4
	bl	strlen
	mov	r3, r0
	.loc 1 23 6
	str	r3, [r7, #8]
	.loc 1 25 6
	bl	RCC_CONFIG
	.loc 1 26 6
	bl	GPIO_CONFIG
	.loc 1 29 3
	bl	i2c1_init
	.loc 1 31 6
	bl	DMA1_TRANSMIT_init
	.loc 1 32 3
	adds	r2, r7, #7
	movs	r3, #1
	movs	r1, #107
	movs	r0, #208
	bl	i2c1_write
	.loc 1 34 3
	bl	DMA1_RECIVE_init
	.loc 1 35 3
	adds	r2, r7, #7
	movs	r3, #1
	movs	r1, #117
	movs	r0, #208
	bl	i2c1_read
.L2:
	.loc 1 37 11 discriminator 1
	b	.L2
.L4:
	.align	2
.L3:
	.word	mystr
	.word	str
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	1
	.global	RCC_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	RCC_CONFIG, %function
RCC_CONFIG:
.LFB1:
	.loc 1 42 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 43 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #48]
	.loc 1 44 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #48]
	.loc 1 45 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #48]
	.loc 1 47 15
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L7
	ldr	r3, [r3]
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 48 15
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #65536
	str	r2, [r3]
	.loc 1 49 12
	nop
.L6:
	.loc 1 49 17 discriminator 1
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 49 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 49 12 discriminator 1
	cmp	r3, #0
	beq	.L6
	.loc 1 51 17
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L7
	ldr	r3, [r3]
	bic	r2, r2, #3
	str	r2, [r3, #8]
	.loc 1 52 17
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #8]
	.loc 1 53 12
	nop
	.loc 1 55 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #68]
	.loc 1 57 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #64]
	.loc 1 59 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #68]
	.loc 1 61 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #48]
	.loc 1 63 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #4194304
	str	r2, [r3, #48]
	.loc 1 65 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #64]
	.loc 1 67 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L8:
	.align	2
.L7:
	.word	RCC
	.cfi_endproc
.LFE1:
	.size	RCC_CONFIG, .-RCC_CONFIG
	.align	1
	.global	GPIO_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	GPIO_CONFIG, %function
GPIO_CONFIG:
.LFB2:
	.loc 1 69 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 70 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3]
	.loc 1 71 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #160
	str	r2, [r3]
	.loc 1 73 22
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #4]
	.loc 1 75 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3, #12]
	.loc 1 77 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #3840
	str	r2, [r3, #32]
	.loc 1 78 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #1792
	str	r2, [r3, #32]
	.loc 1 80 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #32]
	.loc 1 81 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #28672
	str	r2, [r3, #32]
	.loc 1 84 21
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3]
	.loc 1 85 21
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #40960
	str	r2, [r3]
	.loc 1 87 22
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #192
	str	r2, [r3, #4]
	.loc 1 89 21
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #12]
	.loc 1 91 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #251658240
	str	r2, [r3, #32]
	.loc 1 92 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #67108864
	str	r2, [r3, #32]
	.loc 1 94 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #-268435456
	str	r2, [r3, #32]
	.loc 1 95 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #1073741824
	str	r2, [r3, #32]
	.loc 1 96 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	GPIOA
	.word	GPIOB
	.cfi_endproc
.LFE2:
	.size	GPIO_CONFIG, .-GPIO_CONFIG
	.align	1
	.global	USART1_INIT
	.syntax unified
	.thumb
	.thumb_func
	.type	USART1_INIT, %function
USART1_INIT:
.LFB3:
	.loc 1 98 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 100 16
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	.loc 1 102 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	ldr	r2, .L13
	ldr	r2, [r2]
	bic	r3, r3, #65280
	bic	r3, r3, #240
	str	r3, [r2, #8]
	.loc 1 104 16
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	ldr	r2, .L13
	ldr	r2, [r2]
	orr	r3, r3, #5184
	orr	r3, r3, #16
	str	r3, [r2, #8]
	.loc 1 106 16
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #15
	str	r2, [r3, #8]
	.loc 1 108 16
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #8]
	.loc 1 110 21
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #12]
	.loc 1 112 21
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3, #12]
	.loc 1 114 21
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	.loc 1 116 21
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #20]
	.loc 1 118 21
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #20]
	.loc 1 120 20
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3]
	.loc 1 121 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L14:
	.align	2
.L13:
	.word	USART1
	.cfi_endproc
.LFE3:
	.size	USART1_INIT, .-USART1_INIT
	.align	1
	.global	i2c1_init
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_init, %function
i2c1_init:
.LFB4:
	.loc 1 124 2
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 126 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3]
	.loc 1 128 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3]
	.loc 1 130 16
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3]
	.loc 1 132 16
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3]
	.loc 1 134 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3]
	.loc 1 136 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3]
	.loc 1 138 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3]
	.loc 1 140 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #16
	str	r2, [r3]
	.loc 1 142 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3]
	.loc 1 144 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3]
	.loc 1 146 13
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L16
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #4]
	.loc 1 148 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L16
	ldr	r3, [r3]
	bic	r2, r2, #63
	str	r2, [r3, #4]
	.loc 1 149 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L16
	ldr	r3, [r3]
	orr	r2, r2, #25
	str	r2, [r3, #4]
	.loc 1 151 13
	ldr	r3, .L16
	ldr	r3, [r3]
	.loc 1 151 19
	movs	r2, #125
	str	r2, [r3, #28]
	.loc 1 153 13
	ldr	r3, .L16
	ldr	r3, [r3]
	.loc 1 153 21
	movs	r2, #24
	str	r2, [r3, #32]
	.loc 1 155 19
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 156 3
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L17:
	.align	2
.L16:
	.word	I2C1
	.cfi_endproc
.LFE4:
	.size	i2c1_init, .-i2c1_init
	.align	1
	.global	i2c1_write
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_write, %function
i2c1_write:
.LFB5:
	.loc 1 159 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r2, [r7]
	mov	r2, r3
	mov	r3, r0
	strb	r3, [r7, #7]
	mov	r3, r1
	strb	r3, [r7, #6]
	mov	r3, r2
	strb	r3, [r7, #5]
	.loc 1 163 20
	ldr	r2, .L24
	ldrb	r3, [r7, #6]
	strb	r3, [r2]
	.loc 1 164 11
	ldrb	r3, [r7, #5]
	adds	r3, r3, #1
	strb	r3, [r7, #5]
	.loc 1 166 8
	movs	r3, #1
	str	r3, [r7, #16]
	.loc 1 166 12
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 166 3
	b	.L19
.L20:
	.loc 1 168 35 discriminator 3
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	add	r2, r2, r3
	.loc 1 168 25 discriminator 3
	ldr	r3, [r7, #16]
	.loc 1 168 35 discriminator 3
	ldrb	r1, [r2]	@ zero_extendqisi2
	.loc 1 168 29 discriminator 3
	ldr	r2, .L24
	strb	r1, [r2, r3]
	.loc 1 166 28 discriminator 3
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
	.loc 1 166 32 discriminator 3
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L19:
	.loc 1 166 17 discriminator 1
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	ldr	r3, [r7, #16]
	.loc 1 166 3 discriminator 1
	cmp	r2, r3
	bhi	.L20
	.loc 1 171 7
	ldr	r3, .L24+4
	ldr	r3, [r3]
	.loc 1 171 21
	ldr	r2, .L24
	.loc 1 171 19
	str	r2, [r3, #196]
	.loc 1 173 7
	ldr	r3, .L24+4
	ldr	r3, [r3]
	.loc 1 173 19
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	str	r2, [r3, #188]
	.loc 1 175 16
	ldr	r3, .L24+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L24+8
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 177 11
	nop
.L21:
	.loc 1 177 18 discriminator 1
	ldr	r3, .L24+8
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 177 24 discriminator 1
	and	r3, r3, #1
	.loc 1 177 11 discriminator 1
	cmp	r3, #0
	beq	.L21
	.loc 1 178 16
	ldr	r3, .L24+8
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 178 10
	str	r3, [r7, #20]
	.loc 1 180 7
	ldr	r3, .L24+8
	ldr	r3, [r3]
	.loc 1 180 12
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 182 9
	nop
.L22:
	.loc 1 182 16 discriminator 1
	ldr	r3, .L24+8
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 182 22 discriminator 1
	and	r3, r3, #130
	.loc 1 182 9 discriminator 1
	cmp	r3, #0
	beq	.L22
	.loc 1 183 16
	ldr	r3, .L24+8
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 183 10
	str	r3, [r7, #20]
	.loc 1 185 20
	ldr	r3, .L24+4
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L24+4
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #184]
	.loc 1 186 8
	nop
.L23:
	.loc 1 186 15 discriminator 1
	ldr	r3, .L24+4
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	.loc 1 186 22 discriminator 1
	and	r3, r3, #134217728
	.loc 1 186 8 discriminator 1
	cmp	r3, #0
	beq	.L23
	.loc 1 187 7
	ldr	r3, .L24+4
	ldr	r3, [r3]
	.loc 1 187 15
	mov	r2, #201326592
	str	r2, [r3, #12]
	.loc 1 189 13
	ldr	r3, .L24+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L24+8
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 190 1
	nop
	adds	r7, r7, #28
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L25:
	.align	2
.L24:
	.word	i2c_tx_buffer
	.word	DMA1
	.word	I2C1
	.cfi_endproc
.LFE5:
	.size	i2c1_write, .-i2c1_write
	.align	1
	.global	i2c1_read
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_read, %function
i2c1_read:
.LFB6:
	.loc 1 193 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r2, [r7]
	mov	r2, r3
	mov	r3, r0
	strb	r3, [r7, #7]
	mov	r3, r1
	strb	r3, [r7, #6]
	mov	r3, r2
	strb	r3, [r7, #5]
	.loc 1 198 16
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L33
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 199 11
	nop
.L27:
	.loc 1 199 18 discriminator 1
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 199 24 discriminator 1
	and	r3, r3, #1
	.loc 1 199 11 discriminator 1
	cmp	r3, #0
	beq	.L27
	.loc 1 200 16
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 200 10
	str	r3, [r7, #20]
	.loc 1 202 7
	ldr	r3, .L33
	ldr	r3, [r3]
	.loc 1 202 12
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 204 8
	nop
.L28:
	.loc 1 204 15 discriminator 1
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 204 21 discriminator 1
	and	r3, r3, #130
	.loc 1 204 8 discriminator 1
	cmp	r3, #0
	beq	.L28
	.loc 1 205 15
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 205 9
	str	r3, [r7, #20]
	.loc 1 207 7
	ldr	r3, .L33
	ldr	r3, [r3]
	.loc 1 207 12
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 210 8
	nop
.L29:
	.loc 1 210 15 discriminator 1
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 210 21 discriminator 1
	and	r3, r3, #7
	.loc 1 210 8 discriminator 1
	cmp	r3, #0
	beq	.L29
	.loc 1 211 16
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 211 10
	str	r3, [r7, #20]
	.loc 1 213 16
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L33
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 214 11
	nop
.L30:
	.loc 1 214 18 discriminator 1
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 214 24 discriminator 1
	and	r3, r3, #1
	.loc 1 214 11 discriminator 1
	cmp	r3, #0
	beq	.L30
	.loc 1 215 16
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 215 10
	str	r3, [r7, #20]
	.loc 1 217 23
	ldrb	r3, [r7, #7]
	orr	r3, r3, #1
	uxtb	r2, r3
	.loc 1 217 7
	ldr	r3, .L33
	ldr	r3, [r3]
	.loc 1 217 12
	str	r2, [r3, #16]
	.loc 1 219 8
	nop
.L31:
	.loc 1 219 15 discriminator 1
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 219 21 discriminator 1
	and	r3, r3, #130
	.loc 1 219 8 discriminator 1
	cmp	r3, #0
	beq	.L31
	.loc 1 220 13
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 220 7
	str	r3, [r7, #20]
	.loc 1 222 7
	ldr	r3, .L33+4
	ldr	r3, [r3]
	.loc 1 222 21
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	.loc 1 222 19
	str	r2, [r3, #28]
	.loc 1 224 7
	ldr	r3, .L33+4
	ldr	r3, [r3]
	.loc 1 224 19
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	str	r2, [r3, #20]
	.loc 1 228 17
	ldr	r3, .L33+4
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L33+4
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #16]
	.loc 1 230 8
	nop
.L32:
	.loc 1 230 15 discriminator 1
	ldr	r3, .L33+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 230 22 discriminator 1
	and	r3, r3, #32
	.loc 1 230 8 discriminator 1
	cmp	r3, #0
	beq	.L32
	.loc 1 231 10
	ldr	r3, .L33+4
	ldr	r3, [r3]
	.loc 1 231 18
	movs	r2, #48
	str	r2, [r3, #8]
	.loc 1 233 13
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L33
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 234 1
	nop
	adds	r7, r7, #28
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L34:
	.align	2
.L33:
	.word	I2C1
	.word	DMA1
	.cfi_endproc
.LFE6:
	.size	i2c1_read, .-i2c1_read
	.align	1
	.global	DMA1_TRANSMIT_init
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA1_TRANSMIT_init, %function
DMA1_TRANSMIT_init:
.LFB7:
	.loc 1 237 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 240 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #184]
	.loc 1 242 15
	nop
.L36:
	.loc 1 242 21 discriminator 1
	ldr	r3, .L37
	ldr	r3, [r3]
	.loc 1 242 27 discriminator 1
	ldr	r3, [r3, #184]
	.loc 1 242 31 discriminator 1
	and	r3, r3, #1
	.loc 1 242 15 discriminator 1
	cmp	r3, #0
	bne	.L36
	.loc 1 244 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #234881024
	str	r2, [r3, #184]
	.loc 1 246 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	orr	r2, r2, #33554432
	str	r2, [r3, #184]
	.loc 1 248 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3, #184]
	.loc 1 250 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #196608
	str	r2, [r3, #184]
	.loc 1 252 25
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #204]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #204]
	.loc 1 254 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #25165824
	str	r2, [r3, #184]
	.loc 1 256 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #6291456
	str	r2, [r3, #184]
	.loc 1 258 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #524288
	str	r2, [r3, #184]
	.loc 1 260 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #262144
	str	r2, [r3, #184]
	.loc 1 262 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #184]
	.loc 1 264 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #24576
	str	r2, [r3, #184]
	.loc 1 266 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #6144
	str	r2, [r3, #184]
	.loc 1 268 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #184]
	.loc 1 270 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #512
	str	r2, [r3, #184]
	.loc 1 272 46
	ldr	r3, .L37+4
	ldr	r3, [r3]
	.loc 1 272 41
	add	r2, r3, #16
	.loc 1 272 14
	ldr	r3, .L37
	ldr	r3, [r3]
	.loc 1 272 25
	str	r2, [r3, #192]
	.loc 1 274 19
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #256
	str	r2, [r3, #184]
	.loc 1 276 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r2, r2, #192
	str	r2, [r3, #184]
	.loc 1 278 24
	ldr	r3, .L37
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L37
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #184]
	.loc 1 279 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L38:
	.align	2
.L37:
	.word	DMA1
	.word	I2C1
	.cfi_endproc
.LFE7:
	.size	DMA1_TRANSMIT_init, .-DMA1_TRANSMIT_init
	.align	1
	.global	DMA1_RECIVE_init
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA1_RECIVE_init, %function
DMA1_RECIVE_init:
.LFB8:
	.loc 1 282 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 286 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #16]
	.loc 1 288 15
	nop
.L40:
	.loc 1 288 21 discriminator 1
	ldr	r3, .L41
	ldr	r3, [r3]
	.loc 1 288 27 discriminator 1
	ldr	r3, [r3, #16]
	.loc 1 288 31 discriminator 1
	and	r3, r3, #1
	.loc 1 288 15 discriminator 1
	cmp	r3, #0
	bne	.L40
	.loc 1 290 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #234881024
	str	r2, [r3, #16]
	.loc 1 292 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	orr	r2, r2, #33554432
	str	r2, [r3, #16]
	.loc 1 294 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #196608
	str	r2, [r3, #16]
	.loc 1 296 25
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #36]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #36]
	.loc 1 298 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #25165824
	str	r2, [r3, #16]
	.loc 1 300 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #6291456
	str	r2, [r3, #16]
	.loc 1 302 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #524288
	str	r2, [r3, #16]
	.loc 1 304 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #262144
	str	r2, [r3, #16]
	.loc 1 306 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #16]
	.loc 1 308 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #24576
	str	r2, [r3, #16]
	.loc 1 310 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #6144
	str	r2, [r3, #16]
	.loc 1 312 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #16]
	.loc 1 314 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #512
	str	r2, [r3, #16]
	.loc 1 316 46
	ldr	r3, .L41+4
	ldr	r3, [r3]
	.loc 1 316 41
	add	r2, r3, #16
	.loc 1 316 14
	ldr	r3, .L41
	ldr	r3, [r3]
	.loc 1 316 25
	str	r2, [r3, #24]
	.loc 1 318 19
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #256
	str	r2, [r3, #16]
	.loc 1 320 24
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #192
	str	r2, [r3, #16]
	.loc 1 322 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L42:
	.align	2
.L41:
	.word	DMA1
	.word	I2C1
	.cfi_endproc
.LFE8:
	.size	DMA1_RECIVE_init, .-DMA1_RECIVE_init
.Letext0:
	.file 2 "main.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7e2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF97
	.byte	0xc
	.4byte	.LASF98
	.4byte	.LASF99
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.byte	0x4
	.4byte	0x4d
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x6
	.4byte	0x33
	.4byte	0x94
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x2
	.byte	0xd
	.byte	0x19
	.4byte	0xa6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISER
	.uleb128 0x5
	.byte	0x4
	.4byte	0x84
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x2
	.byte	0xe
	.byte	0x19
	.4byte	0xa6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICER
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x2
	.byte	0xf
	.byte	0x19
	.4byte	0xa6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISPR
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x2
	.byte	0x10
	.byte	0x19
	.4byte	0xa6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICPR
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x2
	.byte	0x11
	.byte	0x19
	.4byte	0xa6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IABR
	.uleb128 0x6
	.4byte	0x33
	.4byte	0x104
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x3b
	.byte	0
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x2
	.byte	0x12
	.byte	0x19
	.4byte	0x116
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IPR
	.uleb128 0x5
	.byte	0x4
	.4byte	0xf4
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.byte	0x8
	.4byte	0x183
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x2
	.byte	0x15
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x2
	.byte	0x16
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x2
	.byte	0x17
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x2
	.byte	0x18
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x2
	.byte	0x19
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"CR3\000"
	.byte	0x2
	.byte	0x1a
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x2
	.byte	0x1b
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x2
	.byte	0x1d
	.byte	0x11
	.4byte	0x195
	.uleb128 0x5
	.byte	0x3
	.4byte	USART1
	.uleb128 0x5
	.byte	0x4
	.4byte	0x11c
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x8c
	.byte	0x2
	.byte	0x1f
	.byte	0x8
	.4byte	0x36f
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x2
	.byte	0x21
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x2
	.byte	0x22
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x2
	.byte	0x23
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x2
	.byte	0x24
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x2
	.byte	0x25
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x2
	.byte	0x26
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x2
	.byte	0x27
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x2
	.byte	0x28
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x2
	.byte	0x29
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x2
	.byte	0x2a
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x2
	.byte	0x2b
	.byte	0xf
	.4byte	0x2c
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x2
	.byte	0x2c
	.byte	0xf
	.4byte	0x2c
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x2
	.byte	0x2d
	.byte	0xf
	.4byte	0x2c
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x2
	.byte	0x2e
	.byte	0xf
	.4byte	0x2c
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x2
	.byte	0x2f
	.byte	0xf
	.4byte	0x2c
	.byte	0x38
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x2
	.byte	0x30
	.byte	0xf
	.4byte	0x2c
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x2
	.byte	0x31
	.byte	0xf
	.4byte	0x2c
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x2
	.byte	0x32
	.byte	0xf
	.4byte	0x2c
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x2
	.byte	0x33
	.byte	0xf
	.4byte	0x2c
	.byte	0x48
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x2
	.byte	0x34
	.byte	0xf
	.4byte	0x2c
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x2
	.byte	0x35
	.byte	0xf
	.4byte	0x2c
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x2
	.byte	0x36
	.byte	0xf
	.4byte	0x2c
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x2
	.byte	0x37
	.byte	0xf
	.4byte	0x2c
	.byte	0x58
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x2
	.byte	0x38
	.byte	0xf
	.4byte	0x2c
	.byte	0x5c
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x2
	.byte	0x39
	.byte	0xf
	.4byte	0x2c
	.byte	0x60
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x2
	.byte	0x3a
	.byte	0xf
	.4byte	0x2c
	.byte	0x64
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x2
	.byte	0x3b
	.byte	0xf
	.4byte	0x2c
	.byte	0x68
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x2
	.byte	0x3c
	.byte	0xf
	.4byte	0x2c
	.byte	0x6c
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x2
	.byte	0x3d
	.byte	0xf
	.4byte	0x2c
	.byte	0x70
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x2
	.byte	0x3e
	.byte	0xf
	.4byte	0x2c
	.byte	0x74
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x2
	.byte	0x3f
	.byte	0xf
	.4byte	0x2c
	.byte	0x78
	.uleb128 0xb
	.4byte	.LASF49
	.byte	0x2
	.byte	0x40
	.byte	0xf
	.4byte	0x2c
	.byte	0x7c
	.uleb128 0xb
	.4byte	.LASF50
	.byte	0x2
	.byte	0x41
	.byte	0xf
	.4byte	0x2c
	.byte	0x80
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x2
	.byte	0x42
	.byte	0xf
	.4byte	0x2c
	.byte	0x84
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x2
	.byte	0x43
	.byte	0xf
	.4byte	0x2c
	.byte	0x88
	.byte	0
	.uleb128 0xc
	.ascii	"RCC\000"
	.byte	0x2
	.byte	0x45
	.byte	0xf
	.4byte	0x381
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC
	.uleb128 0x5
	.byte	0x4
	.4byte	0x19b
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0x28
	.byte	0x2
	.byte	0x47
	.byte	0x8
	.4byte	0x417
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x2
	.byte	0x4a
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x2
	.byte	0x4b
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x2
	.byte	0x4c
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x2
	.byte	0x4d
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x2
	.byte	0x4e
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x2
	.byte	0x4f
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x2
	.byte	0x50
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x2
	.byte	0x51
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x2
	.byte	0x52
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x2
	.byte	0x53
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF62
	.byte	0x2
	.byte	0x55
	.byte	0x10
	.4byte	0x429
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOA
	.uleb128 0x5
	.byte	0x4
	.4byte	0x387
	.uleb128 0x8
	.4byte	.LASF63
	.byte	0x2
	.byte	0x56
	.byte	0x10
	.4byte	0x429
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x28
	.byte	0x2
	.byte	0x59
	.byte	0x8
	.4byte	0x4d0
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x2
	.byte	0x5b
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x2
	.byte	0x5c
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF65
	.byte	0x2
	.byte	0x5d
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF66
	.byte	0x2
	.byte	0x5e
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x2
	.byte	0x5f
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"SR1\000"
	.byte	0x2
	.byte	0x60
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xa
	.ascii	"SR2\000"
	.byte	0x2
	.byte	0x61
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xa
	.ascii	"CCR\000"
	.byte	0x2
	.byte	0x62
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF67
	.byte	0x2
	.byte	0x63
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF68
	.byte	0x2
	.byte	0x64
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF69
	.byte	0x2
	.byte	0x67
	.byte	0xf
	.4byte	0x4e2
	.uleb128 0x5
	.byte	0x3
	.4byte	I2C1
	.uleb128 0x5
	.byte	0x4
	.4byte	0x441
	.uleb128 0x9
	.4byte	.LASF70
	.byte	0x18
	.byte	0x2
	.byte	0x69
	.byte	0x8
	.4byte	0x543
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x2
	.byte	0x6c
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF71
	.byte	0x2
	.byte	0x6d
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.ascii	"PAR\000"
	.byte	0x2
	.byte	0x6e
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF72
	.byte	0x2
	.byte	0x6f
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF73
	.byte	0x2
	.byte	0x70
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"FCR\000"
	.byte	0x2
	.byte	0x71
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0xd0
	.byte	0x2
	.byte	0x75
	.byte	0x8
	.4byte	0x590
	.uleb128 0xb
	.4byte	.LASF75
	.byte	0x2
	.byte	0x78
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF76
	.byte	0x2
	.byte	0x79
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF77
	.byte	0x2
	.byte	0x7a
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF78
	.byte	0x2
	.byte	0x7b
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"S\000"
	.byte	0x2
	.byte	0x7c
	.byte	0x16
	.4byte	0x590
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.4byte	0x4e8
	.4byte	0x5a0
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.4byte	.LASF79
	.byte	0x2
	.byte	0x7e
	.byte	0xf
	.4byte	0x5b2
	.uleb128 0x5
	.byte	0x3
	.4byte	DMA1
	.uleb128 0x5
	.byte	0x4
	.4byte	0x543
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x5c8
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x9
	.byte	0
	.uleb128 0x8
	.4byte	.LASF80
	.byte	0x1
	.byte	0xc
	.byte	0xf
	.4byte	0x5b8
	.uleb128 0x5
	.byte	0x3
	.4byte	i2c_tx_buffer
	.uleb128 0x8
	.4byte	.LASF81
	.byte	0x1
	.byte	0xd
	.byte	0xf
	.4byte	0x5b8
	.uleb128 0x5
	.byte	0x3
	.4byte	i2c_rx_buffer
	.uleb128 0x6
	.4byte	0x7d
	.4byte	0x5fc
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x11
	.byte	0
	.uleb128 0x8
	.4byte	.LASF82
	.byte	0x1
	.byte	0xf
	.byte	0x6
	.4byte	0x5ec
	.uleb128 0x5
	.byte	0x3
	.4byte	mystr
	.uleb128 0x6
	.4byte	0x7d
	.4byte	0x61e
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.ascii	"str\000"
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.4byte	0x60e
	.uleb128 0x5
	.byte	0x3
	.4byte	str
	.uleb128 0xd
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x119
	.byte	0x6
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF84
	.byte	0x1
	.byte	0xec
	.byte	0x6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF89
	.byte	0x1
	.byte	0xc0
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6d1
	.uleb128 0x10
	.4byte	.LASF85
	.byte	0x1
	.byte	0xc0
	.byte	0x1e
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x10
	.4byte	.LASF86
	.byte	0x1
	.byte	0xc0
	.byte	0x35
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x10
	.4byte	.LASF87
	.byte	0x1
	.byte	0xc0
	.byte	0x4d
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.4byte	.LASF88
	.byte	0x1
	.byte	0xc0
	.byte	0x60
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.uleb128 0x11
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xc4
	.byte	0x1c
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0xc4
	.byte	0x20
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.ascii	"a\000"
	.byte	0x1
	.byte	0xc4
	.byte	0x22
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.4byte	.LASF90
	.byte	0x1
	.byte	0x9e
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x74d
	.uleb128 0x10
	.4byte	.LASF85
	.byte	0x1
	.byte	0x9e
	.byte	0x1f
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x10
	.4byte	.LASF86
	.byte	0x1
	.byte	0x9e
	.byte	0x36
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x10
	.4byte	.LASF87
	.byte	0x1
	.byte	0x9e
	.byte	0x4e
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.4byte	.LASF88
	.byte	0x1
	.byte	0x9e
	.byte	0x61
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.uleb128 0x11
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xa2
	.byte	0x1c
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0xa2
	.byte	0x20
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.ascii	"a\000"
	.byte	0x1
	.byte	0xa2
	.byte	0x22
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.4byte	.LASF91
	.byte	0x1
	.byte	0x7b
	.byte	0x7
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF92
	.byte	0x1
	.byte	0x61
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF93
	.byte	0x1
	.byte	0x44
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF94
	.byte	0x1
	.byte	0x29
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF100
	.byte	0x1
	.byte	0x11
	.byte	0x5
	.4byte	0x25
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.ascii	"var\000"
	.byte	0x1
	.byte	0x14
	.byte	0x10
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x13
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x14
	.byte	0x16
	.4byte	0x4d
	.uleb128 0x14
	.4byte	.LASF95
	.byte	0x1
	.byte	0x16
	.byte	0x6
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF96
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF43:
	.ascii	"APB1LPENR\000"
.LASF59:
	.ascii	"LCKR\000"
.LASF72:
	.ascii	"M0AR\000"
.LASF11:
	.ascii	"NVIC_ISER\000"
.LASF55:
	.ascii	"OTYPER\000"
.LASF67:
	.ascii	"TRISE\000"
.LASF66:
	.ascii	"OAR2\000"
.LASF53:
	.ascii	"GPIO_s\000"
.LASF54:
	.ascii	"MODER\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF84:
	.ascii	"DMA1_TRANSMIT_init\000"
.LASF57:
	.ascii	"PUPDR\000"
.LASF99:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/I2C_with_DMA\000"
.LASF39:
	.ascii	"AHB1LPENR\000"
.LASF52:
	.ascii	"DCKCFGR\000"
.LASF1:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF85:
	.ascii	"dev_addr\000"
.LASF58:
	.ascii	"BSRR\000"
.LASF23:
	.ascii	"AHB1RSTR\000"
.LASF17:
	.ascii	"GTPR\000"
.LASF88:
	.ascii	"n_bytes\000"
.LASF86:
	.ascii	"reg_addr\000"
.LASF7:
	.ascii	"long int\000"
.LASF28:
	.ascii	"APB2RSTR\000"
.LASF94:
	.ascii	"RCC_CONFIG\000"
.LASF20:
	.ascii	"RCC_s\000"
.LASF92:
	.ascii	"USART1_INIT\000"
.LASF68:
	.ascii	"FLTR\000"
.LASF21:
	.ascii	"PLLCFGR\000"
.LASF96:
	.ascii	"byte\000"
.LASF56:
	.ascii	"OSPEEDR\000"
.LASF69:
	.ascii	"I2C1\000"
.LASF83:
	.ascii	"DMA1_RECIVE_init\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF81:
	.ascii	"i2c_rx_buffer\000"
.LASF82:
	.ascii	"mystr\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF87:
	.ascii	"data\000"
.LASF95:
	.ascii	"size\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF14:
	.ascii	"NVIC_ICPR\000"
.LASF51:
	.ascii	"PLLI2SCFGR\000"
.LASF19:
	.ascii	"USART_s\000"
.LASF98:
	.ascii	"main.c\000"
.LASF76:
	.ascii	"HISR\000"
.LASF64:
	.ascii	"I2C_s\000"
.LASF44:
	.ascii	"APB2LPENR\000"
.LASF70:
	.ascii	"DMA_STREAM_s\000"
.LASF77:
	.ascii	"LIFCR\000"
.LASF13:
	.ascii	"NVIC_ISPR\000"
.LASF97:
	.ascii	"GNU C17 10.3.1 20210824 (release) -mcpu=cortex-m4 -"
	.ascii	"mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -march=ar"
	.ascii	"mv7e-m+fp -g\000"
.LASF42:
	.ascii	"reserved10\000"
.LASF2:
	.ascii	"long double\000"
.LASF46:
	.ascii	"reserved12\000"
.LASF48:
	.ascii	"reserved13\000"
.LASF49:
	.ascii	"reserved14\000"
.LASF93:
	.ascii	"GPIO_CONFIG\000"
.LASF40:
	.ascii	"AHB2LPENR\000"
.LASF27:
	.ascii	"APB1RSTR\000"
.LASF62:
	.ascii	"GPIOA\000"
.LASF63:
	.ascii	"GPIOB\000"
.LASF61:
	.ascii	"AFRH\000"
.LASF60:
	.ascii	"AFRL\000"
.LASF80:
	.ascii	"i2c_tx_buffer\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"short int\000"
.LASF74:
	.ascii	"DMA_s\000"
.LASF89:
	.ascii	"i2c1_read\000"
.LASF36:
	.ascii	"APB2ENR\000"
.LASF79:
	.ascii	"DMA1\000"
.LASF10:
	.ascii	"char\000"
.LASF24:
	.ascii	"AHB2RSTR\000"
.LASF71:
	.ascii	"NDTR\000"
.LASF90:
	.ascii	"i2c1_write\000"
.LASF35:
	.ascii	"APB1ENR\000"
.LASF47:
	.ascii	"BDCR\000"
.LASF32:
	.ascii	"AHB2ENR\000"
.LASF73:
	.ascii	"M1AR\000"
.LASF50:
	.ascii	"SSCGR\000"
.LASF25:
	.ascii	"reserved1\000"
.LASF29:
	.ascii	"reserved3\000"
.LASF45:
	.ascii	"reserved11\000"
.LASF91:
	.ascii	"i2c1_init\000"
.LASF38:
	.ascii	"reserved8\000"
.LASF65:
	.ascii	"OAR1\000"
.LASF15:
	.ascii	"NVIC_IABR\000"
.LASF31:
	.ascii	"AHB1ENR\000"
.LASF22:
	.ascii	"CFGR\000"
.LASF12:
	.ascii	"NVIC_ICER\000"
.LASF26:
	.ascii	"reserved2\000"
.LASF18:
	.ascii	"USART1\000"
.LASF30:
	.ascii	"reserved4\000"
.LASF33:
	.ascii	"reserved5\000"
.LASF34:
	.ascii	"reserved6\000"
.LASF37:
	.ascii	"reserved7\000"
.LASF16:
	.ascii	"NVIC_IPR\000"
.LASF41:
	.ascii	"reserved9\000"
.LASF100:
	.ascii	"main\000"
.LASF78:
	.ascii	"HIFCR\000"
.LASF75:
	.ascii	"LISR\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
