; nasm boot_sect.asm -f bin -o boot_sect.bin
; qemu-system-i386 boot_sect.bin

;
; Read some sectors from the boot disk using our disk_read function
;

[org 0x7c00]

mov [BOOT_DRIVE], dl     ; BIOS stores our boot drive in DL so it's best 
                         ; to remember this for later.

mov bp, 0x8000           ; Here we set our stack safely out of the way
mov sp, bp

mov bx, 0x9000           ; Load 5 sectors to 0x0000(ES): 0x9000 (BX) from boot disk
mov dh, 5
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]         ; Print out the first loaded word, which
                         ; we expect to be 0xdada, stored at address 0x9000
call print_hex

mov dx, [0x9000 + 512]   ; Also print the first word from the 2nd loaded sector (0xface)
call print_hex

%include "print_string.asm"
%include "print_hex.asm"
%include "disk_load.asm"

; Global Variables

BOOT_DRIVE db 0

;
; Padding and magic BIOS number.
;

times 510-($-$$) db 0 ; Pad the boot sector out with zeros
dw 0xaa55

; add a few more sectors to prove we actually loaded those wo sectors from disk we booted from

times 256 dw 0xdada
times 256 dw 0xface
