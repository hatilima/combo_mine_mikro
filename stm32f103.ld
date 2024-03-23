MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K
  RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}

SECTIONS
{
  .vector_table : {
    KEEP(*(.vector_table))
  } > FLASH

  .text : {
    *(.text*)
  } > FLASH

  .data : {
    _sidata = LOADADDR(.data);
    _sdata = ADDR(.data);
    _edata = ADDR(.data) + SIZEOF(.data);
    *(.data*)
  } > RAM AT > FLASH

  .bss : {
    _sbss = ADDR(.bss);
    _ebss = ADDR(.bss) + SIZEOF(.bss);
    *(.bss*)
  } > RAM
}
