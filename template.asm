section.data ; constant data

section.bss ; data declared later in program

section.text ; code segment
    global _start ; declared for linker

_start: ; start of program
    ; writing to stdout
    mov eax, 4 ; calling sys_write
    mov ebx, 1 ; type of write (stdout)
    mov ecx, msg ; ecx holds the string you want to write
    mov edx, lenMsg ; edx holds the length of the string
    int 0x80 ; call system to execute sys_write

    ; reading from stdout
    mov eax, 3 ; calling sys_read
    mov ebx, 2 ; type of read (stdout)
    mov ecx, num ; reading the value and storing it in num (num must be declared in bss)
    mov edx, 5 ; how many bytes you want to read
    int 0x80 ; call system to execute sys_read

    ; exit 
    mov eax, 1 ; calling sys_exit
    mov ebx, 0 ; program successfully ran
    int 0x80 ; call system to execute sys_exit