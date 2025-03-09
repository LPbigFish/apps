    bits 64

    section .data

    ; variables

    ;global g_some_asm_var
    ;extern g_some_c_var

;g_some_asm_var dd ?

;***************************************************************************

    section .text

    global bubble
    global strup
    global nejcastejsi
    global prvocislo

bubble:
    enter 0, 0
    mov ecx, 0
    mov r8d, esi
    dec r8d
    .main_loop:
        mov r9d, 0
        .sub_loop:
            mov r10d, dword [ rdi + r9 * 4 ]
            mov r11d, dword [ rdi + r9 * 4 + 4 ]
            cmp r10d, r11d
            jle .end
            mov dword [ rdi + r9 * 4 + 4 ], r10d
            mov dword [ rdi + r9 * 4 ], r11d
            .end:
            inc r9d
            cmp r9d, r8d
            jne .sub_loop
        .end_loop:
        inc ecx
        cmp ecx, r8d
        jne .main_loop
    leave
    ret

strup:
    enter 0,0
    mov ecx, 0
    .loop:
        mov r8b, byte [rdi + rcx]
        mov al, r8b
        sub al, 32
        cmp r8b, 'a'
        cmovnb r8w, ax
        mov byte [rdi + rcx], r8b
        inc ecx
        cmp byte [rdi + rcx], 0
        jne .loop
    leave
    ret

; nejcastejsi:
;     enter 1024,0
;     mov rcx, 0
;     mov rax, 0
;     mov r9, 0
;     mov rdx, 0

;     .loop:
;         movzx r8, byte [rdi + rcx]
;         inc dword [rbp - 1024 + r8 * 4]
;         inc rcx
;         cmp byte [rdi + rcx], 0
;         jne .loop
    
;     mov rcx, 0
;     .nloop:
;         movzx r8, byte [rdi + rcx]
;         mov r9d, dword [rbp - 1024 + r8 * 4]
;         cmp r9, rdx
;         cmovnbe rax, r8
;         cmovnbe rdx, r9
;         inc rcx
;         cmp byte [rdi + rcx], 0
;         jne .nloop
    
;     leave
;     ret

prvocislo:
    enter 0,0
    mov r9, -1
    mov rcx, 2
    cmp rdi, 0
    cmove rax, r9
    je .end
    cmp rdi, 1
    cmove rax, r9
    je .end
    mov rax, rdi
    mov rbx, qword 2
    div rbx
    mov r8, rax
    .loop:
        xor rdx, rdx
        mov rax, rdi
        mov rbx, rcx
        div rbx
        cmp rdx, 0
        cmovz rax, r9
        je .end
        inc ecx
        cmp rcx, r8
        jne .loop
    .end:
    cmp rax, -1
    cmovne rax, rdi
    leave
    ret