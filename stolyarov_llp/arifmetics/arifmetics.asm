global _start

%include "syscalls.inc"

; this section for define initialized data
section .data
o	db	0o	; reserv 1 bytes and define data = 0 in oct
b	dw	0b	; reserv 2 bytes and define data = 0 in bin
x	dd	0x0	; reserv 4 bytes and define data = 10 in hex

section	.text
_start:
	mov	eax, 1		; write 1 in eax

; Arifmetical directives
	add	[x], eax	; add x+eax
	add	eax, 1		; add eax-1

	sub	[x], byte 1	; sub x-1

	inc byte [x]		; increment x
	dec	eax		; decrement eax

	mul byte [x]		; multiple eax*x
				; result in ax for byte,
				; dx:ax - 2 byte,
				; eax:edx - 4 byte
				; (i)mul set to 1 flags CF & OF if
				; hight half use in result,
				; else CF & OF set to 0

	mov	bl, -3
	imul	bl		; miltiple sign numbers,
				; results al,ah - byte
				; ax,dx - 2 byte
				; eax,edx

	mov	eax, 4
	mov	ebx, 2
	div	ebx		; division eax:ebx results:
				; chastnoe in al, ax or eax,
				; ostatok in ah, dx, edx

	mov	ax, -4
	mov	bl, 2
	idiv	bl		; division sign numbers ax:bl

exit:
  _syscall_exit 0

