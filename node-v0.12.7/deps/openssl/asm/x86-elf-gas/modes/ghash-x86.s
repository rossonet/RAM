.file	"ghash-x86.s"
.text
.globl	gcm_gmult_4bit_x86
.type	gcm_gmult_4bit_x86,@function
.align	16
gcm_gmult_4bit_x86:
.L_gcm_gmult_4bit_x86_begin:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	subl	$84,%esp
	movl	104(%esp),%edi
	movl	108(%esp),%esi
	movl	(%edi),%ebp
	movl	4(%edi),%edx
	movl	8(%edi),%ecx
	movl	12(%edi),%ebx
	movl	$0,16(%esp)
	movl	$471859200,20(%esp)
	movl	$943718400,24(%esp)
	movl	$610271232,28(%esp)
	movl	$1887436800,32(%esp)
	movl	$1822425088,36(%esp)
	movl	$1220542464,40(%esp)
	movl	$1423966208,44(%esp)
	movl	$3774873600,48(%esp)
	movl	$4246732800,52(%esp)
	movl	$3644850176,56(%esp)
	movl	$3311403008,60(%esp)
	movl	$2441084928,64(%esp)
	movl	$2376073216,68(%esp)
	movl	$2847932416,72(%esp)
	movl	$3051356160,76(%esp)
	movl	%ebp,(%esp)
	movl	%edx,4(%esp)
	movl	%ecx,8(%esp)
	movl	%ebx,12(%esp)
	shrl	$20,%ebx
	andl	$240,%ebx
	movl	4(%esi,%ebx,1),%ebp
	movl	(%esi,%ebx,1),%edx
	movl	12(%esi,%ebx,1),%ecx
	movl	8(%esi,%ebx,1),%ebx
	xorl	%eax,%eax
	movl	$15,%edi
	jmp	.L000x86_loop
.align	16
.L000x86_loop:
	movb	%bl,%al
	shrdl	$4,%ecx,%ebx
	andb	$15,%al
	shrdl	$4,%edx,%ecx
	shrdl	$4,%ebp,%edx
	shrl	$4,%ebp
	xorl	16(%esp,%eax,4),%ebp
	movb	(%esp,%edi,1),%al
	andb	$240,%al
	xorl	8(%esi,%eax,1),%ebx
	xorl	12(%esi,%eax,1),%ecx
	xorl	(%esi,%eax,1),%edx
	xorl	4(%esi,%eax,1),%ebp
	decl	%edi
	js	.L001x86_break
	movb	%bl,%al
	shrdl	$4,%ecx,%ebx
	andb	$15,%al
	shrdl	$4,%edx,%ecx
	shrdl	$4,%ebp,%edx
	shrl	$4,%ebp
	xorl	16(%esp,%eax,4),%ebp
	movb	(%esp,%edi,1),%al
	shlb	$4,%al
	xorl	8(%esi,%eax,1),%ebx
	xorl	12(%esi,%eax,1),%ecx
	xorl	(%esi,%eax,1),%edx
	xorl	4(%esi,%eax,1),%ebp
	jmp	.L000x86_loop
.align	16
.L001x86_break:
	bswap	%ebx
	bswap	%ecx
	bswap	%edx
	bswap	%ebp
	movl	104(%esp),%edi
	movl	%ebx,12(%edi)
	movl	%ecx,8(%edi)
	movl	%edx,4(%edi)
	movl	%ebp,(%edi)
	addl	$84,%esp
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%ebp
	ret
.size	gcm_gmult_4bit_x86,.-.L_gcm_gmult_4bit_x86_begin
.globl	gcm_ghash_4bit_x86
.type	gcm_ghash_4bit_x86,@function
.align	16
gcm_ghash_4bit_x86:
.L_gcm_ghash_4bit_x86_begin:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	subl	$84,%esp
	movl	104(%esp),%ebx
	movl	108(%esp),%esi
	movl	112(%esp),%edi
	movl	116(%esp),%ecx
	addl	%edi,%ecx
	movl	%ecx,116(%esp)
	movl	(%ebx),%ebp
	movl	4(%ebx),%edx
	movl	8(%ebx),%ecx
	movl	12(%ebx),%ebx
	movl	$0,16(%esp)
	movl	$471859200,20(%esp)
	movl	$943718400,24(%esp)
	movl	$610271232,28(%esp)
	movl	$1887436800,32(%esp)
	movl	$1822425088,36(%esp)
	movl	$1220542464,40(%esp)
	movl	$1423966208,44(%esp)
	movl	$3774873600,48(%esp)
	movl	$4246732800,52(%esp)
	movl	$3644850176,56(%esp)
	movl	$3311403008,60(%esp)
	movl	$2441084928,64(%esp)
	movl	$2376073216,68(%esp)
	movl	$2847932416,72(%esp)
	movl	$3051356160,76(%esp)
.align	16
.L002x86_outer_loop:
	xorl	12(%edi),%ebx
	xorl	8(%edi),%ecx
	xorl	4(%edi),%edx
	xorl	(%edi),%ebp
	movl	%ebx,12(%esp)
	movl	%ecx,8(%esp)
	movl	%edx,4(%esp)
	movl	%ebp,(%esp)
	shrl	$20,%ebx
	andl	$240,%ebx
	movl	4(%esi,%ebx,1),%ebp
	movl	(%esi,%ebx,1),%edx
	movl	12(%esi,%ebx,1),%ecx
	movl	8(%esi,%ebx,1),%ebx
	xorl	%eax,%eax
	movl	$15,%edi
	jmp	.L003x86_loop
.align	16
.L003x86_loop:
	movb	%bl,%al
	shrdl	$4,%ecx,%ebx
	andb	$15,%al
	shrdl	$4,%edx,%ecx
	shrdl	$4,%ebp,%edx
	shrl	$4,%ebp
	xorl	16(%esp,%eax,4),%ebp
	movb	(%esp,%edi,1),%al
	andb	$240,%al
	xorl	8(%esi,%eax,1),%ebx
	xorl	12(%esi,%eax,1),%ecx
	xorl	(%esi,%eax,1),%edx
	xorl	4(%esi,%eax,1),%ebp
	decl	%edi
	js	.L004x86_break
	movb	%bl,%al
	shrdl	$4,%ecx,%ebx
	andb	$15,%al
	shrdl	$4,%edx,%ecx
	shrdl	$4,%ebp,%edx
	shrl	$4,%ebp
	xorl	16(%esp,%eax,4),%ebp
	movb	(%esp,%edi,1),%al
	shlb	$4,%al
	xorl	8(%esi,%eax,1),%ebx
	xorl	12(%esi,%eax,1),%ecx
	xorl	(%esi,%eax,1),%edx
	xorl	4(%esi,%eax,1),%ebp
	jmp	.L003x86_loop
.align	16
.L004x86_break:
	bswap	%ebx
	bswap	%ecx
	bswap	%edx
	bswap	%ebp
	movl	112(%esp),%edi
	leal	16(%edi),%edi
	cmpl	116(%esp),%edi
	movl	%edi,112(%esp)
	jb	.L002x86_outer_loop
	movl	104(%esp),%edi
	movl	%ebx,12(%edi)
	movl	%ecx,8(%edi)
	movl	%edx,4(%edi)
	movl	%ebp,(%edi)
	addl	$84,%esp
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%ebp
	ret
.size	gcm_ghash_4bit_x86,.-.L_gcm_ghash_4bit_x86_begin
.type	_mmx_gmult_4bit_inner,@function
.align	16
_mmx_gmult_4bit_inner:
	xorl	%ecx,%ecx
	movl	%ebx,%edx
	movb	%dl,%cl
	shlb	$4,%cl
	andl	$240,%edx
	movq	8(%esi,%ecx,1),%mm0
	movq	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	14(%edi),%cl
	psllq	$60,%mm2
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	13(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	12(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	11(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	10(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	9(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	8(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	7(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	6(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	5(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	4(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	3(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	2(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	1(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	movb	(%edi),%cl
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movl	%ecx,%edx
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	shlb	$4,%cl
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%ecx,1),%mm0
	psllq	$60,%mm2
	andl	$240,%edx
	pxor	(%eax,%ebp,8),%mm1
	andl	$15,%ebx
	pxor	(%esi,%ecx,1),%mm1
	movd	%mm0,%ebp
	pxor	%mm2,%mm0
	psrlq	$4,%mm0
	movq	%mm1,%mm2
	psrlq	$4,%mm1
	pxor	8(%esi,%edx,1),%mm0
	psllq	$60,%mm2
	pxor	(%eax,%ebx,8),%mm1
	andl	$15,%ebp
	pxor	(%esi,%edx,1),%mm1
	movd	%mm0,%ebx
	pxor	%mm2,%mm0
	movl	4(%eax,%ebp,8),%edi
	psrlq	$32,%mm0
	movd	%mm1,%edx
	psrlq	$32,%mm1
	movd	%mm0,%ecx
	movd	%mm1,%ebp
	shll	$4,%edi
	bswap	%ebx
	bswap	%edx
	bswap	%ecx
	xorl	%edi,%ebp
	bswap	%ebp
	ret
.size	_mmx_gmult_4bit_inner,.-_mmx_gmult_4bit_inner
.globl	gcm_gmult_4bit_mmx
.type	gcm_gmult_4bit_mmx,@function
.align	16
gcm_gmult_4bit_mmx:
.L_gcm_gmult_4bit_mmx_begin:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	20(%esp),%edi
	movl	24(%esp),%esi
	call	.L005pic_point
.L005pic_point:
	popl	%eax
	leal	.Lrem_4bit-.L005pic_point(%eax),%eax
	movzbl	15(%edi),%ebx
	call	_mmx_gmult_4bit_inner
	movl	20(%esp),%edi
	emms
	movl	%ebx,12(%edi)
	movl	%edx,4(%edi)
	movl	%ecx,8(%edi)
	movl	%ebp,(%edi)
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%ebp
	ret
.size	gcm_gmult_4bit_mmx,.-.L_gcm_gmult_4bit_mmx_begin
.globl	gcm_ghash_4bit_mmx
.type	gcm_ghash_4bit_mmx,@function
.align	16
gcm_ghash_4bit_mmx:
.L_gcm_ghash_4bit_mmx_begin:
	pushl	%ebp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	20(%esp),%ebp
	movl	24(%esp),%esi
	movl	28(%esp),%edi
	movl	32(%esp),%ecx
	call	.L006pic_point
.L006pic_point:
	popl	%eax
	leal	.Lrem_4bit-.L006pic_point(%eax),%eax
	addl	%edi,%ecx
	movl	%ecx,32(%esp)
	subl	$20,%esp
	movl	12(%ebp),%ebx
	movl	4(%ebp),%edx
	movl	8(%ebp),%ecx
	movl	(%ebp),%ebp
	jmp	.L007mmx_outer_loop
.align	16
.L007mmx_outer_loop:
	xorl	12(%edi),%ebx
	xorl	4(%edi),%edx
	xorl	8(%edi),%ecx
	xorl	(%edi),%ebp
	movl	%edi,48(%esp)
	movl	%ebx,12(%esp)
	movl	%edx,4(%esp)
	movl	%ecx,8(%esp)
	movl	%ebp,(%esp)
	movl	%esp,%edi
	shrl	$24,%ebx
	call	_mmx_gmult_4bit_inner
	movl	48(%esp),%edi
	leal	16(%edi),%edi
	cmpl	52(%esp),%edi
	jb	.L007mmx_outer_loop
	movl	40(%esp),%edi
	emms
	movl	%ebx,12(%edi)
	movl	%edx,4(%edi)
	movl	%ecx,8(%edi)
	movl	%ebp,(%edi)
	addl	$20,%esp
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%ebp
	ret
.size	gcm_ghash_4bit_mmx,.-.L_gcm_ghash_4bit_mmx_begin
.align	64
.Lrem_4bit:
.long	0,0,0,29491200,0,58982400,0,38141952
.long	0,117964800,0,113901568,0,76283904,0,88997888
.long	0,235929600,0,265420800,0,227803136,0,206962688
.long	0,152567808,0,148504576,0,177995776,0,190709760
.align	64
.L008rem_8bit:
.value	0,450,900,582,1800,1738,1164,1358
.value	3600,4050,3476,3158,2328,2266,2716,2910
.value	7200,7650,8100,7782,6952,6890,6316,6510
.value	4656,5106,4532,4214,5432,5370,5820,6014
.value	14400,14722,15300,14854,16200,16010,15564,15630
.value	13904,14226,13780,13334,12632,12442,13020,13086
.value	9312,9634,10212,9766,9064,8874,8428,8494
.value	10864,11186,10740,10294,11640,11450,12028,12094
.value	28800,28994,29444,29382,30600,30282,29708,30158
.value	32400,32594,32020,31958,31128,30810,31260,31710
.value	27808,28002,28452,28390,27560,27242,26668,27118
.value	25264,25458,24884,24822,26040,25722,26172,26622
.value	18624,18690,19268,19078,20424,19978,19532,19854
.value	18128,18194,17748,17558,16856,16410,16988,17310
.value	21728,21794,22372,22182,21480,21034,20588,20910
.value	23280,23346,22900,22710,24056,23610,24188,24510
.value	57600,57538,57988,58182,58888,59338,58764,58446
.value	61200,61138,60564,60758,59416,59866,60316,59998
.value	64800,64738,65188,65382,64040,64490,63916,63598
.value	62256,62194,61620,61814,62520,62970,63420,63102
.value	55616,55426,56004,56070,56904,57226,56780,56334
.value	55120,54930,54484,54550,53336,53658,54236,53790
.value	50528,50338,50916,50982,49768,50090,49644,49198
.value	52080,51890,51444,51510,52344,52666,53244,52798
.value	37248,36930,37380,37830,38536,38730,38156,38094
.value	40848,40530,39956,40406,39064,39258,39708,39646
.value	36256,35938,36388,36838,35496,35690,35116,35054
.value	33712,33394,32820,33270,33976,34170,34620,34558
.value	43456,43010,43588,43910,44744,44810,44364,44174
.value	42960,42514,42068,42390,41176,41242,41820,41630
.value	46560,46114,46692,47014,45800,45866,45420,45230
.value	48112,47666,47220,47542,48376,48442,49020,48830
.byte	71,72,65,83,72,32,102,111,114,32,120,56,54,44,32,67
.byte	82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112
.byte	112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62
.byte	0
