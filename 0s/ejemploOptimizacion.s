	.file	"ejemploOptimizacion.c"
	.text
	.globl	funcion
	.type	funcion, @function
funcion:
.LFB14:
	.cfi_startproc
	movsd	.LC0(%rip), %xmm1
	xorl	%eax, %eax
.L2:
	cmpl	%edi, %eax
	je	.L5
	mulsd	%xmm0, %xmm1
	incl	%eax
	jmp	.L2
.L5:
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE14:
	.size	funcion, .-funcion
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"suma = %g\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	xorps	%xmm0, %xmm0
	xorl	%ecx, %ecx
	movsd	.LC0(%rip), %xmm2
	movl	$5, %esi
.L10:
	cvtsi2sd	%ecx, %xmm3
	movl	%ecx, %eax
	xorl	%edx, %edx
	movapd	%xmm2, %xmm1
	divl	%esi
	xorl	%eax, %eax
.L7:
	cmpl	%edx, %eax
	je	.L12
	mulsd	%xmm3, %xmm1
	incl	%eax
	jmp	.L7
.L12:
	incl	%ecx
	addsd	%xmm1, %xmm0
	cmpl	$100000, %ecx
	jne	.L10
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.LC2, %esi
	movl	$1, %edi
	movb	$1, %al
	call	__printf_chk
	xorl	%eax, %eax
	popq	%rdx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu/Linaro 4.8.1-10ubuntu9) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
