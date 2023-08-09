#!/bin/bash

# Assemble bootloader
nasm -f bin boot/bootloader.asm -o boot/bootloader.bin

# Assemble kernel
nasm -f bin kernel/kernel.asm -o kernel/kernel.bin

# Combine bootloader and kernel to create a bootable image
cat boot/bootloader.bin kernel/kernel.bin > os_image.img

echo "Build complete!"
