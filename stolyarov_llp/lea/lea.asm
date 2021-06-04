global _start

%include "syscalls.inc"

; this section for define initialized data
section .data
msg	db	'?ello &orld', 0xa	; reserv 12 bytes and define data = Hello World\n

section	.text
_start:
	mov	ebx, msg	; coping address from mark 'msg' into ebx
	mov	[ebx], byte 'H'	; writing symbol 'H' into address located into ebx

; lea - calculate address from second operand
; 	and write result into register from first operand
; note: invoking lea no memmory access occurs
	lea	eax, [ebx+6]	; calc address of 6 element of 'msg' and write it in eax
	mov	[eax], byte 'W'	; writing symbol 'W' into  address located into eax

print:
  _syscall_print_stdout msg, 12

exit:
  _syscall_exit 0

