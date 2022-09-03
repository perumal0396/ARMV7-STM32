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
	.loc 1 123 1
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
	.loc 1 125 15
	ldr	r0, .L3
	bl	strlen
	mov	r3, r0
	.loc 1 125 10
	str	r3, [r7, #4]
	.loc 1 126 15
	ldr	r0, .L3+4
	bl	strlen
	mov	r3, r0
	.loc 1 126 10
	str	r3, [r7]
	.loc 1 128 6
	bl	RCC_CONFIG
	.loc 1 129 6
	bl	GPIO_CONFIG
	.loc 1 130 6
	bl	USART1_INIT
	.loc 1 132 6
	bl	DMA_INIT
	.loc 1 133 6
	ldr	r3, .L3
	ldr	r1, [r7, #4]
	mov	r0, r3
	bl	DMA2_SEND
	.loc 1 134 6
	ldr	r3, .L3+4
	ldr	r1, [r7]
	mov	r0, r3
	bl	DMA2_SEND
.L2:
	.loc 1 135 11 discriminator 1
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
	.loc 1 140 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 141 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #48]
	.loc 1 142 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #48]
	.loc 1 143 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #48]
	.loc 1 145 15
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L7
	ldr	r3, [r3]
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 146 15
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #65536
	str	r2, [r3]
	.loc 1 147 12
	nop
.L6:
	.loc 1 147 17 discriminator 1
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 147 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 147 12 discriminator 1
	cmp	r3, #0
	beq	.L6
	.loc 1 149 17
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L7
	ldr	r3, [r3]
	bic	r2, r2, #3
	str	r2, [r3, #8]
	.loc 1 150 17
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #8]
	.loc 1 151 12
	nop
	.loc 1 153 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #68]
	.loc 1 155 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #64]
	.loc 1 157 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #68]
	.loc 1 159 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #48]
	.loc 1 161 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #4194304
	str	r2, [r3, #48]
	.loc 1 162 1
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
	.loc 1 164 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 165 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3]
	.loc 1 166 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #160
	str	r2, [r3]
	.loc 1 168 22
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #4]
	.loc 1 170 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3, #12]
	.loc 1 172 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #3840
	str	r2, [r3, #32]
	.loc 1 173 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #1792
	str	r2, [r3, #32]
	.loc 1 175 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #32]
	.loc 1 176 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #28672
	str	r2, [r3, #32]
	.loc 1 178 21
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3]
	.loc 1 179 21
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #40960
	str	r2, [r3]
	.loc 1 181 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #251658240
	str	r2, [r3, #32]
	.loc 1 182 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #117440512
	str	r2, [r3, #32]
	.loc 1 184 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #-268435456
	str	r2, [r3, #32]
	.loc 1 185 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #1879048192
	str	r2, [r3, #32]
	.loc 1 186 1
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
	.loc 1 188 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 190 15
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	.loc 1 192 22
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	ldr	r2, .L13
	ldr	r2, [r2]
	bic	r3, r3, #65280
	bic	r3, r3, #240
	str	r3, [r2, #8]
	.loc 1 194 15
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r3, [r3, #8]
	ldr	r2, .L13
	ldr	r2, [r2]
	orr	r3, r3, #5184
	orr	r3, r3, #16
	str	r3, [r2, #8]
	.loc 1 196 15
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #15
	str	r2, [r3, #8]
	.loc 1 198 15
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #8]
	.loc 1 200 22
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #32768
	str	r2, [r3, #12]
	.loc 1 202 22
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3, #12]
	.loc 1 204 22
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	.loc 1 206 22
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #128
	str	r2, [r3, #20]
	.loc 1 208 22
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #20]
	.loc 1 210 21
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3]
	.loc 1 211 1
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
	.global	DMA_INIT
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA_INIT, %function
DMA_INIT:
.LFB4:
	.loc 1 213 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 214 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #184]
	.loc 1 216 15
	nop
.L16:
	.loc 1 216 21 discriminator 1
	ldr	r3, .L17
	ldr	r3, [r3]
	.loc 1 216 27 discriminator 1
	ldr	r3, [r3, #184]
	.loc 1 216 31 discriminator 1
	and	r3, r3, #1
	.loc 1 216 15 discriminator 1
	cmp	r3, #0
	bne	.L16
	.loc 1 218 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #234881024
	str	r2, [r3, #184]
	.loc 1 220 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	orr	r2, r2, #134217728
	str	r2, [r3, #184]
	.loc 1 222 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3, #184]
	.loc 1 224 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #196608
	str	r2, [r3, #184]
	.loc 1 226 25
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #204]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #204]
	.loc 1 228 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #25165824
	str	r2, [r3, #184]
	.loc 1 230 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #6291456
	str	r2, [r3, #184]
	.loc 1 232 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #524288
	str	r2, [r3, #184]
	.loc 1 234 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #262144
	str	r2, [r3, #184]
	.loc 1 236 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3, #184]
	.loc 1 238 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #24576
	str	r2, [r3, #184]
	.loc 1 240 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #6144
	str	r2, [r3, #184]
	.loc 1 242 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3, #184]
	.loc 1 244 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #512
	str	r2, [r3, #184]
	.loc 1 246 48
	ldr	r3, .L17+4
	ldr	r3, [r3]
	.loc 1 246 41
	adds	r2, r3, #4
	.loc 1 246 14
	ldr	r3, .L17
	ldr	r3, [r3]
	.loc 1 246 25
	str	r2, [r3, #192]
	.loc 1 248 17
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #256
	str	r2, [r3, #184]
	.loc 1 250 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	bic	r2, r2, #192
	str	r2, [r3, #184]
	.loc 1 252 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L17
	ldr	r3, [r3]
	orr	r2, r2, #64
	str	r2, [r3, #184]
	.loc 1 254 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L18:
	.align	2
.L17:
	.word	DMA2
	.word	USART1
	.cfi_endproc
.LFE4:
	.size	DMA_INIT, .-DMA_INIT
	.align	1
	.global	DMA2_SEND
	.syntax unified
	.thumb
	.thumb_func
	.type	DMA2_SEND, %function
DMA2_SEND:
.LFB5:
	.loc 1 256 1
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
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 257 20
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L22
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3]
	.loc 1 259 16
	ldr	r3, .L22+4
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L22+4
	ldr	r3, [r3]
	bic	r2, r2, #1
	str	r2, [r3, #184]
	.loc 1 261 7
	nop
.L20:
	.loc 1 261 14 discriminator 1
	ldr	r3, .L22+4
	ldr	r3, [r3]
	.loc 1 261 20 discriminator 1
	ldr	r3, [r3, #184]
	.loc 1 261 24 discriminator 1
	and	r3, r3, #1
	.loc 1 261 7 discriminator 1
	cmp	r3, #0
	bne	.L20
	.loc 1 263 6
	ldr	r3, .L22+4
	ldr	r3, [r3]
	.loc 1 263 18
	ldr	r2, [r7, #4]
	str	r2, [r3, #196]
	.loc 1 265 6
	ldr	r3, .L22+4
	ldr	r3, [r3]
	.loc 1 265 18
	ldr	r2, [r7]
	str	r2, [r3, #188]
	.loc 1 267 16
	ldr	r3, .L22+4
	ldr	r3, [r3]
	ldr	r2, [r3, #184]
	ldr	r3, .L22+4
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #184]
	.loc 1 269 14
	nop
.L21:
	.loc 1 269 21 discriminator 1
	ldr	r3, .L22+4
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	.loc 1 269 28 discriminator 1
	and	r3, r3, #134217728
	.loc 1 269 14 discriminator 1
	cmp	r3, #0
	beq	.L21
	.loc 1 271 12
	ldr	r3, .L22+4
	ldr	r3, [r3]
	.loc 1 271 20
	mov	r2, #201326592
	str	r2, [r3, #12]
	.loc 1 272 1
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
.L23:
	.align	2
.L22:
	.word	USART1
	.word	DMA2
	.cfi_endproc
.LFE5:
	.size	DMA2_SEND, .-DMA2_SEND
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5fe
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0xc
	.4byte	.LASF82
	.4byte	.LASF83
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
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x5
	.4byte	0x77
	.4byte	0x8e
	.uleb128 0x6
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.4byte	0x33
	.4byte	0x9e
	.uleb128 0x6
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x1
	.byte	0xb
	.byte	0x19
	.4byte	0xb0
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISER
	.uleb128 0x8
	.byte	0x4
	.4byte	0x8e
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0xc
	.byte	0x19
	.4byte	0xb0
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICER
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0xd
	.byte	0x19
	.4byte	0xb0
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISPR
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0xe
	.byte	0x19
	.4byte	0xb0
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICPR
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0xf
	.byte	0x19
	.4byte	0xb0
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IABR
	.uleb128 0x5
	.4byte	0x33
	.4byte	0x10e
	.uleb128 0x6
	.4byte	0x2c
	.byte	0x3b
	.byte	0
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x1
	.byte	0x10
	.byte	0x19
	.4byte	0x120
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IPR
	.uleb128 0x8
	.byte	0x4
	.4byte	0xfe
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x1c
	.byte	0x1
	.byte	0x11
	.byte	0x8
	.4byte	0x18d
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x1
	.byte	0x13
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x1
	.byte	0x14
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x1
	.byte	0x15
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x1
	.byte	0x16
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x1
	.byte	0x17
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"CR3\000"
	.byte	0x1
	.byte	0x18
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x1
	.byte	0x19
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1b
	.byte	0x11
	.4byte	0x19f
	.uleb128 0x5
	.byte	0x3
	.4byte	USART1
	.uleb128 0x8
	.byte	0x4
	.4byte	0x126
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x8c
	.byte	0x1
	.byte	0x1d
	.byte	0x8
	.4byte	0x379
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x1
	.byte	0x1f
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x1
	.byte	0x20
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x1
	.byte	0x21
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x1
	.byte	0x22
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x1
	.byte	0x23
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0x24
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x1
	.byte	0x25
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x1
	.byte	0x26
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x1
	.byte	0x27
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x1
	.byte	0x28
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x1
	.byte	0x29
	.byte	0xf
	.4byte	0x2c
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x1
	.byte	0x2a
	.byte	0xf
	.4byte	0x2c
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x1
	.byte	0x2b
	.byte	0xf
	.4byte	0x2c
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x1
	.byte	0x2c
	.byte	0xf
	.4byte	0x2c
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x1
	.byte	0x2d
	.byte	0xf
	.4byte	0x2c
	.byte	0x38
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x1
	.byte	0x2e
	.byte	0xf
	.4byte	0x2c
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x1
	.byte	0x2f
	.byte	0xf
	.4byte	0x2c
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x1
	.byte	0x30
	.byte	0xf
	.4byte	0x2c
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x1
	.byte	0x31
	.byte	0xf
	.4byte	0x2c
	.byte	0x48
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x1
	.byte	0x32
	.byte	0xf
	.4byte	0x2c
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x1
	.byte	0x33
	.byte	0xf
	.4byte	0x2c
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x1
	.byte	0x34
	.byte	0xf
	.4byte	0x2c
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x1
	.byte	0x35
	.byte	0xf
	.4byte	0x2c
	.byte	0x58
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x1
	.byte	0x36
	.byte	0xf
	.4byte	0x2c
	.byte	0x5c
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x1
	.byte	0x37
	.byte	0xf
	.4byte	0x2c
	.byte	0x60
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x1
	.byte	0x38
	.byte	0xf
	.4byte	0x2c
	.byte	0x64
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x1
	.byte	0x39
	.byte	0xf
	.4byte	0x2c
	.byte	0x68
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x1
	.byte	0x3a
	.byte	0xf
	.4byte	0x2c
	.byte	0x6c
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x1
	.byte	0x3b
	.byte	0xf
	.4byte	0x2c
	.byte	0x70
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x1
	.byte	0x3c
	.byte	0xf
	.4byte	0x2c
	.byte	0x74
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x1
	.byte	0x3d
	.byte	0xf
	.4byte	0x2c
	.byte	0x78
	.uleb128 0xb
	.4byte	.LASF49
	.byte	0x1
	.byte	0x3e
	.byte	0xf
	.4byte	0x2c
	.byte	0x7c
	.uleb128 0xb
	.4byte	.LASF50
	.byte	0x1
	.byte	0x3f
	.byte	0xf
	.4byte	0x2c
	.byte	0x80
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x1
	.byte	0x40
	.byte	0xf
	.4byte	0x2c
	.byte	0x84
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x1
	.byte	0x41
	.byte	0xf
	.4byte	0x2c
	.byte	0x88
	.byte	0
	.uleb128 0xc
	.ascii	"RCC\000"
	.byte	0x1
	.byte	0x43
	.byte	0xf
	.4byte	0x38b
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC
	.uleb128 0x8
	.byte	0x4
	.4byte	0x1a5
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0x28
	.byte	0x1
	.byte	0x45
	.byte	0x8
	.4byte	0x421
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x1
	.byte	0x48
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x1
	.byte	0x49
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x1
	.byte	0x4a
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x1
	.byte	0x4b
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x1
	.byte	0x4c
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x1
	.byte	0x4d
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x1
	.byte	0x4e
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x1
	.byte	0x4f
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x1
	.byte	0x50
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x1
	.byte	0x51
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0x7
	.4byte	.LASF62
	.byte	0x1
	.byte	0x53
	.byte	0x10
	.4byte	0x433
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOA
	.uleb128 0x8
	.byte	0x4
	.4byte	0x391
	.uleb128 0x7
	.4byte	.LASF63
	.byte	0x1
	.byte	0x54
	.byte	0x10
	.4byte	0x433
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x18
	.byte	0x1
	.byte	0x58
	.byte	0x8
	.4byte	0x4a6
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x1
	.byte	0x5b
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF65
	.byte	0x1
	.byte	0x5c
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.ascii	"PAR\000"
	.byte	0x1
	.byte	0x5d
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF66
	.byte	0x1
	.byte	0x5e
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF67
	.byte	0x1
	.byte	0x5f
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.ascii	"FCR\000"
	.byte	0x1
	.byte	0x60
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.4byte	.LASF68
	.byte	0xd0
	.byte	0x1
	.byte	0x64
	.byte	0x8
	.4byte	0x4f3
	.uleb128 0xb
	.4byte	.LASF69
	.byte	0x1
	.byte	0x67
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF70
	.byte	0x1
	.byte	0x68
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF71
	.byte	0x1
	.byte	0x69
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF72
	.byte	0x1
	.byte	0x6a
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.ascii	"S\000"
	.byte	0x1
	.byte	0x6b
	.byte	0x16
	.4byte	0x4f3
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.4byte	0x44b
	.4byte	0x503
	.uleb128 0x6
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.4byte	.LASF73
	.byte	0x1
	.byte	0x6d
	.byte	0xf
	.4byte	0x515
	.uleb128 0x5
	.byte	0x3
	.4byte	DMA2
	.uleb128 0x8
	.byte	0x4
	.4byte	0x4a6
	.uleb128 0x5
	.4byte	0x77
	.4byte	0x52b
	.uleb128 0x6
	.4byte	0x2c
	.byte	0xb
	.byte	0
	.uleb128 0x7
	.4byte	.LASF74
	.byte	0x1
	.byte	0x78
	.byte	0x6
	.4byte	0x51b
	.uleb128 0x5
	.byte	0x3
	.4byte	mystr
	.uleb128 0xc
	.ascii	"str\000"
	.byte	0x1
	.byte	0x79
	.byte	0x6
	.4byte	0x7e
	.uleb128 0x5
	.byte	0x3
	.4byte	str
	.uleb128 0xd
	.4byte	.LASF84
	.byte	0x1
	.byte	0xff
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x584
	.uleb128 0xe
	.ascii	"src\000"
	.byte	0x1
	.byte	0xff
	.byte	0x1d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"len\000"
	.byte	0x1
	.byte	0xff
	.byte	0x25
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xf
	.4byte	.LASF75
	.byte	0x1
	.byte	0xd4
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF76
	.byte	0x1
	.byte	0xbb
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF77
	.byte	0x1
	.byte	0xa3
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF78
	.byte	0x1
	.byte	0x8b
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF85
	.byte	0x1
	.byte	0x7a
	.byte	0x5
	.4byte	0x25
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF79
	.byte	0x1
	.byte	0x7d
	.byte	0xa
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF80
	.byte	0x1
	.byte	0x7e
	.byte	0xa
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
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
	.uleb128 0x11
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
.LASF66:
	.ascii	"M0AR\000"
.LASF11:
	.ascii	"NVIC_ISER\000"
.LASF55:
	.ascii	"OTYPER\000"
.LASF53:
	.ascii	"GPIO_s\000"
.LASF54:
	.ascii	"MODER\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF57:
	.ascii	"PUPDR\000"
.LASF39:
	.ascii	"AHB1LPENR\000"
.LASF52:
	.ascii	"DCKCFGR\000"
.LASF1:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF58:
	.ascii	"BSRR\000"
.LASF23:
	.ascii	"AHB1RSTR\000"
.LASF17:
	.ascii	"GTPR\000"
.LASF7:
	.ascii	"long int\000"
.LASF28:
	.ascii	"APB2RSTR\000"
.LASF78:
	.ascii	"RCC_CONFIG\000"
.LASF20:
	.ascii	"RCC_s\000"
.LASF76:
	.ascii	"USART1_INIT\000"
.LASF21:
	.ascii	"PLLCFGR\000"
.LASF80:
	.ascii	"byte\000"
.LASF56:
	.ascii	"OSPEEDR\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF74:
	.ascii	"mystr\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF75:
	.ascii	"DMA_INIT\000"
.LASF79:
	.ascii	"size\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF14:
	.ascii	"NVIC_ICPR\000"
.LASF51:
	.ascii	"PLLI2SCFGR\000"
.LASF19:
	.ascii	"USART_s\000"
.LASF82:
	.ascii	"main.c\000"
.LASF70:
	.ascii	"HISR\000"
.LASF44:
	.ascii	"APB2LPENR\000"
.LASF73:
	.ascii	"DMA2\000"
.LASF64:
	.ascii	"DMA_STREAM_s\000"
.LASF71:
	.ascii	"LIFCR\000"
.LASF13:
	.ascii	"NVIC_ISPR\000"
.LASF81:
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
.LASF77:
	.ascii	"GPIO_CONFIG\000"
.LASF40:
	.ascii	"AHB2LPENR\000"
.LASF84:
	.ascii	"DMA2_SEND\000"
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
.LASF4:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"short int\000"
.LASF68:
	.ascii	"DMA_s\000"
.LASF36:
	.ascii	"APB2ENR\000"
.LASF83:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/UART1_DMA\000"
.LASF10:
	.ascii	"char\000"
.LASF24:
	.ascii	"AHB2RSTR\000"
.LASF65:
	.ascii	"NDTR\000"
.LASF35:
	.ascii	"APB1ENR\000"
.LASF47:
	.ascii	"BDCR\000"
.LASF32:
	.ascii	"AHB2ENR\000"
.LASF67:
	.ascii	"M1AR\000"
.LASF50:
	.ascii	"SSCGR\000"
.LASF25:
	.ascii	"reserved1\000"
.LASF29:
	.ascii	"reserved3\000"
.LASF45:
	.ascii	"reserved11\000"
.LASF38:
	.ascii	"reserved8\000"
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
.LASF85:
	.ascii	"main\000"
.LASF72:
	.ascii	"HIFCR\000"
.LASF69:
	.ascii	"LISR\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
