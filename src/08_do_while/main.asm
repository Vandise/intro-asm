default rel

%include "common.inc"

section .data
  data		db	"hello world", 0
  position	dq	0
  character	db	'w'

section .bss

section .text
  global start

start:
  nop

  mov	bl,		[character]
  xor	rcx,	rcx
  mov	al,		[data+rcx]
  cmp	al,		0
  jz			.end_while

.while:
  cmp	al,		bl
  je	.found

  inc	rcx
  mov	al,	[data+rcx]

.end_while:
  mov	rcx,	-1

.found:
  mov	[position],	rcx
  xor	rax,		rax

  mov	rax,	SYS_EXIT
  mov	rdi,	[position]
  syscall
