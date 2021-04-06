ASM=nasm
ASM_FLAGS=-f elf
SRC=ex_3
LD_FLAGS=-m elf_i386

all: asm ld

asm:
	$(ASM) $(ASM_FLAGS) $(SRC).asm

ld: asm
	ld $(SRC).o $(LD_FLAGS) -o $(SRC)

clear:
	rm -rf *.o $(SRC)
