	.file	"ejemploOptimizacion.c"
	.text
	.p2align 4,,15
	.globl	funcion
	.type	funcion, @function
funcion:
.LFB24:
	.cfi_startproc
	testl	%edi, %edi
	je	.L4
	movsd	.LC0(%rip), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	addl	$1, %eax
	mulsd	%xmm0, %xmm1
	cmpl	%edi, %eax
	jne	.L3
.L2:
	movapd	%xmm1, %xmm0
	ret
.L4:
	movsd	.LC0(%rip), %xmm1
	jmp	.L2
	.cfi_endproc
.LFE24:
	.size	funcion, .-funcion
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"suma = %g\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	movsd	.LC0(%rip), %xmm1
	xorl	%esi, %esi
	xorpd	%xmm0, %xmm0
	movl	$-858993459, %edi
	movapd	%xmm1, %xmm3
.L7:
	addl	$1, %esi
	addsd	%xmm1, %xmm0
	cmpl	$100000, %esi
	je	.L13
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%esi, %eax
	cvtsi2sd	%esi, %xmm2
	mull	%edi
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	movl	%esi, %edx
	subl	%eax, %edx
	je	.L11
	movapd	%xmm3, %xmm1
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L9:
	addl	$1, %ecx
	mulsd	%xmm2, %xmm1
	cmpl	%edx, %ecx
	jne	.L9
	addl	$1, %esi
	addsd	%xmm1, %xmm0
	cmpl	$100000, %esi
	jne	.L10
.L13:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
.L11:
	movapd	%xmm3, %xmm1
	jmp	.L7
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu/Linaro 4.8.1-10ubuntu9) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
