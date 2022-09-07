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
	.global	USART2
	.align	2
	.type	USART2, %object
	.size	USART2, 4
USART2:
	.word	1073759232
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
	.global	DMA2
	.align	2
	.type	DMA2, %object
	.size	DMA2, 4
DMA2:
	.word	1073898496
	.global	var
	.bss
	.type	var, %object
	.size	var, 1
var:
	.space	1
	.global	buffer
	.align	2
	.type	buffer, %object
	.size	buffer, 100
buffer:
	.space	100
	.section	.rodata
	.align	2
.LC0:
	.ascii	"MPU6050 connected....\015\012\000"
	.align	2
.LC1:
	.ascii	"MPU6050 not connected....\015\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB3:
	.file 1 "main.c"
	.loc 1 12 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 16 6
	bl	RCC_CONFIG
	.loc 1 17 6
	bl	GPIO_CONFIG
	.loc 1 19 5
	bl	usart_init
	.loc 1 20 2
	bl	i2c1_init
	.loc 1 23 2
	movs	r3, #1
	ldr	r2, .L5
	movs	r1, #107
	movs	r0, #208
	bl	i2c1_write
	.loc 1 24 2
	bl	mpu_init
	.loc 1 25 5
	movs	r3, #1
	ldr	r2, .L5
	movs	r1, #117
	movs	r0, #208
	bl	i2c1_read
	.loc 1 27 8
	ldr	r3, .L5
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 27 4
	cmp	r3, #104
	bne	.L2
	.loc 1 28 4
	ldr	r0, .L5+4
	bl	usart_print
	b	.L4
.L2:
	.loc 1 30 4
	ldr	r0, .L5+8
	bl	usart_print
.L4:
	.loc 1 34 20 discriminator 1
	bl	mpu_tmperature
	.loc 1 35 20 discriminator 1
	bl	mpu_calculate
	.loc 1 36 6 discriminator 1
	bl	delay
	.loc 1 34 20 discriminator 1
	b	.L4
.L6:
	.align	2
.L5:
	.word	var
	.word	.LC0
	.word	.LC1
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.align	1
	.global	RCC_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	RCC_CONFIG, %function
RCC_CONFIG:
.LFB4:
	.loc 1 41 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 42 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #48]
	.loc 1 43 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #48]
	.loc 1 44 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #48]
	.loc 1 46 15
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L9
	ldr	r3, [r3]
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 47 15
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #65536
	str	r2, [r3]
	.loc 1 48 12
	nop
.L8:
	.loc 1 48 17 discriminator 1
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 48 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 48 12 discriminator 1
	cmp	r3, #0
	beq	.L8
	.loc 1 50 17
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L9
	ldr	r3, [r3]
	bic	r2, r2, #3
	str	r2, [r3, #8]
	.loc 1 51 17
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #8]
	.loc 1 52 12
	nop
	.loc 1 54 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #68]
	.loc 1 56 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #64]
	.loc 1 58 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #68]
	.loc 1 60 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #48]
	.loc 1 62 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #4194304
	str	r2, [r3, #48]
	.loc 1 64 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #64]
	.loc 1 66 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L10:
	.align	2
.L9:
	.word	RCC
	.cfi_endproc
.LFE4:
	.size	RCC_CONFIG, .-RCC_CONFIG
	.align	1
	.global	GPIO_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	GPIO_CONFIG, %function
GPIO_CONFIG:
.LFB5:
	.loc 1 68 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 69 21
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3]
	.loc 1 70 21
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L12
	ldr	r3, [r3]
	orr	r2, r2, #160
	str	r2, [r3]
	.loc 1 72 22
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #12
	str	r2, [r3, #4]
	.loc 1 74 21
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3, #12]
	.loc 1 76 20
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #3840
	str	r2, [r3, #32]
	.loc 1 77 20
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12
	ldr	r3, [r3]
	orr	r2, r2, #1792
	str	r2, [r3, #32]
	.loc 1 79 20
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #32]
	.loc 1 80 20
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12
	ldr	r3, [r3]
	orr	r2, r2, #28672
	str	r2, [r3, #32]
	.loc 1 83 21
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3]
	.loc 1 84 21
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r2, r2, #40960
	str	r2, [r3]
	.loc 1 86 22
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r2, r2, #192
	str	r2, [r3, #4]
	.loc 1 88 21
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #12]
	.loc 1 90 20
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	bic	r2, r2, #251658240
	str	r2, [r3, #32]
	.loc 1 91 20
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r2, r2, #67108864
	str	r2, [r3, #32]
	.loc 1 93 20
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	bic	r2, r2, #-268435456
	str	r2, [r3, #32]
	.loc 1 94 20
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r2, r2, #1073741824
	str	r2, [r3, #32]
	.loc 1 95 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	GPIOA
	.word	GPIOB
	.cfi_endproc
.LFE5:
	.size	GPIO_CONFIG, .-GPIO_CONFIG
	.align	1
	.global	usart_init
	.syntax unified
	.thumb
	.thumb_func
	.type	usart_init, %function
usart_init:
.LFB6:
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
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	.loc 1 102 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	ldr	r2, .L15
	ldr	r2, [r2]
	bic	r3, r3, #65280
	bic	r3, r3, #240
	str	r3, [r2, #8]
	.loc 1 104 16
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	ldr	r2, .L15
	ldr	r2, [r2]
	orr	r3, r3, #5184
	orr	r3, r3, #16
	str	r3, [r2, #8]
	.loc 1 106 16
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #15
	str	r2, [r3, #8]
	.loc 1 108 16
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #8]
	.loc 1 110 21
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #12]
	.loc 1 112 21
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3, #12]
	.loc 1 114 21
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	.loc 1 116 21
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #20]
	.loc 1 118 21
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #20]
	.loc 1 120 20
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
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
.L16:
	.align	2
.L15:
	.word	USART2
	.cfi_endproc
.LFE6:
	.size	usart_init, .-usart_init
	.align	1
	.global	i2c1_init
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_init, %function
i2c1_init:
.LFB7:
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
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3]
	.loc 1 128 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3]
	.loc 1 130 16
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3]
	.loc 1 132 16
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3]
	.loc 1 134 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3]
	.loc 1 136 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3]
	.loc 1 138 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3]
	.loc 1 140 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #16
	str	r2, [r3]
	.loc 1 142 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3]
	.loc 1 144 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3]
	.loc 1 146 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L18
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #4]
	.loc 1 148 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L18
	ldr	r3, [r3]
	bic	r2, r2, #63
	str	r2, [r3, #4]
	.loc 1 149 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L18
	ldr	r3, [r3]
	orr	r2, r2, #25
	str	r2, [r3, #4]
	.loc 1 151 13
	ldr	r3, .L18
	ldr	r3, [r3]
	.loc 1 151 19
	movs	r2, #125
	str	r2, [r3, #28]
	.loc 1 153 13
	ldr	r3, .L18
	ldr	r3, [r3]
	.loc 1 153 21
	movs	r2, #24
	str	r2, [r3, #32]
	.loc 1 155 19
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L18
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
.L19:
	.align	2
.L18:
	.word	I2C1
	.cfi_endproc
.LFE7:
	.size	i2c1_init, .-i2c1_init
	.align	1
	.global	i2c1_write
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_write, %function
i2c1_write:
.LFB8:
	.loc 1 159 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
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
	.loc 1 162 16
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L27
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 164 11
	nop
.L21:
	.loc 1 164 18 discriminator 1
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 164 24 discriminator 1
	and	r3, r3, #1
	.loc 1 164 11 discriminator 1
	cmp	r3, #0
	beq	.L21
	.loc 1 165 16
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 165 10
	str	r3, [r7, #12]
	.loc 1 167 10
	ldr	r3, .L27
	ldr	r3, [r3]
	.loc 1 167 15
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 169 11
	nop
.L22:
	.loc 1 169 18 discriminator 1
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 169 24 discriminator 1
	and	r3, r3, #130
	.loc 1 169 11 discriminator 1
	cmp	r3, #0
	beq	.L22
	.loc 1 170 16
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 170 10
	str	r3, [r7, #12]
	.loc 1 172 10
	ldr	r3, .L27
	ldr	r3, [r3]
	.loc 1 172 15
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 174 11
	nop
.L23:
	.loc 1 174 18 discriminator 1
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 174 24 discriminator 1
	and	r3, r3, #128
	.loc 1 174 11 discriminator 1
	cmp	r3, #0
	beq	.L23
	.loc 1 175 16
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 175 10
	str	r3, [r7, #12]
	.loc 1 177 8
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 177 3
	b	.L24
.L26:
	.loc 1 180 19
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	add	r3, r3, r2
	ldrb	r2, [r3]	@ zero_extendqisi2
	.loc 1 180 8
	ldr	r3, .L27
	ldr	r3, [r3]
	.loc 1 180 13
	str	r2, [r3, #16]
	.loc 1 182 18
	nop
.L25:
	.loc 1 182 25 discriminator 1
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 182 31 discriminator 1
	and	r3, r3, #128
	.loc 1 182 18 discriminator 1
	cmp	r3, #0
	beq	.L25
	.loc 1 183 14 discriminator 2
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 183 8 discriminator 2
	str	r3, [r7, #12]
	.loc 1 177 24 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L24:
	.loc 1 177 13 discriminator 1
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	ldr	r3, [r7, #8]
	.loc 1 177 3 discriminator 1
	cmp	r2, r3
	bhi	.L26
	.loc 1 186 16
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L27
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 188 1
	nop
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L28:
	.align	2
.L27:
	.word	I2C1
	.cfi_endproc
.LFE8:
	.size	i2c1_write, .-i2c1_write
	.align	1
	.global	i2c1_read
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_read, %function
i2c1_read:
.LFB9:
	.loc 1 191 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
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
	.loc 1 194 17
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L41
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 196 12
	nop
.L30:
	.loc 1 196 19 discriminator 1
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 196 25 discriminator 1
	and	r3, r3, #1
	.loc 1 196 12 discriminator 1
	cmp	r3, #0
	beq	.L30
	.loc 1 197 17
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 197 11
	str	r3, [r7, #12]
	.loc 1 199 10
	ldr	r3, .L41
	ldr	r3, [r3]
	.loc 1 199 15
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 201 12
	nop
.L31:
	.loc 1 201 19 discriminator 1
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 201 25 discriminator 1
	and	r3, r3, #130
	.loc 1 201 12 discriminator 1
	cmp	r3, #0
	beq	.L31
	.loc 1 202 19
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 202 13
	str	r3, [r7, #12]
	.loc 1 204 13
	ldr	r3, .L41
	ldr	r3, [r3]
	.loc 1 204 18
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 206 14
	nop
.L32:
	.loc 1 206 21 discriminator 1
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 206 27 discriminator 1
	and	r3, r3, #128
	.loc 1 206 14 discriminator 1
	cmp	r3, #0
	beq	.L32
	.loc 1 207 19
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 207 13
	str	r3, [r7, #12]
	.loc 1 209 19
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L41
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 211 14
	nop
.L33:
	.loc 1 211 21 discriminator 1
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 211 27 discriminator 1
	and	r3, r3, #1
	.loc 1 211 14 discriminator 1
	cmp	r3, #0
	beq	.L33
	.loc 1 212 19
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 212 13
	str	r3, [r7, #12]
	.loc 1 215 29
	ldrb	r3, [r7, #7]
	orr	r3, r3, #1
	uxtb	r2, r3
	.loc 1 215 13
	ldr	r3, .L41
	ldr	r3, [r3]
	.loc 1 215 18
	str	r2, [r3, #16]
	.loc 1 217 11
	nop
.L34:
	.loc 1 217 18 discriminator 1
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 217 24 discriminator 1
	and	r3, r3, #130
	.loc 1 217 11 discriminator 1
	cmp	r3, #0
	beq	.L34
	.loc 1 218 19
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 218 13
	str	r3, [r7, #12]
	.loc 1 220 11
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 220 6
	b	.L35
.L39:
	.loc 1 222 25
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	subs	r3, r3, #1
	mov	r2, r3
	.loc 1 222 16
	ldr	r3, [r7, #8]
	.loc 1 222 14
	cmp	r2, r3
	bne	.L36
	.loc 1 224 19
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L41
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3]
	b	.L40
.L36:
	.loc 1 226 30
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L41
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3]
.L40:
	.loc 1 228 17
	nop
.L38:
	.loc 1 228 24 discriminator 1
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 228 30 discriminator 1
	and	r3, r3, #64
	.loc 1 228 17 discriminator 1
	cmp	r3, #0
	beq	.L38
	.loc 1 229 16 discriminator 2
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 229 10 discriminator 2
	str	r3, [r7, #12]
	.loc 1 231 27 discriminator 2
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r1, [r3, #16]
	.loc 1 231 17 discriminator 2
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	add	r3, r3, r2
	.loc 1 231 21 discriminator 2
	uxtb	r2, r1
	strb	r2, [r3]
	.loc 1 220 27 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L35:
	.loc 1 220 16 discriminator 1
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	ldr	r3, [r7, #8]
	.loc 1 220 6 discriminator 1
	cmp	r2, r3
	bhi	.L39
	.loc 1 235 17
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L41
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 236 1
	nop
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
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
	.word	I2C1
	.cfi_endproc
.LFE9:
	.size	i2c1_read, .-i2c1_read
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Ax=%d.%u,Ay=%d.%u,Az=%d.%u\015\012\000"
	.text
	.align	1
	.global	mpu_calculate
	.syntax unified
	.thumb
	.thumb_func
	.type	mpu_calculate, %function
mpu_calculate:
.LFB10:
	.loc 1 239 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #40
	.cfi_def_cfa_offset 56
	add	r7, sp, #16
	.cfi_def_cfa 7, 40
	.loc 1 248 5
	mov	r2, r7
	movs	r3, #6
	movs	r1, #59
	movs	r0, #208
	bl	i2c1_read
	.loc 1 250 28
	ldrb	r3, [r7]	@ zero_extendqisi2
	.loc 1 250 31
	lsls	r3, r3, #8
	.loc 1 250 12
	sxth	r2, r3
	.loc 1 250 40
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	sxth	r3, r3
	.loc 1 250 10
	orrs	r3, r3, r2
	strh	r3, [r7, #22]	@ movhi
	.loc 1 252 28
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	.loc 1 252 31
	lsls	r3, r3, #8
	.loc 1 252 12
	sxth	r2, r3
	.loc 1 252 40
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	sxth	r3, r3
	.loc 1 252 10
	orrs	r3, r3, r2
	strh	r3, [r7, #20]	@ movhi
	.loc 1 254 28
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	.loc 1 254 31
	lsls	r3, r3, #8
	.loc 1 254 12
	sxth	r2, r3
	.loc 1 254 40
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	sxth	r3, r3
	.loc 1 254 10
	orrs	r3, r3, r2
	strh	r3, [r7, #18]	@ movhi
	.loc 1 256 8
	ldrsh	r3, [r7, #22]
	cmp	r3, #0
	bge	.L44
	add	r3, r3, #16320
	adds	r3, r3, #63
.L44:
	asrs	r3, r3, #14
	strh	r3, [r7, #16]	@ movhi
	.loc 1 257 8
	ldrsh	r3, [r7, #20]
	cmp	r3, #0
	bge	.L45
	add	r3, r3, #16320
	adds	r3, r3, #63
.L45:
	asrs	r3, r3, #14
	strh	r3, [r7, #14]	@ movhi
	.loc 1 258 8
	ldrsh	r3, [r7, #18]
	cmp	r3, #0
	bge	.L46
	add	r3, r3, #16320
	adds	r3, r3, #63
.L46:
	asrs	r3, r3, #14
	strh	r3, [r7, #12]	@ movhi
	.loc 1 260 12
	ldrh	r3, [r7, #22]
	.loc 1 260 9
	ubfx	r3, r3, #0, #14
	uxth	r3, r3
	lsrs	r3, r3, #1
	ldr	r2, .L47
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #9
	strh	r3, [r7, #10]	@ movhi
	.loc 1 261 12
	ldrh	r3, [r7, #20]
	.loc 1 261 9
	ubfx	r3, r3, #0, #14
	uxth	r3, r3
	lsrs	r3, r3, #1
	ldr	r2, .L47
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #9
	strh	r3, [r7, #8]	@ movhi
	.loc 1 262 12
	ldrh	r3, [r7, #18]
	.loc 1 262 9
	ubfx	r3, r3, #0, #14
	uxth	r3, r3
	lsrs	r3, r3, #1
	ldr	r2, .L47
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #9
	strh	r3, [r7, #6]	@ movhi
	.loc 1 264 2
	ldrsh	r4, [r7, #16]
	ldrh	r5, [r7, #10]
	ldrsh	r3, [r7, #14]
	ldrh	r2, [r7, #8]
	ldrsh	r1, [r7, #12]
	ldrh	r0, [r7, #6]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r5
	mov	r2, r4
	ldr	r1, .L47+4
	ldr	r0, .L47+8
	bl	sprintf
	.loc 1 266 5
	ldr	r0, .L47+8
	bl	usart_print
	.loc 1 268 1
	nop
	adds	r7, r7, #24
	.cfi_def_cfa_offset 16
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r4, r5, r7, pc}
.L48:
	.align	2
.L47:
	.word	-1609957215
	.word	.LC2
	.word	buffer
	.cfi_endproc
.LFE10:
	.size	mpu_calculate, .-mpu_calculate
	.section	.rodata
	.align	2
.LC3:
	.ascii	"TEMP=%hi deg_C..valu=%hi\015\012\000"
	.text
	.align	1
	.global	mpu_tmperature
	.syntax unified
	.thumb
	.thumb_func
	.type	mpu_tmperature, %function
mpu_tmperature:
.LFB11:
	.loc 1 271 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 276 12
	movs	r3, #0
	strh	r3, [r7, #6]	@ movhi
	.loc 1 278 2
	mov	r2, r7
	movs	r3, #2
	movs	r1, #65
	movs	r0, #208
	bl	i2c1_read
	.loc 1 280 30
	ldrb	r3, [r7]	@ zero_extendqisi2
	.loc 1 280 33
	lsls	r3, r3, #8
	.loc 1 280 14
	sxth	r2, r3
	.loc 1 280 42
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	sxth	r3, r3
	.loc 1 280 12
	orrs	r3, r3, r2
	strh	r3, [r7, #6]	@ movhi
	.loc 1 282 24
	ldrsh	r3, [r7, #6]
	ldr	r2, .L50
	smull	r1, r2, r2, r3
	asrs	r2, r2, #7
	asrs	r3, r3, #31
	subs	r3, r2, r3
	sxth	r3, r3
	uxth	r3, r3
	adds	r3, r3, #36
	uxth	r3, r3
	.loc 1 282 11
	strh	r3, [r7, #4]	@ movhi
	.loc 1 284 5
	ldrsh	r2, [r7, #4]
	ldrsh	r3, [r7, #6]
	ldr	r1, .L50+4
	ldr	r0, .L50+8
	bl	sprintf
	.loc 1 286 2
	ldr	r0, .L50+8
	bl	usart_print
	.loc 1 288 1
	nop
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
	.word	1616928865
	.word	.LC3
	.word	buffer
	.cfi_endproc
.LFE11:
	.size	mpu_tmperature, .-mpu_tmperature
	.section	.rodata
	.align	2
.LC4:
	.ascii	"data=%d\015\012\000"
	.text
	.align	1
	.global	mpu_init
	.syntax unified
	.thumb
	.thumb_func
	.type	mpu_init, %function
mpu_init:
.LFB12:
	.loc 1 291 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 292 19
	movs	r3, #0
	strb	r3, [r7, #7]
	.loc 1 294 5
	adds	r2, r7, #7
	movs	r3, #1
	movs	r1, #28
	movs	r0, #208
	bl	i2c1_write
	.loc 1 296 2
	adds	r2, r7, #7
	movs	r3, #1
	movs	r1, #28
	movs	r0, #208
	bl	i2c1_read
	.loc 1 298 2
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r1, .L53
	ldr	r0, .L53+4
	bl	sprintf
	.loc 1 300 5
	ldr	r0, .L53+4
	bl	usart_print
	.loc 1 302 1
	nop
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L54:
	.align	2
.L53:
	.word	.LC4
	.word	buffer
	.cfi_endproc
.LFE12:
	.size	mpu_init, .-mpu_init
	.align	1
	.global	usart_tx
	.syntax unified
	.thumb
	.thumb_func
	.type	usart_tx, %function
usart_tx:
.LFB13:
	.loc 1 305 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r3, r0
	strb	r3, [r7, #7]
	.loc 1 308 16
	ldr	r3, .L58
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L58
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3]
	.loc 1 310 10
	nop
.L56:
	.loc 1 310 19 discriminator 1
	ldr	r3, .L58
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 310 24 discriminator 1
	and	r3, r3, #128
	.loc 1 310 10 discriminator 1
	cmp	r3, #0
	beq	.L56
	.loc 1 311 11
	ldr	r3, .L58
	ldr	r3, [r3]
	.loc 1 311 16
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	str	r2, [r3, #4]
	.loc 1 313 11
	ldr	r3, .L58
	ldr	r3, [r3]
	.loc 1 313 16
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	str	r2, [r3, #4]
	.loc 1 314 10
	nop
.L57:
	.loc 1 314 19 discriminator 1
	ldr	r3, .L58
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 314 24 discriminator 1
	and	r3, r3, #64
	.loc 1 314 10 discriminator 1
	cmp	r3, #0
	beq	.L57
	.loc 1 316 1
	nop
	nop
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L59:
	.align	2
.L58:
	.word	USART2
	.cfi_endproc
.LFE13:
	.size	usart_tx, .-usart_tx
	.align	1
	.global	usart_rx
	.syntax unified
	.thumb
	.thumb_func
	.type	usart_rx, %function
usart_rx:
.LFB14:
	.loc 1 318 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 320 18
	ldr	r3, .L63
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L63
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	.loc 1 322 8
	nop
.L61:
	.loc 1 322 17 discriminator 1
	ldr	r3, .L63
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 322 22 discriminator 1
	and	r3, r3, #32
	.loc 1 322 8 discriminator 1
	cmp	r3, #0
	beq	.L61
	.loc 1 323 19
	ldr	r3, .L63
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	uxtb	r3, r3
	.loc 1 325 1
	mov	r0, r3
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L64:
	.align	2
.L63:
	.word	USART2
	.cfi_endproc
.LFE14:
	.size	usart_rx, .-usart_rx
	.align	1
	.global	usart_print
	.syntax unified
	.thumb
	.thumb_func
	.type	usart_print, %function
usart_print:
.LFB15:
	.loc 1 327 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 328 11
	b	.L66
.L67:
	.loc 1 330 20
	ldr	r3, [r7, #4]
	adds	r2, r3, #1
	str	r2, [r7, #4]
	.loc 1 330 9
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	usart_tx
.L66:
	.loc 1 328 12
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 328 11
	cmp	r3, #0
	bne	.L67
	.loc 1 332 1
	nop
	nop
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE15:
	.size	usart_print, .-usart_print
	.align	1
	.global	delay
	.syntax unified
	.thumb
	.thumb_func
	.type	delay, %function
delay:
.LFB16:
	.loc 1 334 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
.LBB2:
	.loc 1 335 10
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 335 2
	b	.L69
.L70:
	.loc 1 335 26 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L69:
	.loc 1 335 2 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, .L71
	cmp	r3, r2
	ble	.L70
.LBE2:
	.loc 1 337 1
	nop
	nop
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L72:
	.align	2
.L71:
	.word	999999
	.cfi_endproc
.LFE16:
	.size	delay, .-delay
.Letext0:
	.file 2 "main.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x911
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0xc
	.4byte	.LASF103
	.4byte	.LASF104
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
	.4byte	USART2
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
	.byte	0x48
	.byte	0x8
	.4byte	0x417
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x2
	.byte	0x4b
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x2
	.byte	0x4c
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x2
	.byte	0x4d
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x2
	.byte	0x4e
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x2
	.byte	0x4f
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x2
	.byte	0x50
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x2
	.byte	0x51
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x2
	.byte	0x52
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x2
	.byte	0x53
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x2
	.byte	0x54
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF62
	.byte	0x2
	.byte	0x56
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
	.byte	0x57
	.byte	0x10
	.4byte	0x429
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x28
	.byte	0x2
	.byte	0x5a
	.byte	0x8
	.4byte	0x4d0
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x2
	.byte	0x5c
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x2
	.byte	0x5d
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF65
	.byte	0x2
	.byte	0x5e
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF66
	.byte	0x2
	.byte	0x5f
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x2
	.byte	0x60
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"SR1\000"
	.byte	0x2
	.byte	0x61
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xa
	.ascii	"SR2\000"
	.byte	0x2
	.byte	0x62
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xa
	.ascii	"CCR\000"
	.byte	0x2
	.byte	0x63
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF67
	.byte	0x2
	.byte	0x64
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF68
	.byte	0x2
	.byte	0x65
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF69
	.byte	0x2
	.byte	0x68
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
	.byte	0x6a
	.byte	0x8
	.4byte	0x543
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x2
	.byte	0x6d
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF71
	.byte	0x2
	.byte	0x6e
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.ascii	"PAR\000"
	.byte	0x2
	.byte	0x6f
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF72
	.byte	0x2
	.byte	0x70
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF73
	.byte	0x2
	.byte	0x71
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"FCR\000"
	.byte	0x2
	.byte	0x72
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0xd0
	.byte	0x2
	.byte	0x76
	.byte	0x8
	.4byte	0x590
	.uleb128 0xb
	.4byte	.LASF75
	.byte	0x2
	.byte	0x79
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF76
	.byte	0x2
	.byte	0x7a
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF77
	.byte	0x2
	.byte	0x7b
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF78
	.byte	0x2
	.byte	0x7c
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"S\000"
	.byte	0x2
	.byte	0x7d
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
	.byte	0x7f
	.byte	0xf
	.4byte	0x5b2
	.uleb128 0x5
	.byte	0x3
	.4byte	DMA2
	.uleb128 0x5
	.byte	0x4
	.4byte	0x543
	.uleb128 0xc
	.ascii	"var\000"
	.byte	0x1
	.byte	0xa
	.byte	0xf
	.4byte	0x4d
	.uleb128 0x5
	.byte	0x3
	.4byte	var
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x5da
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x63
	.byte	0
	.uleb128 0x8
	.4byte	.LASF80
	.byte	0x1
	.byte	0xa
	.byte	0x15
	.4byte	0x5ca
	.uleb128 0x5
	.byte	0x3
	.4byte	buffer
	.uleb128 0xd
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x14d
	.byte	0x6
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61c
	.uleb128 0xe
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x14f
	.byte	0xa
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x146
	.byte	0x6
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x642
	.uleb128 0x11
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x146
	.byte	0x21
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x13d
	.byte	0xf
	.4byte	0x4d
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x130
	.byte	0x6
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x681
	.uleb128 0x11
	.ascii	"var\000"
	.byte	0x1
	.2byte	0x130
	.byte	0x1d
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x122
	.byte	0x6
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6a9
	.uleb128 0x13
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x124
	.byte	0x13
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x10e
	.byte	0x6
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6fe
	.uleb128 0x13
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x110
	.byte	0xc
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.ascii	"val\000"
	.byte	0x1
	.2byte	0x112
	.byte	0x10
	.4byte	0x6fe
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x114
	.byte	0xc
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x14
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x114
	.byte	0x15
	.4byte	0x54
	.byte	0
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x70e
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x1
	.byte	0
	.uleb128 0x15
	.4byte	.LASF89
	.byte	0x1
	.byte	0xee
	.byte	0x6
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7b8
	.uleb128 0x16
	.ascii	"Ax\000"
	.byte	0x1
	.byte	0xf1
	.byte	0xc
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii	"Ay\000"
	.byte	0x1
	.byte	0xf1
	.byte	0xf
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x16
	.ascii	"Az\000"
	.byte	0x1
	.byte	0xf1
	.byte	0x12
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii	"Axx\000"
	.byte	0x1
	.byte	0xf2
	.byte	0x15
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x16
	.ascii	"Ayy\000"
	.byte	0x1
	.byte	0xf2
	.byte	0x19
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii	"Azz\000"
	.byte	0x1
	.byte	0xf2
	.byte	0x1d
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xf4
	.byte	0x10
	.4byte	0x7b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.4byte	.LASF90
	.byte	0x1
	.byte	0xf6
	.byte	0xc
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x17
	.4byte	.LASF91
	.byte	0x1
	.byte	0xf6
	.byte	0x14
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF92
	.byte	0x1
	.byte	0xf6
	.byte	0x1c
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.byte	0
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x7c8
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x5
	.byte	0
	.uleb128 0x18
	.4byte	.LASF93
	.byte	0x1
	.byte	0xbe
	.byte	0x6
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x837
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0xbe
	.byte	0x1e
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x19
	.4byte	.LASF95
	.byte	0x1
	.byte	0xbe
	.byte	0x35
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x19
	.4byte	.LASF85
	.byte	0x1
	.byte	0xbe
	.byte	0x4d
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF96
	.byte	0x1
	.byte	0xbe
	.byte	0x60
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0x16
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xc0
	.byte	0x1d
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.byte	0xc0
	.byte	0x21
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF97
	.byte	0x1
	.byte	0x9e
	.byte	0x6
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8a6
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0x9e
	.byte	0x1f
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x19
	.4byte	.LASF95
	.byte	0x1
	.byte	0x9e
	.byte	0x36
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x19
	.4byte	.LASF85
	.byte	0x1
	.byte	0x9e
	.byte	0x4e
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF96
	.byte	0x1
	.byte	0x9e
	.byte	0x61
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0x16
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xa0
	.byte	0x1c
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.byte	0xa0
	.byte	0x20
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF98
	.byte	0x1
	.byte	0x7b
	.byte	0x7
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.4byte	.LASF99
	.byte	0x1
	.byte	0x61
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.4byte	.LASF100
	.byte	0x1
	.byte	0x43
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.4byte	.LASF101
	.byte	0x1
	.byte	0x28
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF107
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.4byte	0x25
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xf
	.byte	0x10
	.4byte	0x7b8
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
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
.LASF52:
	.ascii	"DCKCFGR\000"
.LASF35:
	.ascii	"APB1ENR\000"
.LASF103:
	.ascii	"main.c\000"
.LASF58:
	.ascii	"BSRR\000"
.LASF44:
	.ascii	"APB2LPENR\000"
.LASF28:
	.ascii	"APB2RSTR\000"
.LASF80:
	.ascii	"buffer\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF82:
	.ascii	"usart_print\000"
.LASF47:
	.ascii	"BDCR\000"
.LASF99:
	.ascii	"usart_init\000"
.LASF71:
	.ascii	"NDTR\000"
.LASF12:
	.ascii	"NVIC_ICER\000"
.LASF15:
	.ascii	"NVIC_IABR\000"
.LASF17:
	.ascii	"GTPR\000"
.LASF86:
	.ascii	"mpu_tmperature\000"
.LASF13:
	.ascii	"NVIC_ISPR\000"
.LASF78:
	.ascii	"HIFCR\000"
.LASF31:
	.ascii	"AHB1ENR\000"
.LASF91:
	.ascii	"ACCEL_Y\000"
.LASF92:
	.ascii	"ACCEL_Z\000"
.LASF50:
	.ascii	"SSCGR\000"
.LASF96:
	.ascii	"n_bytes\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF77:
	.ascii	"LIFCR\000"
.LASF105:
	.ascii	"usart_rx\000"
.LASF54:
	.ascii	"MODER\000"
.LASF64:
	.ascii	"I2C_s\000"
.LASF61:
	.ascii	"AFRH\000"
.LASF60:
	.ascii	"AFRL\000"
.LASF89:
	.ascii	"mpu_calculate\000"
.LASF87:
	.ascii	"temp2\000"
.LASF98:
	.ascii	"i2c1_init\000"
.LASF65:
	.ascii	"OAR1\000"
.LASF66:
	.ascii	"OAR2\000"
.LASF72:
	.ascii	"M0AR\000"
.LASF57:
	.ascii	"PUPDR\000"
.LASF27:
	.ascii	"APB1RSTR\000"
.LASF93:
	.ascii	"i2c1_read\000"
.LASF10:
	.ascii	"char\000"
.LASF42:
	.ascii	"reserved10\000"
.LASF45:
	.ascii	"reserved11\000"
.LASF46:
	.ascii	"reserved12\000"
.LASF48:
	.ascii	"reserved13\000"
.LASF49:
	.ascii	"reserved14\000"
.LASF75:
	.ascii	"LISR\000"
.LASF84:
	.ascii	"mpu_init\000"
.LASF85:
	.ascii	"data\000"
.LASF67:
	.ascii	"TRISE\000"
.LASF70:
	.ascii	"DMA_STREAM_s\000"
.LASF19:
	.ascii	"USART_s\000"
.LASF11:
	.ascii	"NVIC_ISER\000"
.LASF1:
	.ascii	"long long int\000"
.LASF43:
	.ascii	"APB1LPENR\000"
.LASF62:
	.ascii	"GPIOA\000"
.LASF63:
	.ascii	"GPIOB\000"
.LASF18:
	.ascii	"USART2\000"
.LASF76:
	.ascii	"HISR\000"
.LASF36:
	.ascii	"APB2ENR\000"
.LASF39:
	.ascii	"AHB1LPENR\000"
.LASF56:
	.ascii	"OSPEEDR\000"
.LASF83:
	.ascii	"usart_tx\000"
.LASF2:
	.ascii	"long double\000"
.LASF24:
	.ascii	"AHB2RSTR\000"
.LASF79:
	.ascii	"DMA2\000"
.LASF5:
	.ascii	"short int\000"
.LASF95:
	.ascii	"reg_addr\000"
.LASF7:
	.ascii	"long int\000"
.LASF68:
	.ascii	"FLTR\000"
.LASF81:
	.ascii	"delay\000"
.LASF16:
	.ascii	"NVIC_IPR\000"
.LASF55:
	.ascii	"OTYPER\000"
.LASF22:
	.ascii	"CFGR\000"
.LASF94:
	.ascii	"dev_addr\000"
.LASF53:
	.ascii	"GPIO_s\000"
.LASF25:
	.ascii	"reserved1\000"
.LASF26:
	.ascii	"reserved2\000"
.LASF29:
	.ascii	"reserved3\000"
.LASF30:
	.ascii	"reserved4\000"
.LASF33:
	.ascii	"reserved5\000"
.LASF34:
	.ascii	"reserved6\000"
.LASF37:
	.ascii	"reserved7\000"
.LASF38:
	.ascii	"reserved8\000"
.LASF41:
	.ascii	"reserved9\000"
.LASF21:
	.ascii	"PLLCFGR\000"
.LASF73:
	.ascii	"M1AR\000"
.LASF100:
	.ascii	"GPIO_CONFIG\000"
.LASF88:
	.ascii	"TEMP_1\000"
.LASF106:
	.ascii	"TEMP_2\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF32:
	.ascii	"AHB2ENR\000"
.LASF74:
	.ascii	"DMA_s\000"
.LASF51:
	.ascii	"PLLI2SCFGR\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF14:
	.ascii	"NVIC_ICPR\000"
.LASF102:
	.ascii	"GNU C17 10.3.1 20210824 (release) -mcpu=cortex-m4 -"
	.ascii	"mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -march=ar"
	.ascii	"mv7e-m+fp -g\000"
.LASF3:
	.ascii	"signed char\000"
.LASF97:
	.ascii	"i2c1_write\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF101:
	.ascii	"RCC_CONFIG\000"
.LASF104:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/I2C_MPU6050\000"
.LASF107:
	.ascii	"main\000"
.LASF20:
	.ascii	"RCC_s\000"
.LASF69:
	.ascii	"I2C1\000"
.LASF40:
	.ascii	"AHB2LPENR\000"
.LASF23:
	.ascii	"AHB1RSTR\000"
.LASF59:
	.ascii	"LCKR\000"
.LASF90:
	.ascii	"ACCEL_X\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
