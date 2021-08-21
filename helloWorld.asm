section .data
    msg db 'Hello World!', 0xa ; string to be printed
    len equ $ - msg ; length of string

section .text
    global _start ; declared for linker

_start: 
    mov edx,len
    mov ecx,msg
    mov ebx,1
    mov eax,4
    mov eax,4
    int 0x80

    mov eax,1
    int 0x80