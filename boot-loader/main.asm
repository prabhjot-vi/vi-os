[bits 16]		; Tell Nasm that this code is 16-bit
[org 0x7C00]		; Tell Nasm that code will be loaded at this memory

start:
    mov si, msg		; Load 	address of the message into SI
print_char:
    lodsb		; Load byte at SI to AL, increment SI
    cmp al, 0		; Check if char is null ( end of stirng)
    je done		; If zero, jump to done
    mov ah, 0x0E	; BIOS teletype	function
    int 0x10		; Call BIOS video interrupt
    jmp print_char	; Repeat for next char

done:
    cli			; Clear interrupts
    hlt			; Halt the CPU

msg:
    db 'Hello, World!', 0x0D, 0x0A, 0	; String with carriage return, newline, and null terminator

times 510 - ($ - $$) db 0		; Fill rest of the 512-byte sector with zeros
dw 0xAA55				; Standard boot signature required by BIOS

