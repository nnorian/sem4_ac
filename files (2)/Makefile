# Lab 5, Variant 14
# make       — build all
# make run   — build and run all
# make clean — remove binaries

.PHONY: all run clean

all: task1 task2_expr14 task2_expr8 task2_expr10 task5_bcd_add

task1: task1_expression.asm
	nasm -f elf64 task1_expression.asm -o task1.o && ld task1.o -o task1

task2_expr14: task2_expr14.asm
	nasm -f elf64 task2_expr14.asm -o task2_expr14.o && ld task2_expr14.o -o task2_expr14

task2_expr8: task2_expr8.asm
	nasm -f elf64 task2_expr8.asm -o task2_expr8.o && ld task2_expr8.o -o task2_expr8

task2_expr10: task2_expr10.asm
	nasm -f elf64 task2_expr10.asm -o task2_expr10.o && ld task2_expr10.o -o task2_expr10

task5_bcd_add: task5_bcd_add.asm
	nasm -f elf32 task5_bcd_add.asm -o task5_bcd_add.o && ld -m elf_i386 task5_bcd_add.o -o task5_bcd_add

run: all
	@echo "Task 1  (expected 10):"; ./task1; echo "  => $$?"
	@echo "Task 2 expr14 (expected 3):";  ./task2_expr14;  echo "  => $$?"
	@echo "Task 2 expr8  (expected 27):"; ./task2_expr8;   echo "  => $$?"
	@echo "Task 2 expr10 (expected -1):"; ./task2_expr10;  echo "  => $$? (255 = -1)"
	@echo "Task 5 BCD (check memory with gdb: result=0x85, carry=0x00)"; ./task5_bcd_add

clean:
	rm -f *.o task1 task2_expr14 task2_expr8 task2_expr10 task5_bcd_add
