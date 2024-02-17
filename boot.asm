[bits 16]

section .text
    ; Set up the segment registers
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; Load the kernel into memory
    mov bx, KERNEL_OFFSET
    mov ah, 02h     ; Function 02h - Read disk sectors
    mov al, SECTORS_TO_LOAD    ; Number of sectors to read
    mov ch, 0       ; Cylinder number
    mov dh, 0       ; Head number
    mov dl, 0x80    ; Drive number (0x80 for the first hard disk)
    mov cl, 2       ; Sector number (start from 2)
    int 13h         ; BIOS interrupt call

    ; Jump to the kernel
    jmp KERNEL_OFFSET:0000

; Constants
KERNEL_OFFSET equ 0x1000     ; Address where kernel will be loaded
SECTORS_TO_LOAD equ 1         ; Number of sectors to load
times 510-($-$$) db 0         ; Fill the rest of the sector with 0s
dw 0xAA55                     ; Boot signature
