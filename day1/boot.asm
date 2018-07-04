org 0x7c00
jmp  entry
db 0x00
db  "helloOSX"
dw  512
db  1
dw  1
db  2
dw  224
dw  2880
db  0xf0
dw  9
dw  18
dw  2
dd  0
dd  2880
db  0,0,0x29
dd  0xffffffff
db  "myosudisk  "
db  "fat12   "
resb 18


entry:
mov ax,0x0
mov ss,ax
mov sp,0x7c00
mov ds,ax
mov es,ax
mov ah,0xe
mov bx,0xf
mov si,msg

typeonechar:
mov al,[si]
add si,1
cmp al,0
je fin
int 0x10
jmp typeonechar

fin:
hlt
jmp fin

msg:
db 0x0a
db "hello crazy"
db 0x0a
db 0x00

times 510-($-$$) db 0x00
db 0x55,0xaa

