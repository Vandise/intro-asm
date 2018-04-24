default rel

%include "common.inc"

section .data
  counter:	dq	10
  sum:		dq	0


section .bss

section .text
  global start

; Summation, 10 + 9 + 8 + 7 ...

start:
  nop

  mov	rbx,	0
  cmp	rbx,	[counter]
  jle			.end_while

  mov	rax,	[counter]
.while:

  add	[sum],	rax
  dec			rax
  jne			.while

.end_while:

  mov	rax,	SYS_EXIT
  mov	rdi,	[sum]
  syscall
