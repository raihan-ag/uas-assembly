section .data

    num1 db 3           ; Deklarasi angka pertama

    num2 db 3           ; Deklarasi angka kedua

    msg_gt db "A lebih besar dari B", 0

    msg_lt db "A kurang dari B", 0

    msg_eq db "A sama dengan B", 0



section .text

    global _start       ; Entry point untuk linker



_start:

    mov al, [num1]      ; Memuat angka pertama ke dalam register AL

    cmp al, [num2]      ; Membandingkan AL dengan angka kedua

    jg greater_than    ; Lompat ke greater_than jika AL > angka kedua

    jl less_than       ; Lompat ke less_than jika AL < angka kedua

    je equal_to        ; Lompat ke equal_to jika AL == angka kedua



greater_than:

    ; Bagian Greater Than (AL > angka kedua)

    mov rax, 1          ; Sistem panggilan untuk sys_write

    mov rdi, 1          ; File descriptor 1 (stdout)

    mov rsi, msg_gt     ; Pointer ke pesan greater_than

    mov rdx, 19         ; Panjang pesan greater_than

    syscall             ; Panggilan sistem

    jmp end_program     ; Lompat ke end_program setelah menulis pesan



less_than:

    ; Bagian Less Than (AL < angka kedua)

    mov rax, 1          ; Sistem panggilan untuk sys_write

    mov rdi, 1          ; File descriptor 1 (stdout)

    mov rsi, msg_lt     ; Pointer ke pesan less_than

    mov rdx, 18         ; Panjang pesan less_than

    syscall             ; Panggilan sistem

    jmp end_program     ; Lompat ke end_program setelah menulis pesan



equal_to:

    ; Bagian Equal To (AL == angka kedua)

    mov rax, 1          ; Sistem panggilan untuk sys_write

    mov rdi, 1          ; File descriptor 1 (stdout)

    mov rsi, msg_eq     ; Pointer ke pesan equal_to

    mov rdx, 20         ; Panjang pesan equal_to

    syscall             ; Panggilan sistem



end_program:

    ; Keluar

    mov rax, 60         ; Sistem panggilan untuk sys_exit

    xor rdi, rdi        ; Status keluar 0

    syscall             ; Panggilan sistem

