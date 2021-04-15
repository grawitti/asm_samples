global _start

%include "syscalls.inc"

section .data
msg_1 db  "SF=1", 0xa
msg_2 db  "SF=0", 0xa

section .text
_start:

print:
  mov eax, 1
  mov ebx, 3
  sub eax, ebx  ; subtract eax:1 - ebx:3 = -2
  js print_sf   ; jump to print_eq if SF=1 
  _syscall_print_stdout msg_2, 5
  jns exit      ; jump to exit if SF=0 

print_sf:
  _syscall_print_stdout msg_1, 5 

exit:
  _syscall_exit 0
 
