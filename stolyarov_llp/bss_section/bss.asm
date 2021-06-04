global _start

%include "syscalls.inc"

; this section for reserving memory for not initialized data
section .bss
; resb, resd, resw - directives for reserv not initialized memory
string	resb	3	; reserv byte array size 3 byte
count	resw	256	; reserv word array size 256 word = 512 byte
x	resd	1	; reserv dword array size 1 dword = 4 byte

section	.text
_start:
	mov	[x], dword 2		; write 2 in memory by mark 'x'
	mov	ebx, string		; coping address from mark 'string' into ebx
	mov	[ebx], byte 'H'		; writing symbol 'H' into address located into ebx
	mov	[ebx+1], byte 'e'	; writing symbol 'e' into address located into ebx+1
	mov	[ebx+2], byte 0xa	; writing line break into address located into ebx+2

print:
  _syscall_print_stdout string, 3

exit:
  _syscall_exit 0

