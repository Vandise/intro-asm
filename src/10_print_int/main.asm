;
; Converts 1 byte int to ascii and prints it
; Registers:
;   r8 - character counter
;   ax - initial number / div result
;   bx - buffer pointer
;   di - ascii mod (10)
;   dx - division remainder
; Stack:
;   ascii characters

default rel

%include "common.inc"

section .data
  lower:   db  0
  upper:   db  0
  buffer:  db  '0'

section .bss

section .text
  global	start

start:
  nop

  xor   r8,  r8

  mov   ax, 0xFF   ; number to print, 255
  mov   di, 0x0A   ; int % 10 to ascii

.conversion_loop:

  mov   dx, 0x00
  div   di        ; divide ax by di (10)
                  ; dx has the remainder
  add   dx, '0'   ; add null char to convert to ascii
  push  dx        ; store the char on the stack
  inc   r8w       ; counter of how many chars to print

  cmp   ax, 0x00  ; any more digits to convert to ascii?
  je    .print_loop

  jmp   .conversion_loop

.print_loop:

  cmp r8w,  0x00
  je  .end

  dec r8w

  pop bx            ; get digit from stack, put in bx
  mov [buffer], bx  ; sys out needs a pointer

  mov rax,  SYS_WRITE  ; the call to print
  mov rdx,  1          ; 1 byte
  mov rsi,  buffer     ; the ascii digit to print
  mov rdi,  STDOUT     ; out type
  syscall

  jmp .print_loop

.end:
  mov rdi,  0
  mov	rax,	SYS_EXIT
  syscall
