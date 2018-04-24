;default rel

%include "common.inc"

section .data
  grade_1	db	90
  grade_2	db	100
  grade_3	db	95
  grade_4	db	85
  
  quotient	dq	0
  remainder	dq	0

section .bss

section .text

  global start

start:
  nop

  xor	rax,	rax
  mov 	rax,	[rel grade_1]
  add	rax,	[rel grade_2]
  add	rax,	[rel grade_3]
  add	rax,	[rel grade_4]

  xor	rdx,	rdx
  mov	rbx,	4
  idiv	rbx

  mov	[rel quotient],  rax	
  mov	[rel remainder], rdx

  mov	rax,	SYS_EXIT
  mov	rdi,	[rel quotient]	
  syscall
