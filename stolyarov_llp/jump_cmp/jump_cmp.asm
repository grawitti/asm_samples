global _start

; Examples for jumps on compare

%include "syscalls.inc"

section .data
msg_0 db  "eax = ebx", 0xa
msg_1 db  "eax < ebx", 0xa
msg_2 db  "eax <= ebx", 0xa
msg_3 db  "eax > ebx", 0xa
msg_4 db  "eax >= ebx", 0xa
msg_5 db  "eax != ebx", 0xa

section .text
_start:

print:
  mov eax, 4
  mov ebx, 4
  cmp eax, ebx    ; compare eax:1 and ebx:3
  je  equal       ; je  - jump if equal (a = b)
  jne not_equal   ; jne - jump if not equal (a != b)
continue:
  jl  less        ; jl  - jump if less (a < b)
  jle less_eq     ; jle - jump if less or equal (a <= b)
  jg  greater     ; jg  - jump if greater (a > b)
  jge greater_eq  ; jge - jump if greater or equal (a >= b)
less:
  _syscall_print_stdout msg_1, 10
  jmp exit

less_eq:
  _syscall_print_stdout msg_2, 11
  jmp exit

greater:
  _syscall_print_stdout msg_3, 10
  jmp exit

greater_eq:
  _syscall_print_stdout msg_4, 11
  jmp exit

equal:
  _syscall_print_stdout msg_0, 10
  jmp continue

not_equal:
  _syscall_print_stdout msg_5, 11
  jmp continue

exit:
  _syscall_exit 0
 
