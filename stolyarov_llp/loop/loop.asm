global _start

%include "syscalls.inc"

section .data
msg_1 db  "loop continue", 0xa
msg_2 db  "loop end", 0xa
msg_3 db  "zero", 0xa
count   db  4

section .text
_start:
  mov ecx,  4
  ; mov eax,  1
  ; dec eax
  ; jz  print_zero

lp:
  _syscall_print_stdout msg_1,  14
  ; dec byte [count]
  ; jnz lp
  loop lp

_syscall_print_stdout msg_2,  9

print_zero:
_syscall_print_stdout msg_3,  5

exit:
  _syscall_exit 0
 
