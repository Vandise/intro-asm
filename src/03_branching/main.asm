default rel

%include "common.inc"

section .data

  switch:	dq	start.case0
			dq	start.case1
			dq	start.case2

  i:		dq	1

section .bss

section .text
  global start

start:
  nop

  mov	rax,	[i]					; label to jump to
  lea	rbx,	[switch]			; get the branching address
  jmp			[rbx+rax*8]			; jmp to the label

.case0:
  mov	rbx,	100
  jmp			.end

.case1:
  mov	rbx,	101
  jmp			.end

.case2:
  mov	rbx,	102
  jmp			.end

.end:
  xor	rax,	rax
  mov	rax,	SYS_EXIT
  mov	rdi,	rbx
  syscall
