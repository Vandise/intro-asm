;
; Displaying 32bit numbers with 16bit word-size
; 
;

default rel

%include "common.inc"

section .data
  lower:  dw  0x0002      ; 251658242
  upper:  dw  0x0F00

  buffer:  db  0        ; storage for sys_out

section .bss

section .text
  global	start

start:
  nop
  mov   di, [upper]
  mov   si, [lower]
  mov   bp, 0x0A
  push  bp              ; signal end of remainder pushes

.convert:
  xor   dx, dx

  mov   ax, di          ; divide MSB
  div   bp
  mov   di, ax          ; store result back in di

  mov   ax, si          ; divide LSB
  div   bp
  mov   si, ax          ; store result back in si
                        ; remainder is in dx
  push  dx              ; every remainder is 0-9

  or    ax, si          ; OR the quotients, LSB to MSB
  or    ax, di

  jnz   .convert

  pop   dx              ; this will always be a digit

.print_loop
  add   dx,       '0'   ; convert remainder to ascii
  mov   [buffer], dl    ; prep byte to be printed

  mov rax,  SYS_WRITE   ; the call to print
  mov rdx,  1           ; 1 byte
  mov rsi,  buffer      ; the ascii digit to print
  mov rdi,  STDOUT      ; out type
  syscall

  xor rdx,  rdx
  pop dx

  cmp dx,   bp
  jb  .print_loop

.end:
  mov rdi,  0
  mov	rax,	SYS_EXIT
  syscall
