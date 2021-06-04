ASM=nasm
MACROLIB_PATH=../../macrolib
ASM_FLAGS=-f elf -g -i$(MACROLIB_PATH)
SRC=loop
LD_FLAGS=-m elf_i386

all: asm ld

asm:
	$(ASM) $(ASM_FLAGS) $(SRC).asm

ld: asm
	ld $(SRC).o $(LD_FLAGS) -o $(SRC)

clean:
	rm -rf *.o $(SRC)
