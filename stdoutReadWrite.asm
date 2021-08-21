section .data
    userMsg db 'Please enter a number: '; string to be printed
    lenUserMsg equ $ - userMsg ; length of string
    dispMsg db 'You have entered: '
    lenDispMsg equ $-dispMsg

section .bss 
    num resb 5

section .text
    global _start ; declared for linker

_start: 
    ; printing
    mov eax, 4 ; calling sys_write
    mov ebx, 1 ; type of write (stdout)
    mov ecx, userMsg ; ecx holds the string argument
    mov edx, lenUserMsg ; edx holds the length of the string
    int 80h ; call system to execute sys_write

    ; reading
    mov eax, 3 ; calling sys_read
    mov ebx, 2 ; type of read (stdout)
    mov ecx, num ; reading the value and storing it in num (num must be declared in bss)
    mov edx, 5 ; how many bytes you want to read
    int 80h ; call system to execute sys_read
    
    ;Output the message 'The entered number is: '
    mov eax, 4
    mov ebx, 1
    mov ecx, dispMsg
    mov edx, lenDispMsg
    int 80h  

    ; print number you just inputted
    mov eax, 4 ; calling sys_write
    mov ebx, 1 ; type of write (stdout)
    mov ecx, num ; ecx holds the string argument
    mov edx, 5 ; edx holds the length of the string
    int 80h ; call system to execute sys_write
    
    ; exit
    mov eax, 1 ; calling sys_exit
    mov ebx, 0 ; program successfully ran
    int 80h ; call system to execute sys_exit