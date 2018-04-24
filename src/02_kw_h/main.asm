default rel

%include "common.inc"

section .data
  bill_total	dq		0		; cost of the total bill (pennies)
  ele_base		dq		5 		; base bill, $5.00
  ele_threshold	dq		1000	; threshold in which bill will be incremented
  kwh			dq		1100	; amount of eletricity used
  kwh_cost		dq		1		; cost per kwh, $1.00

section .bss

section .text
  global start

start:
  nop

  mov	rax,	[ele_base]
  add	[bill_total], rax			; set the bill to the base amount

  xor	rax, rax					; zero rax
  xor	rbx, rbx

  mov	rbx, [kwh]
  sub	rbx, [ele_threshold]

  cmovg rax, rbx					; rax = result || 0  
  imul	qword [kwh_cost]			; rax = (kwh - threadhold) * kwh_cost

  add	[bill_total], rax			; bill_total = ((kwh - threshold) * kwh_cost) + ele_base

  mov	rax, SYS_EXIT
  mov	rdi, [bill_total]			; return the result
  syscall
