global _start

%include "syscalls.inc"

section .data
eq_msg  db  "Equal", 0xa
neq_msg db  "Not equal", 0xa
count   db  0

section .text
_start:
; implementation while loop: while (count < value)
loop: cmp byte [count], 4 ; compare count and value
  je loop_quit            ; exit loop if count = value
  _syscall_print_stdout neq_msg, 10
  inc byte [count]        ; increment count
  jmp loop                ; jump to loop

loop_quit:
  _syscall_print_stdout eq_msg,  6

exit:
  _syscall_exit 0
 
