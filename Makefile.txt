CROSS_COMPILE =arm-none-eabi-
CC		= $(CROSS_COMPILE)gcc
LD		= $(CROSS_COMPILE)ld
AR		= $(CROSS_COMPILE)ar
AS		= $(CROSS_COMPILE)as
OC		= $(CROSS_COMPILE)objcopy
OD		= $(CROSS_COMPILE)objdump
SZ		= $(CROSS_COMPILE)size

TARGET= main
SRCS= ./main.c ./startup.c
OBJS=$(SRCS:.c=.o)
CFLAGS	= 	-c -fno-common \
			-ffunction-sections \
			-fdata-sections \
			-Os \
			-g3 \
			-mcpu=cortex-m3 \
			-mthumb \
			-Wall

LDSCRIPT= stm32f103.ld

LDFLAGS	=	--gc-sections,-T$(LDSCRIPT),-no-startup,-nostdlib

OCFLAGS	=	-Obinary

ODFLAGS	=	-S


.PHONY : clean all


all: $(TARGET).bin  $(TARGET).list
	@echo "  SIZE $(TARGET).elf"
	$(SZ) $(TARGET).elf

$(TARGET).list: $(TARGET).elf
	@echo "  OBJDUMP $(TARGET).list"
	$(OD) $(ODFLAGS) $< > $(TARGET).lst



$(TARGET).bin: $(TARGET).elf
	@echo "  OBJCOPY $(TARGET).bin"
	$(OC) $(OCFLAGS) $(TARGET).elf $(TARGET).bin


main.elf: main.o startup.o
	$(CC) -mcpu=cortex-m3 -mthumb -Wl,$(LDFLAGS),-o$(TARGET).elf,-Map,$(TARGET).map $(OBJS)


%.o: %.c
	@echo "  CC $<"
	$(CC) $(CFLAGS)  $< -o $*.o

clean:
	@echo "Removing files..."
	-find . -name '*.o'   | xargs rm
	-find . -name '*.elf' | xargs rm
	-find . -name '*.lst' | xargs rm
	-find . -name '*.out' | xargs rm
	-find . -name '*.bin' | xargs rm
	-find . -name '*.map' | xargs rm