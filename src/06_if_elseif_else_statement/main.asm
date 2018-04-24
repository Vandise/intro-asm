default rel

%include "common.inc"

section .data
  value:		dq	5
  if_cond:		dq	3
  elsif_cond:	dq	6

section .bss

section .text
  global start

start:
  nop

  mov	rax,	[value]

  cmp	rax,	[if_cond]	
.if_le_if_cond:					; if value < if_cond (3)
  jnl			.else_if_cond
  mov	rdi,	0				; result is 0
  jmp			.end
  
.else_if_cond:					; if value > elseif_cond
  cmp	rax,	[elsif_cond]
  jng			.else
  mov	rdi,	1
  jmp			.end

.else							; value < 3 && value !> 6
  mov	rdi,	2				; result is 2

.end:
  mov	rax, 	SYS_EXIT
  syscall
