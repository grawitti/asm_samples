global _start

%include "syscalls.inc"

; this section for define initialized data
section .data
; db, dw, dd - directives for define data
msg	db	'?ello World', 0xa	; reserv 12 bytes and define data = Hello World\n
test_w	dw	25		 	; reserv 4 bytes and define data = 25
test_dw	dd	0x10			; reserv 4 bytes and define data = 0x10

section	.text
_start:
	mov	[test_w], word 1	; write 1 into memory mark as 'test_w'
	mov	[test_dw], dword 2	; write 2 into memory mark as 'test_dw'
	mov	ebx, msg		; coping address from mark 'msg' into ebx
	mov	[ebx], byte 'H'		; writing symbol 'H' into address located into ebx

print:
  _syscall_print_stdout msg, 12

exit:
  _syscall_exit 0

