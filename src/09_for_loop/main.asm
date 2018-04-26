default rel

%include "common.inc"

section .data
  counter:	dq	5
  arr:		dq	2,2,3,4,5

section .bss

section .text
  global	start

start:
  nop

  mov	rdx,	[counter]
  xor	rcx,	rcx
  xor	rdi,	rdi

.for:
  cmp	rcx,	rdx
  je			.end_for

  mov	rax,	arr
  add	rdi,	[rax+rcx*8]

  inc			rcx
  jmp			.for
.end_for:

  mov	rax,	SYS_EXIT
  syscall
