CROSS_COMPILER = arm-none-eabi-
CC		= $(CROSS_COMPILER)gcc
LD		= $(CROSS_COMPILER)ld
AR		= $(CROSS_COMPILER)ar
AS		= $(CROSS_COMPILER)as
OC		= $(CROSS_COMPILER)objcopy
OD		= $(CROSS_COMPILER)objdump
SZ		= $(CROSS_COMPILER)size

ODFLAGS	=	-S
TARGET = main

.PHONY: clean all

all: main.bin main.list
	@echo "  SIZE main.elf"
	$(SZ) main.elf

main.list: main.elf
	@echo "  OBJDUMP main.list"
	$(OD) $(ODFLAGS) main.elf > main.lst
main.bin: main.elf
	@echo "  OBJCOPY main.bin"
	$(OC) -O binary main.elf main.bin
main.elf: main.o startup.o
	$(LD) -T stm32f103.ld -o main.elf startup.o main.o
main.o: main.c
	$(CC) -mcpu=cortex-m3 -mthumb -Wall -g -nostartfiles -std=c99 -c main.c -o main.o
startup.o: startup.c
	$(CC) -mcpu=cortex-m3 -mthumb -Wall -g -nostartfiles -std=c99 -c startup.c -o startup.o

clean:
	@echo "Removing files..."
	rm -rf *.o *.bin *.elf