; Вычислить сумму элементов массива
; больше заданной переменной
.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
.data
    var dd 12
    arr dd 16, 52, 31, 44, 6, 12
    ;arr dd 1, 2, 3, 4, 5, 6
    flag dw 0
    sResult byte 50 dup (0)
    sFormat db "Результат: %d",0
    sNoResult db "Нет чисел больше var",0
    sTitle db "Результат",0
    summ dd 0
.code
start:
    XOR ESI, ESI ; clear ESI
    MOV ECX, 6
for1:
    MOV EAX, arr[ESI]
    SUB EAX, var
    JS nextiter
    MOV EAX, arr[ESI]
    ADD summ, EAX
    MOV flag, 1
nextiter:
    ADD ESI, 4
    LOOP for1
    MOV AX, flag
    TEST AX, AX
    JZ reszero
    invoke wsprintf, ADDR sResult, ADDR sFormat, summ
    invoke MessageBox, NULL, ADDR sResult, ADDR sTitle, MB_OK
    JMP exit
reszero:
    invoke MessageBox, NULL, ADDR sNoResult, ADDR sTitle, MB_OK
exit:
end start