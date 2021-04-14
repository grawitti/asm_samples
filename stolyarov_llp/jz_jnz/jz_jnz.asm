global _start

%include "syscalls.inc"

section .data
eq_msg  db  "Equal", 0xa
neq_msg db  "Not equal", 0xa

section .text
_start:

print:
  mov eax, 2
  mov ebx, 1
  cmp eax,  ebx ; compare eax and ebx
  jz print_eq   ; jump to print_eq if ZF=1 
  _syscall_print_stdout neq_msg, 10
  jnz exit      ; jump to exit if ZF=0 

print_eq:
  _syscall_print_stdout eq_msg,  6

exit:
  _syscall_exit 0
 
