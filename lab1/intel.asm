; Определить минимальную/максимальную из трёх переменных и вывести сообщение
.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
.data
    var1 dw 140 ; первая переменная
    var2 dw 430 ; вторая переменная
    var3 dw 160 ; третья переменная
    str1 db "Результат",0
    str2 db "var1 минимум",0
    str3 db "var2 минимум",0
    str4 db "var3 минимум",0
    str5 db "var1 максимум",0
    str6 db "var2 максимум",0
    str7 db "var3 максимум",0
; в результате выполнения в ax будет минимум, а в dx максимум
.code
start: ; Метка начала программы
    MOV AX, var1
    SUB AX, var2
    JS VAR1LESS2
    MOV AX, var2 ; если var2<var1
    MOV DX, var1
    JMP PART2
VAR1LESS2: ; если var1<var2
    MOV AX, var1
    MOV DX, var2
PART2:
    SUB AX, var3
    JS MINLESS3
    MOV AX, var3 ; если var3<ax
    JMP PART3
MINLESS3: ; если ax<var3
    ADD AX, var3
PART3:
    SUB DX, var3
    JS VAR3MOREMAX
    ADD DX, var3
    JMP PRINTMINS
VAR3MOREMAX: ; если var3>ax
    MOV DX, var3
PRINTMINS: ; теперь в ax находится минимум, а в dx максимум
    CMP AX, var1
    JZ VAR1ISMIN
    CMP AX, var2
    JZ VAR2ISMIN
    CMP AX, var3
    JZ VAR3ISMIN
VAR1ISMIN:
    PUSH dx ; так как вызов messagebox очищает регистры, мы сохраняем значение dx в стеке, аналогично ниже
    invoke MessageBox, NULL, addr str2, addr str1, MB_OK
    JMP PRINTMAXS
VAR2ISMIN:
    PUSH dx
    invoke MessageBox, NULL, addr str3, addr str1, MB_OK
    JMP PRINTMAXS
VAR3ISMIN:
    PUSH dx
    invoke MessageBox, NULL, addr str4, addr str1, MB_OK
PRINTMAXS:
    POP dx
    CMP DX, var1
    JZ VAR1ISMAX
    CMP DX, var2
    JZ VAR2ISMAX
    CMP DX, var3
    JZ VAR3ISMAX
VAR1ISMAX:
    invoke MessageBox, NULL, addr str5, addr str1, MB_OK
    JMP STOP
VAR2ISMAX:
    invoke MessageBox, NULL, addr str6, addr str1, MB_OK
    JMP STOP
VAR3ISMAX:
    invoke MessageBox, NULL, addr str7, addr str1, MB_OK
    JMP STOP
STOP:
    invoke ExitProcess, NULL ;Вызов процедуры, завершающей работу программы
end start ;Конец программы