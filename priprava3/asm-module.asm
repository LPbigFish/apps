;***************************************************************************
;
; Program for education in subject "Assembly Languages" and "APPS"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Empty project
;
;***************************************************************************

    bits 64

    section .data

    ; variables

    ;global g_some_asm_var
    ;extern g_some_c_var

;g_some_asm_var dd ?

;***************************************************************************

    section .text

    global first_function
    global second_function
    global third_function
    global fourth_function

;   Napište si funkci, která projde celé pole celých čísel a kladným číslům vynuluje nejnižší bit pole[ i ] &= ~1 (vytvoří z nich číslo sudé) a všem číslům záporným nastaví nejnižší bit pole[ i ] |= 1 (vytvoří číslo liché). 
;   Délka pole bude druhý parametr funkce. Vytvořte si pole s minimálně 10 prvky.
first_function:
    enter 0, 0
    mov ecx, esi
    mov r9, 1
    not r9
    loop_enter:
        dec ecx
        mov r8d, dword [rdi + rcx * 4]
        cmp r8d, 0
        jl negative
        positive:
            and r8d, r9d
            mov [rdi + rcx * 4], r8d
            jmp first_skip
        negative:
            or r8d, 0x1
            mov [rdi + rcx * 4], r8d
        first_skip:
            cmp ecx, 0
            jne loop_enter
    leave
    ret

;   Najděte v poli číslo, které má na pozici nejvyšší bajtu největší hodnotu. Vytvořte si pole s minimálně 10 prvky, např. long l_pole[ 10 ] = { 0x1000000000000000, 0x1200000000000000, 0x1100000000000000, ... atd }. 
;   Návratová hodnota funkce bude pozice nalezeného prvku. Pro řešení stačí přistup k nejvyššímu bajtu přímo do paměti, není nutné používat bitové posunu a masky!

second_function:
    enter 0,0
    mov ecx, esi
    mov r8b, byte [rdi + 7]

    second_loop:
        dec ecx
        cmp r8b, byte [rdi + rcx * 8 + 7]
        jnb second_skip
        mov r8b, byte [rdi + rcx * 8 + 7]
        mov eax, ecx
        second_skip:
            cmp ecx, 0
            jne second_loop
    leave
    ret

third_function:
    enter 0,0
    mov r8d, 0
    mov ecx, 0
    third_loop:
        mov r9b, byte [rdi + rcx]
        cmp r9b, '0'
        jb third_skip
        cmp r9b, '9'
        jnbe third_skip
        inc r8d
        third_skip:
            inc ecx
            cmp r9b, 0
            jne third_loop
        mov eax, r8d
    leave
    ret

fourth_function:
    enter 0,0
    mov rcx, 0
    fourth_loop:
        mov r8b, byte [rdi + rcx]
        cmp r8b, ' '
        jne fourth_skip
        mov [rdi + rcx], sil
        fourth_skip:
            inc rcx
            cmp r8b, 0
            jne fourth_loop
    leave
    ret