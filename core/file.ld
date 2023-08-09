ENTRY(_start)

SECTIONS {
    . = 0x7C00;      /* Bootloader will be loaded at 0x7C00 */
    .text : {
        *(.text)
    }
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss)
    }
}
