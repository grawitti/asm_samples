global _start

%include "syscalls.inc"

section .bss
array resd  1000

section .data
array_2 db  1000

section .text
_start:
  mov ecx,  1000
  mov esi,  array_2
  mov eax,  0
lp:
  add eax,  [esi]
  add esi,  1
  loop lp

_syscall_exit 0
