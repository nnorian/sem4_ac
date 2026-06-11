# Lab 5, Variant 14 — terminal build (fallback if not using SASM)
# make       — build all
# make run   — build and run all
# make clean — remove binaries

.PHONY: all run clean

all: task1 task2_expr14 task2_expr8 task2_expr10 task5_bcd_add

# 64-bit targets (tasks 1 and 2) — link with gcc so 'main' resolves
task1: task1_expression.asm
	nasm -f elf64 task1_expression.asm -o task1.o && gcc -no-pie -o task1 task1.o

task2_expr14: task2_expr14.asm
	nasm -f elf64 task2_expr14.asm -o task2_expr14.o && gcc -no-pie -o task2_expr14 task2_expr14.o

task2_expr8: task2_expr8.asm
	nasm -f elf64 task2_expr8.asm -o task2_expr8.o && gcc -no-pie -o task2_expr8 task2_expr8.o

task2_expr10: task2_expr10.asm
	nasm -f elf64 task2_expr10.asm -o task2_expr10.o && gcc -no-pie -o task2_expr10 task2_expr10.o

# 32-bit target — DAA requires 32-bit mode
task5_bcd_add: task5_bcd_add.asm
	nasm -f elf32 task5_bcd_add.asm -o task5_bcd_add.o && gcc -m32 -no-pie -o task5_bcd_add task5_bcd_add.o

run: all
	@echo "Task 1  (result in [result] memory, expect 10)";  ./task1
	@echo "Task 2 expr14 (expect z=3)";  ./task2_expr14
	@echo "Task 2 expr8  (expect z=27)"; ./task2_expr8
	@echo "Task 2 expr10 (expect z=-1)"; ./task2_expr10
	@echo "Task 5 BCD (check memory: result=0x85, carry=0x00)"; ./task5_bcd_add

clean:
	rm -f *.o task1 task2_expr14 task2_expr8 task2_expr10 task5_bcd_add
