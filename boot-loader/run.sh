#! /usr/bin/env bash

nasm -f bin main.asm -o boot.bin \
&& qemu-system-i386 boot.bin
