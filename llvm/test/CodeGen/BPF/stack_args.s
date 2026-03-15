	.file	"stack_args.ll"
	.text
	.globl	callee                          # -- Begin function callee
	.p2align	3
	.type	callee,@function
callee:                                 # @callee
	.cfi_startproc
# %bb.0:
	r1 = *(u64 *)(r10 - 8)
	r0 = *(u64 *)(r10 - 16)
	r0 += r1
	exit
.Lfunc_end0:
	.size	callee, .Lfunc_end0-callee
	.cfi_endproc
                                        # -- End function
	.globl	caller                          # -- Begin function caller
	.p2align	3
	.type	caller,@function
caller:                                 # @caller
	.cfi_startproc
# %bb.0:
	r0 = *(u64 *)(r10 - 16)
	r6 = *(u64 *)(r10 - 8)
	*(u64 *)(r10 - 8) = r6
	*(u64 *)(r10 - 16) = r0
	call callee
	exit
.Lfunc_end1:
	.size	caller, .Lfunc_end1-caller
	.cfi_endproc
                                        # -- End function
