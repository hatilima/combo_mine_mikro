#include "stm32f103x_registers.h"

void delay() {
    for (int i = 0; i < 1000000; ++i);
}

int main() {
    // Enable GPIOC clock
    RCC->APB2ENR |= (1 << 4);

    // Configure Pin 13 as Output (LED)
    GPIOC->CRH |= (1 << 20);  // Set mode bits for Pin 13
    GPIOC->CRH &= ~(1 << 21);

    while (1) {
        // Toggle Pin 13 (LED)
        GPIOC->ODR ^= (1 << 13);
        delay();
    }

    return 0;
}
