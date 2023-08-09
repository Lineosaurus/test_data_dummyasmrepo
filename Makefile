# Makefile for SimpleOSAssemblyProject

# Variables
NASM = nasm
CC = gcc
QEMU = qemu-system-i386

# Build targets
all: os_image.img

# Build bootloader
boot/bootloader.bin: boot/bootloader.asm
    $(NASM) -f bin $< -o $@

# Build kernel
kernel/kernel.bin: kernel/kernel.asm
    $(NASM) -f bin $< -o $@

# Combine bootloader and kernel to create bootable image
os_image.img: boot/bootloader.bin kernel/kernel.bin
    cat $^ > $@

# Clean
clean:
    rm -f boot/bootloader.bin kernel/kernel.bin os_image.img

# Run in QEMU
run: os_image.img
    $(QEMU) -drive format=raw,file=$<

.PHONY: all clean run
