; Вычислить площадь прямоугольного треугольника
; по углу и прилежащему катету
.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\fpu.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\fpu.lib
.data
    a dd 15.3 ; сторона треугольника
    alpha dd 1.0 ; угол
    half dd 0.5
    result dt 0
    sResult db "Площадь треугольника:                ",0
    sTitle db "Результат",0
.code
start:
    fld a
    fmul a
    fld alpha
    fptan
    fstp st(0)
    fmul st(0), st(1)
    fld half
    fmul
    fstp result
    invoke FpuFLtoA, addr result, 5, addr sResult+22, SRC1_REAL or SRC2_DIMM or STR_REG
    ;invoke wsprintf, ADDR sResult, ADDR sFormat, summ
    invoke MessageBox, NULL, ADDR sResult, ADDR sTitle, MB_OK
end start