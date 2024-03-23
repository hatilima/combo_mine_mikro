#ifndef STM32F103_REGISTERS_H
#define STM32F103_REGISTERS_H

#include <stdint.h>

#define RCC_BASE_ADDR 0x40021000
#define GPIOC_BASE_ADDR 0x40011000

typedef struct {
    volatile uint32_t CR;
    volatile uint32_t CFGR;
    volatile uint32_t CIR;
    volatile uint32_t APB2RSTR;
    volatile uint32_t APB1RSTR;
    volatile uint32_t AHBENR;
    volatile uint32_t APB2ENR;
    volatile uint32_t APB1ENR;
    volatile uint32_t BDCR;
    volatile uint32_t CSR;
    // Other RCC registers...
} RCC_TypeDef;

typedef struct {
    volatile uint32_t CRL;
    volatile uint32_t CRH;
    volatile uint32_t IDR;
    volatile uint32_t ODR;
    volatile uint32_t BSRR;
    volatile uint32_t BRR;
    volatile uint32_t LCKR;
    // Other GPIO registers...
} GPIO_TypeDef;

#define RCC ((RCC_TypeDef *)RCC_BASE_ADDR)
#define GPIOC ((GPIO_TypeDef *)GPIOC_BASE_ADDR)

#endif // STM32F103_REGISTERS_H
