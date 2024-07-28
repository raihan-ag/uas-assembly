global _start           ; Mendeklarasikan titik masuk program



section .data

    msg db "Angka: ", 0 ; Pesan yang akan dicetak sebelum setiap angka

    nl db 10, 0         ; Karakter newline untuk pindah baris



section .text

_start:

    mov r12, 1          ; Inisialisasi counter dengan nilai 1



loop:

    ; Cetak pesan "Angka: "

    mov rax, 1          ; Sistem call untuk write

    mov rdi, 1          ; File descriptor untuk stdout

    mov rsi, msg        ; Alamat string yang akan dicetak

    mov rdx, 7          ; Panjang string

    syscall



    ; Cetak nilai counter

    add r12, 48         ; Konversi nilai integer ke ASCII

    mov [rsp-1], r12b   ; Simpan karakter ASCII di stack

    sub r12, 48         ; Kembalikan nilai counter ke integer



    mov rax, 1          ; Sistem call untuk write

    mov rdi, 1          ; File descriptor untuk stdout

    lea rsi, [rsp-1]    ; Alamat karakter yang akan dicetak

    mov rdx, 1          ; Panjang string (1 karakter)

    syscall



    ; Cetak newline

    mov rax, 1          ; Sistem call untuk write

    mov rdi, 1          ; File descriptor untuk stdout

    mov rsi, nl         ; Alamat karakter newline

    mov rdx, 1          ; Panjang string (1 karakter)

    syscall



    inc r12             ; Increment counter

    cmp r12, 6          ; Bandingkan counter dengan 6

    jl loop             ; Jika kurang dari 6, lanjutkan loop



    ; Exit program

    mov rax, 60         ; Sistem call untuk exit

    xor rdi, rdi        ; Status exit 0

    syscall

