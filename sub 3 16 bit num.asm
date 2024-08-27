org 100h

num1 dw 5678h  ; New 16-bit first operand
num2 dw 1A2Ch  ; New 16-bit second operand

start:
    mov ax, num1
    sub ax, num2

    mov bx, ax

    mov ah, al
    and ah, 0F0h
    shr ah, 4
    add ah, 30h
    cmp ah, 39h
    jle print_high_nibble
    add ah, 7  

print_high_nibble:
    mov dl, ah
    mov ah, 02h
    int 21h

    mov al, bl
    and al, 0Fh
    add al, 30h
    cmp al, 39h
    jle print_low_nibble
    add al, 7

print_low_nibble:
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
