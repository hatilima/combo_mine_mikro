Best Article:
https://kleinembedded.com/stm32-without-cubeide-part-1-the-bare-necessities/

1. Compile startup.c:
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Wall -g -nostartfiles -std=c99 -c startup.c -o startup.o

2. Compile main.c:
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Wall -g -nostartfiles -std=c99 -c main.c -o main.o

3. Link main.o and startup.o:
arm-none-eabi-ld -T stm32f103.ld -o main.elf startup.o main.o

4. Convert the main.elf to main.bin:
arm-none-eabi-objcopy -O binary main.elf main.bin


