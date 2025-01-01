	.file	"act3.c"
	.text
	.globl	mx
	.def	mx;	.scl	2;	.type	32;	.endef
	.seh_proc	mx
mx:
	.seh_endprologue
	leal	(%rcx,%rcx,2), %eax
	sall	$2, %eax
	ret
	.seh_endproc
	.globl	addm
	.def	addm;	.scl	2;	.type	32;	.endef
	.seh_proc	addm
addm:
	.seh_endprologue
	leal	(%rcx,%rcx,2), %eax
	leal	1(,%rax,4), %eax
	ret
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r3) 14.1.0"
