section .text
    global _start

_start:
    mov ah, 0x0E    ; BIOS teletype function
    mov al, 'H'     ; Character to print
    int 0x10        ; Call BIOS interrupt

    mov ah, 0x0E    ; BIOS teletype function
    mov al, 'i'     ; Character to print
    int 0x10        ; Call BIOS interrupt

    mov ah, 0x0E    ; BIOS teletype function
    mov al, '!'     ; Character to print
    int 0x10        ; Call BIOS interrupt

    ; Infinite loop
    cli             ; Disable interrupts
.loop:
    hlt             ; Halt the CPU
    jmp .loop       ; Jump to loop label

times 510 - ($ - $$) db 0   ; Fill rest of sector with zeros
dw 0xAA55                   ; Boot signature
