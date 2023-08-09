section .text
    global _start

_start:
    ; Set up segment registers
    xor ax, ax            ; Clear ax register
    mov ds, ax            ; Set data segment to 0
    mov es, ax            ; Set extra segment to 0

    ; Load kernel from disk
    mov si, kernel_load    ; Source address (kernel_load)
    mov di, kernel_dest    ; Destination address (0x7E00)
    mov cx, kernel_size    ; Number of words to copy
    cld                    ; Clear direction flag (forward copy)
    rep movsw              ; Move data from si to di

    ; Jump to the loaded kernel
    jmp kernel_dest

section .data
    kernel_load db "KERNEL  " ; 8-character kernel name
    kernel_dest equ 0x7E00    ; Destination address to load kernel
    kernel_size equ 256       ; Number of words to copy (512 bytes)

times 510 - ($ - $$) db 0     ; Fill rest of sector with zeros
dw 0xAA55                     ; Boot signature
