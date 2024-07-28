section .data
    num1 db 6                    ; Deklarasi angka pertama
    num2 db 3                    ; Deklarasi angka kedua
    result db 0                  ; Variabel untuk menyimpan hasil
    remainder db 0               ; Variabel untuk menyimpan sisa
    msg db "Hasil Pembagian: ", 0
    res_msg db 0, 0              ; Variabel untuk menyimpan hasil sebagai string

section .text
    global _start                ; Entry point untuk linker

_start:
    ; Memuat angka pertama ke dalam register AL
    movzx rax, byte [num1]      ; Memuat angka pertama ke dalam register RAX (64-bit)
    movzx rbx, byte [num2]      ; Memuat angka kedua ke dalam register RBX (64-bit)
    movzx rcx, al               ; Memindahkan angka pertama ke dalam RCX
    xor rdx, rdx                ; Mengosongkan RDX untuk pembagian 64-bit
    div bl                      ; Membagi RCX dengan RBX, hasil di AL, sisa di AH
    mov [result], al            ; Menyimpan hasil pembagian ke variabel hasil
    mov [remainder], ah         ; Menyimpan sisa pembagian ke variabel sisa

    ; Mencetak pesan
    mov rax, 1                 ; Sistem panggilan untuk sys_write
    mov rdi, 1                 ; File descriptor 1 (stdout)
    mov rsi, msg               ; Pointer ke pesan
    mov rdx, 18                ; Panjang pesan
    syscall                    ; Panggilan sistem

    ; Mencetak hasil
    movzx rax, byte [result]   ; Memuat hasil dari variabel hasil ke RAX
    add al, '0'                ; Mengubah angka ke karakter ASCII
    mov [res_msg], al          ; Menyimpan hasil sebagai karakter

    mov rax, 1                 ; Sistem panggilan untuk sys_write
    mov rdi, 1                 ; File descriptor 1 (stdout)
    mov rsi, res_msg           ; Pointer ke hasil sebagai string
    mov rdx, 1                 ; Panjang string
    syscall                    ; Panggilan sistem

    ; Keluar
    mov rax, 60                ; Sistem panggilan untuk sys_exit
    xor rdi, rdi               ; Status keluar 0
    syscall                    ; Panggilan sistem
