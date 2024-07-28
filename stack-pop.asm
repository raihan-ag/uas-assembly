section .data
    msg db "Nilai yang di-pop: ", 10  ; Tambahkan karakter newline
    
section .bss
    stack resb 1024 ; Alokasi ruang untuk stack

section .text
    global _start

_start:
    ; Inisialisasi SP (Stack Pointer)
    mov rsp, stack+1024

    ; Push beberapa nilai ke stack
    push 10
    push 20
    push 30

    ; Pop nilai dari stack dan tampilkan
    pop rax
    mov rdi, msg
    mov rsi, rax
    mov rax, 1
    syscall

    pop rax
    mov rdi, msg
    mov rsi, rax
    mov rax, 1
    syscall

    pop rax
    mov rdi, msg
    mov rsi, rax
    mov rax, 1
    syscall

    ; Keluar dari program
    mov rax, 60
    mov rdi, 0
    syscall
