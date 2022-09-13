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
	.global	GPIOC
	.align	2
	.type	GPIOC, %object
	.size	GPIOC, 4
GPIOC:
	.word	1073874944
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
	.global	mystr
	.align	2
	.type	mystr, %object
	.size	mystr, 12
mystr:
	.ascii	"school of\015\012\000"
	.global	str
	.align	2
	.type	str, %object
	.size	str, 8
str:
	.ascii	"linux\015\012\000"
	.global	debg_var
	.bss
	.align	2
	.type	debg_var, %object
	.size	debg_var, 36
debg_var:
	.space	36
	.global	i2c_buffer
	.align	2
	.type	i2c_buffer, %object
	.size	i2c_buffer, 14
i2c_buffer:
	.space	14
	.global	buffer
	.align	2
	.type	buffer, %object
	.size	buffer, 100
buffer:
	.space	100
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
	.loc 1 25 1
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
	.loc 1 27 16
	movs	r3, #0
	strb	r3, [r7, #3]
	.loc 1 30 15
	ldr	r0, .L5
	bl	strlen
	mov	r3, r0
	.loc 1 30 10
	str	r3, [r7, #8]
	.loc 1 31 15
	ldr	r0, .L5+4
	bl	strlen
	mov	r3, r0
	.loc 1 31 10
	str	r3, [r7, #4]
	.loc 1 33 6
	bl	RCC_CONFIG
	.loc 1 34 6
	bl	GPIO_CONFIG
	.loc 1 36 2
	bl	i2c1_init
	.loc 1 37 5
	bl	NVIC_CONFIG
	.loc 1 38 3
	adds	r2, r7, #3
	movs	r3, #1
	movs	r1, #107
	movs	r0, #208
	bl	i2c1_write
	.loc 1 39 11
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 39 2
	b	.L2
.L3:
	.loc 1 39 34 discriminator 3
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	.loc 1 39 2 discriminator 1
	ldr	r3, [r7, #12]
	ldr	r2, .L5+8
	cmp	r3, r2
	bcc	.L3
	.loc 1 40 10
	ldr	r3, .L5+12
	ldr	r3, [r3]
	.loc 1 40 16
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 41 5
	adds	r2, r7, #3
	movs	r3, #1
	movs	r1, #117
	movs	r0, #208
	bl	i2c1_read
.L4:
	.loc 1 42 10 discriminator 1
	b	.L4
.L6:
	.align	2
.L5:
	.word	mystr
	.word	str
	.word	10000000
	.word	GPIOC
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
	.loc 1 47 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 48 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #48]
	.loc 1 49 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #48]
	.loc 1 50 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #48]
	.loc 1 52 15
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L9
	ldr	r3, [r3]
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 53 15
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #65536
	str	r2, [r3]
	.loc 1 54 12
	nop
.L8:
	.loc 1 54 17 discriminator 1
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 54 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 54 12 discriminator 1
	cmp	r3, #0
	beq	.L8
	.loc 1 56 17
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L9
	ldr	r3, [r3]
	bic	r2, r2, #3
	str	r2, [r3, #8]
	.loc 1 57 17
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #8]
	.loc 1 58 12
	nop
	.loc 1 60 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #68]
	.loc 1 62 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #64]
	.loc 1 64 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #68]
	.loc 1 66 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #48]
	.loc 1 68 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #4194304
	str	r2, [r3, #48]
	.loc 1 70 20
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L9
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #64]
	.loc 1 72 1
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
	.loc 1 75 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 76 21
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3]
	.loc 1 77 21
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L12
	ldr	r3, [r3]
	orr	r2, r2, #160
	str	r2, [r3]
	.loc 1 79 22
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #4]
	.loc 1 81 21
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3, #12]
	.loc 1 83 20
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #3840
	str	r2, [r3, #32]
	.loc 1 84 20
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12
	ldr	r3, [r3]
	orr	r2, r2, #1792
	str	r2, [r3, #32]
	.loc 1 86 20
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #32]
	.loc 1 87 20
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12
	ldr	r3, [r3]
	orr	r2, r2, #28672
	str	r2, [r3, #32]
	.loc 1 90 21
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3]
	.loc 1 91 21
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r2, r2, #40960
	str	r2, [r3]
	.loc 1 93 22
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r2, r2, #192
	str	r2, [r3, #4]
	.loc 1 95 21
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #12]
	.loc 1 97 20
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	bic	r2, r2, #251658240
	str	r2, [r3, #32]
	.loc 1 98 20
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r2, r2, #67108864
	str	r2, [r3, #32]
	.loc 1 100 20
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	bic	r2, r2, #-268435456
	str	r2, [r3, #32]
	.loc 1 101 20
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L12+4
	ldr	r3, [r3]
	orr	r2, r2, #1073741824
	str	r2, [r3, #32]
	.loc 1 104 11
	ldr	r3, .L12+8
	ldr	r3, [r3]
	.loc 1 104 19
	mov	r2, #67108864
	str	r2, [r3]
	.loc 1 105 13
	ldr	r3, .L12+8
	ldr	r3, [r3]
	.loc 1 105 22
	mov	r2, #8192
	str	r2, [r3, #4]
	.loc 1 106 13
	ldr	r3, .L12+8
	ldr	r3, [r3]
	.loc 1 106 19
	mov	r2, #8192
	str	r2, [r3, #20]
	.loc 1 107 1
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
	.word	GPIOC
	.cfi_endproc
.LFE2:
	.size	GPIO_CONFIG, .-GPIO_CONFIG
	.align	1
	.global	i2c1_init
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_init, %function
i2c1_init:
.LFB3:
	.loc 1 110 2
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 113 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3]
	.loc 1 115 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3]
	.loc 1 117 16
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3]
	.loc 1 119 16
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #2048
	str	r2, [r3]
	.loc 1 121 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3]
	.loc 1 123 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3]
	.loc 1 125 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3]
	.loc 1 127 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #16
	str	r2, [r3]
	.loc 1 129 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3]
	.loc 1 131 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3]
	.loc 1 133 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #4]
	.loc 1 135 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L15
	ldr	r3, [r3]
	bic	r2, r2, #63
	str	r2, [r3, #4]
	.loc 1 136 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #25
	str	r2, [r3, #4]
	.loc 1 138 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #1536
	str	r2, [r3, #4]
	.loc 1 140 13
	ldr	r3, .L15
	ldr	r3, [r3]
	.loc 1 140 19
	movs	r2, #125
	str	r2, [r3, #28]
	.loc 1 142 13
	ldr	r3, .L15
	ldr	r3, [r3]
	.loc 1 142 21
	movs	r2, #24
	str	r2, [r3, #32]
	.loc 1 144 19
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L15
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 145 3
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
	.word	I2C1
	.cfi_endproc
.LFE3:
	.size	i2c1_init, .-i2c1_init
	.align	1
	.global	i2c1_write
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_write, %function
i2c1_write:
.LFB4:
	.loc 1 148 1
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
	.loc 1 151 23
	ldr	r2, .L20
	ldrb	r3, [r7, #7]
	strb	r3, [r2]
	.loc 1 152 23
	ldr	r2, .L20
	ldrb	r3, [r7, #6]
	strb	r3, [r2, #1]
	.loc 1 153 8
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 153 3
	b	.L18
.L19:
	.loc 1 155 30 discriminator 3
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	add	r2, r2, r3
	.loc 1 155 20 discriminator 3
	ldr	r3, [r7, #8]
	.loc 1 155 30 discriminator 3
	ldrb	r1, [r2]	@ zero_extendqisi2
	.loc 1 155 24 discriminator 3
	ldr	r2, .L20
	add	r3, r3, r2
	mov	r2, r1
	strb	r2, [r3, #2]
	.loc 1 153 23 discriminator 3
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L18:
	.loc 1 153 13 discriminator 1
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	ldr	r3, [r7, #8]
	.loc 1 153 3 discriminator 1
	cmp	r2, r3
	bhi	.L19
	.loc 1 157 22
	ldr	r2, .L20
	ldrb	r3, [r7, #5]
	strb	r3, [r2, #12]
	.loc 1 158 19
	ldr	r3, .L20
	movs	r2, #0
	strb	r2, [r3, #13]
	.loc 1 159 13
	ldr	r3, .L20+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L20+4
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 160 3
	ldr	r3, .L20+8
	ldr	r3, [r3]
	.loc 1 160 17
	mov	r2, #-2147483648
	str	r2, [r3]
	.loc 1 162 1
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
.L21:
	.align	2
.L20:
	.word	i2c_buffer
	.word	I2C1
	.word	NVIC_ISER
	.cfi_endproc
.LFE4:
	.size	i2c1_write, .-i2c1_write
	.align	1
	.global	i2c1_read
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_read, %function
i2c1_read:
.LFB5:
	.loc 1 165 1
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
	.loc 1 168 22
	ldr	r2, .L23
	ldrb	r3, [r7, #7]
	strb	r3, [r2]
	.loc 1 169 22
	ldr	r2, .L23
	ldrb	r3, [r7, #6]
	strb	r3, [r2, #1]
	.loc 1 176 21
	ldr	r2, .L23
	ldrb	r3, [r7, #5]
	strb	r3, [r2, #12]
	.loc 1 177 18
	ldr	r3, .L23
	movs	r2, #1
	strb	r2, [r3, #13]
	.loc 1 179 15
	ldr	r3, .L23+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L23+4
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 180 2
	ldr	r3, .L23+8
	ldr	r3, [r3]
	.loc 1 180 16
	mov	r2, #-2147483648
	str	r2, [r3]
	.loc 1 182 1
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
.L24:
	.align	2
.L23:
	.word	i2c_buffer
	.word	I2C1
	.word	NVIC_ISER
	.cfi_endproc
.LFE5:
	.size	i2c1_read, .-i2c1_read
	.align	1
	.global	NVIC_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	NVIC_CONFIG, %function
NVIC_CONFIG:
.LFB6:
	.loc 1 185 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 187 2
	ldr	r3, .L26
	ldr	r3, [r3]
	.loc 1 187 16
	mov	r2, #-2147483648
	str	r2, [r3]
	.loc 1 188 5
	ldr	r3, .L26+4
	ldr	r3, [r3]
	.loc 1 188 19
	mov	r2, #-2147483648
	str	r2, [r3]
	.loc 1 189 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L27:
	.align	2
.L26:
	.word	NVIC_ICPR
	.word	NVIC_ISER
	.cfi_endproc
.LFE6:
	.size	NVIC_CONFIG, .-NVIC_CONFIG
	.align	1
	.global	I2C1_EV_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	I2C1_EV_IRQHandler, %function
I2C1_EV_IRQHandler:
.LFB7:
	.loc 1 192 1
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
	.loc 1 194 15
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 195 24
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 195 30
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 196 5
	ldr	r3, .L39
	ldr	r3, [r3]
	.loc 1 196 19
	mov	r2, #-2147483648
	str	r2, [r3]
	.loc 1 197 12
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 197 6
	str	r3, [r7, #8]
	.loc 1 198 12
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 198 6
	str	r3, [r7, #4]
	.loc 1 199 9
	ldr	r3, [r7, #8]
	and	r3, r3, #1
	.loc 1 199 4
	cmp	r3, #0
	beq	.L29
	.loc 1 201 11
	ldr	r3, .L39+8
	ldr	r3, [r3]
	.loc 1 201 14
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2]
	.loc 1 202 4
	ldr	r3, .L39+12
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 203 16
	ldr	r3, .L39+16
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	.loc 1 203 5
	cmp	r3, #0
	bne	.L30
	.loc 1 205 25
	ldr	r3, .L39+16
	ldrb	r2, [r3]	@ zero_extendqisi2
	.loc 1 205 8
	ldr	r3, .L39+4
	ldr	r3, [r3]
	.loc 1 205 13
	str	r2, [r3, #16]
	b	.L31
.L30:
	.loc 1 207 21
	ldr	r3, .L39+16
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	.loc 1 207 10
	cmp	r3, #1
	bne	.L31
	.loc 1 209 17
	ldr	r3, .L39+20
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 209 6
	cmp	r3, #0
	bne	.L32
	.loc 1 211 26
	ldr	r3, .L39+16
	ldrb	r2, [r3]	@ zero_extendqisi2
	.loc 1 211 9
	ldr	r3, .L39+4
	ldr	r3, [r3]
	.loc 1 211 14
	str	r2, [r3, #16]
	.loc 1 212 15
	ldr	r3, .L39+20
	movs	r2, #1
	strb	r2, [r3]
	b	.L31
.L32:
	.loc 1 216 26
	ldr	r3, .L39+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 216 36
	orr	r3, r3, #1
	uxtb	r2, r3
	.loc 1 216 9
	ldr	r3, .L39+4
	ldr	r3, [r3]
	.loc 1 216 14
	str	r2, [r3, #16]
	.loc 1 217 15
	ldr	r3, .L39+20
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 218 21
	ldr	r3, .L39+16
	movs	r2, #2
	strb	r2, [r3, #13]
	b	.L31
.L29:
	.loc 1 222 14
	ldr	r3, [r7, #8]
	and	r3, r3, #2
	.loc 1 222 9
	cmp	r3, #0
	beq	.L33
	.loc 1 224 13
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 224 7
	str	r3, [r7, #8]
	.loc 1 225 13
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 225 7
	str	r3, [r7, #4]
	.loc 1 226 11
	ldr	r3, .L39+8
	ldr	r3, [r3, #4]
	.loc 1 226 14
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2, #4]
	.loc 1 227 10
	ldr	r3, [r7, #8]
	and	r3, r3, #128
	.loc 1 227 5
	cmp	r3, #0
	beq	.L31
	.loc 1 230 25
	ldr	r3, .L39+16
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	.loc 1 230 8
	ldr	r3, .L39+4
	ldr	r3, [r3]
	.loc 1 230 13
	str	r2, [r3, #16]
	b	.L31
.L33:
	.loc 1 233 14
	ldr	r3, [r7, #8]
	and	r3, r3, #128
	.loc 1 233 9
	cmp	r3, #0
	beq	.L34
	.loc 1 235 11
	ldr	r3, .L39+8
	ldr	r3, [r3, #8]
	.loc 1 235 14
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2, #8]
	.loc 1 236 16
	ldr	r3, .L39+16
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	.loc 1 236 5
	cmp	r3, #1
	bne	.L35
	.loc 1 238 15
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L39+4
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 239 12
	ldr	r3, .L39+8
	ldr	r3, [r3, #32]
	.loc 1 239 15
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2, #32]
	.loc 1 240 8
	ldr	r3, .L39+4
	ldr	r3, [r3]
	.loc 1 240 13
	movs	r2, #0
	str	r2, [r3, #16]
	b	.L31
.L35:
	.loc 1 242 23
	ldr	r3, .L39+16
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	.loc 1 242 12
	ldr	r3, .L39+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 242 10
	cmp	r2, r3
	bls	.L36
	.loc 1 244 32
	ldr	r3, .L39+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r2, r3, #1
	uxtb	r1, r2
	ldr	r2, .L39+12
	strb	r1, [r2]
	mov	r2, r3
	.loc 1 244 30
	ldr	r3, .L39+16
	add	r3, r3, r2
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	.loc 1 244 8
	ldr	r3, .L39+4
	ldr	r3, [r3]
	.loc 1 244 13
	str	r2, [r3, #16]
	b	.L31
.L36:
	.loc 1 248 18
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L39+4
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 249 8
	ldr	r3, .L39+4
	ldr	r3, [r3]
	.loc 1 249 13
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 1 250 12
	ldr	r3, .L39+8
	ldr	r3, [r3, #12]
	.loc 1 250 15
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2, #12]
	b	.L31
.L34:
	.loc 1 255 14
	ldr	r3, [r7, #8]
	and	r3, r3, #64
	.loc 1 255 9
	cmp	r3, #0
	beq	.L37
	.loc 1 257 11
	ldr	r3, .L39+8
	ldr	r3, [r3, #16]
	.loc 1 257 14
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2, #16]
	.loc 1 258 18
	ldr	r3, .L39+16
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	.loc 1 258 7
	ldr	r3, .L39+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 258 5
	cmp	r2, r3
	bls	.L31
	.loc 1 260 31
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r0, [r3, #16]
	.loc 1 260 21
	ldr	r3, .L39+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r2, r3, #1
	uxtb	r1, r2
	ldr	r2, .L39+12
	strb	r1, [r2]
	mov	r1, r3
	.loc 1 260 25
	uxtb	r2, r0
	ldr	r3, .L39+16
	add	r3, r3, r1
	strb	r2, [r3, #2]
	.loc 1 261 19
	ldr	r3, .L39+16
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	.loc 1 261 8
	ldr	r3, .L39+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 261 6
	cmp	r2, r3
	bhi	.L38
	.loc 1 263 15
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L39+4
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3]
	.loc 1 264 19
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L39+4
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 265 13
	ldr	r3, .L39+8
	ldr	r3, [r3, #24]
	.loc 1 265 16
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2, #24]
	b	.L31
.L38:
	.loc 1 270 13
	ldr	r3, .L39+8
	ldr	r3, [r3, #28]
	.loc 1 270 16
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2, #28]
	.loc 1 271 15
	ldr	r3, .L39+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L39+4
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3]
	b	.L31
.L37:
	.loc 1 278 8 discriminator 1
	b	.L37
.L31:
	.loc 1 280 10
	ldr	r3, .L39+8
	ldr	r3, [r3, #20]
	.loc 1 280 13
	adds	r3, r3, #1
	ldr	r2, .L39+8
	str	r3, [r2, #20]
	.loc 1 281 2
	ldr	r3, .L39+24
	ldr	r3, [r3]
	.loc 1 281 16
	mov	r2, #-2147483648
	str	r2, [r3]
	.loc 1 291 6
	ldr	r3, .L39+28
	ldr	r3, [r3]
	.loc 1 291 20
	mov	r2, #-2147483648
	str	r2, [r3]
	.loc 1 292 1
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
.L40:
	.align	2
.L39:
	.word	NVIC_ICER
	.word	I2C1
	.word	debg_var
	.word	i.1
	.word	i2c_buffer
	.word	first_time.0
	.word	NVIC_ICPR
	.word	NVIC_ISER
	.cfi_endproc
.LFE7:
	.size	I2C1_EV_IRQHandler, .-I2C1_EV_IRQHandler
	.bss
i.1:
	.space	1
	.size	i.1, 1
first_time.0:
	.space	1
	.size	first_time.0, 1
	.text
.Letext0:
	.file 2 "main.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x89f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0xc
	.4byte	.LASF104
	.4byte	.LASF105
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
	.4byte	0x7d
	.4byte	0x94
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.4byte	0x33
	.4byte	0xa4
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x2
	.byte	0x12
	.byte	0x19
	.4byte	0xb6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISER
	.uleb128 0x5
	.byte	0x4
	.4byte	0x94
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x2
	.byte	0x13
	.byte	0x19
	.4byte	0xb6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICER
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x2
	.byte	0x14
	.byte	0x19
	.4byte	0xb6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISPR
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x2
	.byte	0x15
	.byte	0x19
	.4byte	0xb6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICPR
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x2
	.byte	0x16
	.byte	0x19
	.4byte	0xb6
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IABR
	.uleb128 0x6
	.4byte	0x33
	.4byte	0x114
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x3b
	.byte	0
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x2
	.byte	0x17
	.byte	0x19
	.4byte	0x126
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IPR
	.uleb128 0x5
	.byte	0x4
	.4byte	0x104
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x1c
	.byte	0x2
	.byte	0x19
	.byte	0x8
	.4byte	0x193
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x2
	.byte	0x1b
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x2
	.byte	0x1c
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x2
	.byte	0x1d
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x2
	.byte	0x1e
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x2
	.byte	0x1f
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"CR3\000"
	.byte	0x2
	.byte	0x20
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x2
	.byte	0x21
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x2
	.byte	0x23
	.byte	0x11
	.4byte	0x1a5
	.uleb128 0x5
	.byte	0x3
	.4byte	USART1
	.uleb128 0x5
	.byte	0x4
	.4byte	0x12c
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x8c
	.byte	0x2
	.byte	0x25
	.byte	0x8
	.4byte	0x37f
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x2
	.byte	0x27
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x2
	.byte	0x28
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x2
	.byte	0x29
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x2
	.byte	0x2a
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x2
	.byte	0x2b
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x2
	.byte	0x2c
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x2
	.byte	0x2d
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x2
	.byte	0x2e
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x2
	.byte	0x2f
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x2
	.byte	0x30
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x2
	.byte	0x31
	.byte	0xf
	.4byte	0x2c
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x2
	.byte	0x32
	.byte	0xf
	.4byte	0x2c
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x2
	.byte	0x33
	.byte	0xf
	.4byte	0x2c
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x2
	.byte	0x34
	.byte	0xf
	.4byte	0x2c
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x2
	.byte	0x35
	.byte	0xf
	.4byte	0x2c
	.byte	0x38
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x2
	.byte	0x36
	.byte	0xf
	.4byte	0x2c
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x2
	.byte	0x37
	.byte	0xf
	.4byte	0x2c
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x2
	.byte	0x38
	.byte	0xf
	.4byte	0x2c
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x2
	.byte	0x39
	.byte	0xf
	.4byte	0x2c
	.byte	0x48
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x2
	.byte	0x3a
	.byte	0xf
	.4byte	0x2c
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x2
	.byte	0x3b
	.byte	0xf
	.4byte	0x2c
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x2
	.byte	0x3c
	.byte	0xf
	.4byte	0x2c
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x2
	.byte	0x3d
	.byte	0xf
	.4byte	0x2c
	.byte	0x58
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x2
	.byte	0x3e
	.byte	0xf
	.4byte	0x2c
	.byte	0x5c
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x2
	.byte	0x3f
	.byte	0xf
	.4byte	0x2c
	.byte	0x60
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x2
	.byte	0x40
	.byte	0xf
	.4byte	0x2c
	.byte	0x64
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x2
	.byte	0x41
	.byte	0xf
	.4byte	0x2c
	.byte	0x68
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x2
	.byte	0x42
	.byte	0xf
	.4byte	0x2c
	.byte	0x6c
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x2
	.byte	0x43
	.byte	0xf
	.4byte	0x2c
	.byte	0x70
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x2
	.byte	0x44
	.byte	0xf
	.4byte	0x2c
	.byte	0x74
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x2
	.byte	0x45
	.byte	0xf
	.4byte	0x2c
	.byte	0x78
	.uleb128 0xb
	.4byte	.LASF49
	.byte	0x2
	.byte	0x46
	.byte	0xf
	.4byte	0x2c
	.byte	0x7c
	.uleb128 0xb
	.4byte	.LASF50
	.byte	0x2
	.byte	0x47
	.byte	0xf
	.4byte	0x2c
	.byte	0x80
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x2
	.byte	0x48
	.byte	0xf
	.4byte	0x2c
	.byte	0x84
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x2
	.byte	0x49
	.byte	0xf
	.4byte	0x2c
	.byte	0x88
	.byte	0
	.uleb128 0xc
	.ascii	"RCC\000"
	.byte	0x2
	.byte	0x4b
	.byte	0xf
	.4byte	0x391
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC
	.uleb128 0x5
	.byte	0x4
	.4byte	0x1ab
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0x28
	.byte	0x2
	.byte	0x4d
	.byte	0x8
	.4byte	0x427
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x2
	.byte	0x50
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x2
	.byte	0x51
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x2
	.byte	0x52
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x2
	.byte	0x53
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x2
	.byte	0x54
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x2
	.byte	0x55
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x2
	.byte	0x56
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x2
	.byte	0x57
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x2
	.byte	0x58
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x2
	.byte	0x59
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF62
	.byte	0x2
	.byte	0x5b
	.byte	0x10
	.4byte	0x439
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOA
	.uleb128 0x5
	.byte	0x4
	.4byte	0x397
	.uleb128 0x8
	.4byte	.LASF63
	.byte	0x2
	.byte	0x5c
	.byte	0x10
	.4byte	0x439
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB
	.uleb128 0x8
	.4byte	.LASF64
	.byte	0x2
	.byte	0x5d
	.byte	0x10
	.4byte	0x439
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOC
	.uleb128 0x9
	.4byte	.LASF65
	.byte	0x28
	.byte	0x2
	.byte	0x60
	.byte	0x8
	.4byte	0x4f2
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x2
	.byte	0x62
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x2
	.byte	0x63
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF66
	.byte	0x2
	.byte	0x64
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF67
	.byte	0x2
	.byte	0x65
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x2
	.byte	0x66
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"SR1\000"
	.byte	0x2
	.byte	0x67
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xa
	.ascii	"SR2\000"
	.byte	0x2
	.byte	0x68
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xa
	.ascii	"CCR\000"
	.byte	0x2
	.byte	0x69
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF68
	.byte	0x2
	.byte	0x6a
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF69
	.byte	0x2
	.byte	0x6b
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF70
	.byte	0x2
	.byte	0x6e
	.byte	0xf
	.4byte	0x504
	.uleb128 0x5
	.byte	0x3
	.4byte	I2C1
	.uleb128 0x5
	.byte	0x4
	.4byte	0x463
	.uleb128 0x9
	.4byte	.LASF71
	.byte	0x18
	.byte	0x2
	.byte	0x70
	.byte	0x8
	.4byte	0x565
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x2
	.byte	0x73
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF72
	.byte	0x2
	.byte	0x74
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.ascii	"PAR\000"
	.byte	0x2
	.byte	0x75
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF73
	.byte	0x2
	.byte	0x76
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF74
	.byte	0x2
	.byte	0x77
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"FCR\000"
	.byte	0x2
	.byte	0x78
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.4byte	.LASF75
	.byte	0xd0
	.byte	0x2
	.byte	0x7c
	.byte	0x8
	.4byte	0x5b2
	.uleb128 0xb
	.4byte	.LASF76
	.byte	0x2
	.byte	0x7f
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF77
	.byte	0x2
	.byte	0x80
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF78
	.byte	0x2
	.byte	0x81
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF79
	.byte	0x2
	.byte	0x82
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"S\000"
	.byte	0x2
	.byte	0x83
	.byte	0x16
	.4byte	0x5b2
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.4byte	0x50a
	.4byte	0x5c2
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.4byte	.LASF80
	.byte	0x2
	.byte	0x85
	.byte	0xf
	.4byte	0x5d4
	.uleb128 0x5
	.byte	0x3
	.4byte	DMA2
	.uleb128 0x5
	.byte	0x4
	.4byte	0x565
	.uleb128 0x6
	.4byte	0x7d
	.4byte	0x5ea
	.uleb128 0x7
	.4byte	0x2c
	.byte	0xb
	.byte	0
	.uleb128 0x8
	.4byte	.LASF81
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.4byte	0x5da
	.uleb128 0x5
	.byte	0x3
	.4byte	mystr
	.uleb128 0xc
	.ascii	"str\000"
	.byte	0x1
	.byte	0xa
	.byte	0x6
	.4byte	0x84
	.uleb128 0x5
	.byte	0x3
	.4byte	str
	.uleb128 0x6
	.4byte	0x2c
	.4byte	0x61e
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.4byte	.LASF82
	.byte	0x1
	.byte	0xb
	.byte	0xe
	.4byte	0x60e
	.uleb128 0x5
	.byte	0x3
	.4byte	debg_var
	.uleb128 0x9
	.4byte	.LASF83
	.byte	0xe
	.byte	0x1
	.byte	0xc
	.byte	0x8
	.4byte	0x67f
	.uleb128 0xb
	.4byte	.LASF84
	.byte	0x1
	.byte	0xe
	.byte	0x10
	.4byte	0x4d
	.byte	0
	.uleb128 0xb
	.4byte	.LASF85
	.byte	0x1
	.byte	0xf
	.byte	0x10
	.4byte	0x4d
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF86
	.byte	0x1
	.byte	0x10
	.byte	0x10
	.4byte	0x67f
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF87
	.byte	0x1
	.byte	0x11
	.byte	0x10
	.4byte	0x4d
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF88
	.byte	0x1
	.byte	0x12
	.byte	0x10
	.4byte	0x4d
	.byte	0xd
	.byte	0
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x68f
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x9
	.byte	0
	.uleb128 0x8
	.4byte	.LASF89
	.byte	0x1
	.byte	0x15
	.byte	0x19
	.4byte	0x630
	.uleb128 0x5
	.byte	0x3
	.4byte	i2c_buffer
	.uleb128 0x6
	.4byte	0x4d
	.4byte	0x6b1
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x63
	.byte	0
	.uleb128 0x8
	.4byte	.LASF90
	.byte	0x1
	.byte	0x17
	.byte	0xf
	.4byte	0x6a1
	.uleb128 0x5
	.byte	0x3
	.4byte	buffer
	.uleb128 0xd
	.4byte	.LASF93
	.byte	0x1
	.byte	0xbf
	.byte	0x6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x729
	.uleb128 0xe
	.ascii	"i\000"
	.byte	0x1
	.byte	0xc1
	.byte	0x17
	.4byte	0x4d
	.uleb128 0x5
	.byte	0x3
	.4byte	i.1
	.uleb128 0xf
	.4byte	.LASF91
	.byte	0x1
	.byte	0xc1
	.byte	0x1b
	.4byte	0x4d
	.uleb128 0x5
	.byte	0x3
	.4byte	first_time.0
	.uleb128 0xf
	.4byte	.LASF92
	.byte	0x1
	.byte	0xc2
	.byte	0xf
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"sr1\000"
	.byte	0x1
	.byte	0xc3
	.byte	0x18
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.ascii	"sr2\000"
	.byte	0x1
	.byte	0xc3
	.byte	0x1e
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x10
	.4byte	.LASF96
	.byte	0x1
	.byte	0xb8
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF94
	.byte	0x1
	.byte	0xa4
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7aa
	.uleb128 0x11
	.4byte	.LASF84
	.byte	0x1
	.byte	0xa4
	.byte	0x1e
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x11
	.4byte	.LASF85
	.byte	0x1
	.byte	0xa4
	.byte	0x35
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x11
	.4byte	.LASF86
	.byte	0x1
	.byte	0xa4
	.byte	0x4d
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF87
	.byte	0x1
	.byte	0xa4
	.byte	0x60
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0xe
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xa6
	.byte	0x1b
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"i\000"
	.byte	0x1
	.byte	0xa6
	.byte	0x1f
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF95
	.byte	0x1
	.byte	0x93
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x819
	.uleb128 0x11
	.4byte	.LASF84
	.byte	0x1
	.byte	0x93
	.byte	0x1f
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x11
	.4byte	.LASF85
	.byte	0x1
	.byte	0x93
	.byte	0x36
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x11
	.4byte	.LASF86
	.byte	0x1
	.byte	0x93
	.byte	0x4e
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF87
	.byte	0x1
	.byte	0x93
	.byte	0x61
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0xe
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x95
	.byte	0x1c
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"i\000"
	.byte	0x1
	.byte	0x95
	.byte	0x20
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x10
	.4byte	.LASF97
	.byte	0x1
	.byte	0x6d
	.byte	0x7
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF98
	.byte	0x1
	.byte	0x4a
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF99
	.byte	0x1
	.byte	0x2e
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF106
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.4byte	0x25
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.ascii	"var\000"
	.byte	0x1
	.byte	0x1b
	.byte	0x10
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0xf
	.4byte	.LASF100
	.byte	0x1
	.byte	0x1c
	.byte	0xf
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF101
	.byte	0x1
	.byte	0x1e
	.byte	0xa
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xf
	.4byte	.LASF102
	.byte	0x1
	.byte	0x1f
	.byte	0xa
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
.LASF73:
	.ascii	"M0AR\000"
.LASF11:
	.ascii	"NVIC_ISER\000"
.LASF55:
	.ascii	"OTYPER\000"
.LASF68:
	.ascii	"TRISE\000"
.LASF67:
	.ascii	"OAR2\000"
.LASF53:
	.ascii	"GPIO_s\000"
.LASF54:
	.ascii	"MODER\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF83:
	.ascii	"i2c_data_request\000"
.LASF57:
	.ascii	"PUPDR\000"
.LASF96:
	.ascii	"NVIC_CONFIG\000"
.LASF39:
	.ascii	"AHB1LPENR\000"
.LASF52:
	.ascii	"DCKCFGR\000"
.LASF1:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF84:
	.ascii	"dev_addr\000"
.LASF58:
	.ascii	"BSRR\000"
.LASF23:
	.ascii	"AHB1RSTR\000"
.LASF17:
	.ascii	"GTPR\000"
.LASF87:
	.ascii	"n_bytes\000"
.LASF85:
	.ascii	"reg_addr\000"
.LASF7:
	.ascii	"long int\000"
.LASF28:
	.ascii	"APB2RSTR\000"
.LASF99:
	.ascii	"RCC_CONFIG\000"
.LASF20:
	.ascii	"RCC_s\000"
.LASF69:
	.ascii	"FLTR\000"
.LASF21:
	.ascii	"PLLCFGR\000"
.LASF102:
	.ascii	"byte\000"
.LASF56:
	.ascii	"OSPEEDR\000"
.LASF70:
	.ascii	"I2C1\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF81:
	.ascii	"mystr\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF86:
	.ascii	"data\000"
.LASF101:
	.ascii	"size\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF14:
	.ascii	"NVIC_ICPR\000"
.LASF51:
	.ascii	"PLLI2SCFGR\000"
.LASF19:
	.ascii	"USART_s\000"
.LASF104:
	.ascii	"main.c\000"
.LASF77:
	.ascii	"HISR\000"
.LASF65:
	.ascii	"I2C_s\000"
.LASF44:
	.ascii	"APB2LPENR\000"
.LASF80:
	.ascii	"DMA2\000"
.LASF71:
	.ascii	"DMA_STREAM_s\000"
.LASF78:
	.ascii	"LIFCR\000"
.LASF13:
	.ascii	"NVIC_ISPR\000"
.LASF103:
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
.LASF98:
	.ascii	"GPIO_CONFIG\000"
.LASF40:
	.ascii	"AHB2LPENR\000"
.LASF105:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/I2C_with_INTE"
	.ascii	"RRUPT\000"
.LASF27:
	.ascii	"APB1RSTR\000"
.LASF62:
	.ascii	"GPIOA\000"
.LASF63:
	.ascii	"GPIOB\000"
.LASF64:
	.ascii	"GPIOC\000"
.LASF61:
	.ascii	"AFRH\000"
.LASF60:
	.ascii	"AFRL\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF100:
	.ascii	"delay\000"
.LASF5:
	.ascii	"short int\000"
.LASF75:
	.ascii	"DMA_s\000"
.LASF94:
	.ascii	"i2c1_read\000"
.LASF36:
	.ascii	"APB2ENR\000"
.LASF91:
	.ascii	"first_time\000"
.LASF82:
	.ascii	"debg_var\000"
.LASF89:
	.ascii	"i2c_buffer\000"
.LASF10:
	.ascii	"char\000"
.LASF24:
	.ascii	"AHB2RSTR\000"
.LASF90:
	.ascii	"buffer\000"
.LASF72:
	.ascii	"NDTR\000"
.LASF95:
	.ascii	"i2c1_write\000"
.LASF35:
	.ascii	"APB1ENR\000"
.LASF47:
	.ascii	"BDCR\000"
.LASF32:
	.ascii	"AHB2ENR\000"
.LASF74:
	.ascii	"M1AR\000"
.LASF50:
	.ascii	"SSCGR\000"
.LASF92:
	.ascii	"exit\000"
.LASF25:
	.ascii	"reserved1\000"
.LASF29:
	.ascii	"reserved3\000"
.LASF45:
	.ascii	"reserved11\000"
.LASF97:
	.ascii	"i2c1_init\000"
.LASF38:
	.ascii	"reserved8\000"
.LASF66:
	.ascii	"OAR1\000"
.LASF15:
	.ascii	"NVIC_IABR\000"
.LASF88:
	.ascii	"read\000"
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
.LASF106:
	.ascii	"main\000"
.LASF93:
	.ascii	"I2C1_EV_IRQHandler\000"
.LASF79:
	.ascii	"HIFCR\000"
.LASF76:
	.ascii	"LISR\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
