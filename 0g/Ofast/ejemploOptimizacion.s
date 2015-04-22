	.file	"ejemploOptimizacion.c"
	.text
	.p2align 4,,15
	.globl	funcion
	.type	funcion, @function
funcion:
.LFB24:
	.cfi_startproc
	testl	%edi, %edi
	je	.L10
	movl	%edi, %ecx
	shrl	%ecx
	movl	%ecx, %edx
	addl	%edx, %edx
	je	.L11
	cmpl	$9, %edi
	jbe	.L11
	movapd	%xmm0, %xmm1
	xorl	%eax, %eax
	movapd	.LC0(%rip), %xmm2
	unpcklpd	%xmm1, %xmm1
.L9:
	addl	$1, %eax
	mulpd	%xmm1, %xmm2
	cmpl	%eax, %ecx
	ja	.L9
	movapd	%xmm2, -24(%rsp)
	cmpl	%edx, %edi
	movsd	-16(%rsp), %xmm1
	mulsd	%xmm2, %xmm1
	je	.L2
	leal	1(%rdx), %eax
	mulsd	%xmm0, %xmm1
	cmpl	%eax, %edi
	jbe	.L2
.L14:
	leal	2(%rdx), %eax
	mulsd	%xmm0, %xmm1
	cmpl	%eax, %edi
	jbe	.L2
	leal	3(%rdx), %eax
	mulsd	%xmm0, %xmm1
	cmpl	%eax, %edi
	jbe	.L2
	leal	4(%rdx), %eax
	mulsd	%xmm0, %xmm1
	cmpl	%eax, %edi
	jbe	.L2
	leal	5(%rdx), %eax
	mulsd	%xmm0, %xmm1
	cmpl	%eax, %edi
	jbe	.L2
	leal	6(%rdx), %eax
	mulsd	%xmm0, %xmm1
	cmpl	%eax, %edi
	jbe	.L2
	leal	7(%rdx), %eax
	mulsd	%xmm0, %xmm1
	cmpl	%eax, %edi
	jbe	.L2
	addl	$8, %edx
	mulsd	%xmm0, %xmm1
	cmpl	%edx, %edi
	jbe	.L2
	mulsd	%xmm0, %xmm1
	.p2align 4,,10
	.p2align 3
.L2:
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%edx, %edx
	movsd	.LC1(%rip), %xmm1
	leal	1(%rdx), %eax
	mulsd	%xmm0, %xmm1
	cmpl	%eax, %edi
	jbe	.L2
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L10:
	movsd	.LC1(%rip), %xmm1
	jmp	.L2
	.cfi_endproc
.LFE24:
	.size	funcion, .-funcion
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"suma = %g\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	movsd	.LC1(%rip), %xmm1
	xorl	%esi, %esi
	xorpd	%xmm0, %xmm0
	movl	$-858993459, %edi
	movapd	%xmm1, %xmm3
.L16:
	addl	$1, %esi
	addsd	%xmm1, %xmm0
	cmpl	$100000000, %esi
	je	.L22
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%esi, %eax
	cvtsi2sd	%esi, %xmm2
	mull	%edi
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	movl	%esi, %edx
	subl	%eax, %edx
	je	.L20
	movapd	%xmm3, %xmm1
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L18:
	addl	$1, %ecx
	mulsd	%xmm2, %xmm1
	cmpl	%edx, %ecx
	jne	.L18
	addl	$1, %esi
	addsd	%xmm1, %xmm0
	cmpl	$100000000, %esi
	jne	.L19
.L22:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
.L20:
	movapd	%xmm3, %xmm1
	jmp	.L16
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu/Linaro 4.8.1-10ubuntu9) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
