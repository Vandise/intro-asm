default rel

%include "common.inc"

section .data

  value:		dq	100
  condition:	dq	105

section .bss

section .text
  global start

start:
  nop

  mov	rax,	[value]
  mov	rbx,	[condition]
  cmp	rax,	rbx
  jnle			.else			; if rax < rbx, 1

.if_less_or_equal:
  mov	rdi,	1
  jmp			.end

.else:							; else 0
  mov	rdi,	0

.end:
  mov	rax,	SYS_EXIT
  syscall
