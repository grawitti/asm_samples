global _start

%include "syscalls.inc"

section .data
hello_msg db  "Hello", 0xa
bay_msg db  "Goodbay", 0xa

section .text
_start:

print:
  _syscall_print_stdout hello_msg, 6
  jmp short exit  ; jump to exit without print_bay, short use for optimisation

print_bay:
  _syscall_print_stdout bay_msg,  8

exit:
  _syscall_exit 0
 
