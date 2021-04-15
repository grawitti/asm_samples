global _start

%include "syscalls.inc"

section .data
eq_msg  db  "Equal", 0xa
neq_msg db  "Not equal", 0xa
count   db  0

section .text
_start:
; implementation if else: if (count == value) {} else {} 
if: cmp byte [count], 0 ; compare count and value
  jne else              ; exit loop if count = value
  _syscall_print_stdout eq_msg, 6
  jmp if_end            ; jump to if_end
else:
  _syscall_print_stdout neq_msg,  10
if_end:

exit:
  _syscall_exit 0
 
