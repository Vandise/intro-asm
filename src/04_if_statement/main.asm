default rel

%include "common.inc"

section .data
  value:		dq	10
  condition:	dq	 5

section .bss

section .text
  global start

start:
  nop

  mov	rax,	[value]
  mov	rbx,	[condition]
  cmp	rax,	rbx
  jge	.gte_branch
  mov	rdi,	0
  jmp			.end

.gte_branch:
  mov	rdi,	1

.end:
  mov	rax,	SYS_EXIT
  syscall
