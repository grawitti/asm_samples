; print string from ecx, size of string in edx
%macro _syscall_print_stdout 2
  mov	ecx, %1 ; address of string to output
	mov	edx, %2 ; number of bytes
	mov	eax, 4  ; system call 1 is write
	mov	ebx, 1  ; file handle 1 is stdout
	int	0x80    ; invoke OS system call
%endmacro

; exit with exit code from ebx
%macro _syscall_exit 1
  mov	eax, 1	; system call 60 is exit
	mov	ebx, %1	; exit code 0
	int	0x80	; invoke OS system call
%endmacro

