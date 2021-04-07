global _start

section .bss

; resb, resd, resw - directives for reserv not initialized memory
string	resb	16	; reserv byte array size 16 byte
count	resw	256	; reserv word array size 256 word = 512 byte
x	resd	1	; reserv dword array size 1 dword = 4 byte

section .data
; db, dw, dd - directives for define data
msg	db	'Hello World', 0xa	; reserv 12 bytes and define data = Hello World\n
test_w	dw	25		 	; reserv 4 bytes and define data = 25
test_dw	dd	0x10			; reserv 4 bytes and define data = 0x10

section	.text
_start:
	mov	[x], dword 2	; define 2 in memory by mark 'x'
	mov	eax, 1		; difine 1 in eax

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


; print string from ecx, size of string in edx
print:	mov	ecx, msg	; address of string to output
	mov	edx, 12		; number of bytes
	mov	eax, 4		; system call 1 is write
	mov	ebx, 1 		; file handle 1 is stdout
	int	0x80		; invoke OS system call

; exit with exit code from ebx
exit:	mov	eax, 1	; system call 60 is exit
	mov	ebx, 0	; exit code 0
	int	0x80	; invoke OS system call

