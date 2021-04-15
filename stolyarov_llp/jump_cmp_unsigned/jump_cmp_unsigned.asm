global _start

; Examples for jumps on compare for unsigned numbers

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
  mov eax, 3
  mov ebx, 4
  cmp eax, ebx    ; compare eax:1 and ebx:3
  je  equal       ; je  - jump if equal (a = b)
  jne not_equal   ; jne - jump if not equal (a != b)
continue:
  jb  less        ; jb  - jump if below (a < b)
  jbe less_eq     ; jbe - jump if below or equal (a <= b)
  ja  greater     ; ja  - jump if above (a > b)
  jae greater_eq  ; jae - jump if above or equal (a >= b)
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
 
