section .data
    num1 db 5                    ; Deklarasi angka pertama
    num2 db 3                    ; Deklarasi angka kedua
    result db 0                  ; Variabel untuk menyimpan hasil
    msg db "Hasil Penjumlahan: ", 0
    res_msg db 0, 0              ; Variabel untuk menyimpan hasil sebagai string

section .text
    global _start                ; Entry point untuk linker

_start:
    ; Menghitung penjumlahan
    movzx rax, byte [num1]      ; Memuat angka pertama ke dalam register RAX (64-bit)
    add al, [num2]              ; Menambahkan angka kedua ke AL
    mov [result], al            ; Menyimpan hasil penjumlahan ke variabel hasil

    ; Mencetak pesan
    mov rax, 1                 ; Sistem panggilan untuk sys_write
    mov rdi, 1                 ; File descriptor 1 (stdout)
    mov rsi, msg               ; Pointer ke pesan
    mov rdx, 19                ; Panjang pesan
    syscall                    ; Panggilan sistem

    ; Mencetak hasil
    movzx rax, byte [result]   ; Memuat hasil dari variabel hasil ke RAX
    add al, '0'                ; Mengubah angka ke karakter
    mov [res_msg], al

    mov rax, 1                 ; Sistem panggilan untuk sys_write
    mov rdi, 1                 ; File descriptor 1 (stdout)
    mov rsi, res_msg           ; Pointer ke hasil sebagai string
    mov rdx, 1                 ; Panjang string
    syscall                    ; Panggilan sistem

    ; Keluar
    mov rax, 60                ; Sistem panggilan untuk sys_exit
    xor rdi, rdi               ; Status keluar 0
    syscall                    ; Panggilan sistem
