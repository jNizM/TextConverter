; ===================================================================================
; AHK Version ...: AHK_L 1.1.14.03 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Description ...: Convert Text to:
;                  Char / Decimal / Octal / Hexadecimal / Binary / Morsecode
; Version .......: v0.1
; Modified ......: 2014.03.09-1912
; Author ........: jNizM
; Licence .......: WTFPL (http://www.wtfpl.net/txt/copying/)
; ===================================================================================
;@Ahk2Exe-SetName TextConverter
;@Ahk2Exe-SetDescription TextConverter
;@Ahk2Exe-SetVersion v0.1
;@Ahk2Exe-SetCopyright Copyright (c) 2013-2014`, jNizM
;@Ahk2Exe-SetOrigFilename TextConverter.ahk
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#Warn
#NoEnv
#SingleInstance Force

global name        := "TextConverter"
global version     := "v0.1"
global love        := chr(9829)

; SCRIPT ============================================================================

Gui, Margin, 10, 10
Gui, Font, s9, Courier New

Gui, Add, Text, xm ym w80 h22 0x202, Text
Gui, Add, Edit, x+10 ym w390 vTextTo gConvert
Gui, Add, Text, xm y+10 w483 h1 0x10

Gui, Add, Text, xm y+10 w80 h22 0x202, Char
Gui, Add, Edit, x+10 yp w390 0x0800 vChar
Gui, Add, Text, xm y+6 w80 h22 0x202, Decimal
Gui, Add, Edit, x+10 yp w390 0x0800 vDec
Gui, Add, Text, xm y+6 w80 h22 0x202, Octal
Gui, Add, Edit, x+10 yp w390 0x0800 vOct
Gui, Add, Text, xm y+6 w80 h22 0x202, Hexadecimal
Gui, Add, Edit, x+10 yp w390 0x0800 vHex
Gui, Add, Text, xm y+6 w80 h22 0x202, Binary
Gui, Add, Edit, x+10 yp w390 0x0800 vBin
Gui, Add, Text, xm y+6 w80 h22 0x202, Morsecode
Gui, Add, Edit, x+10 yp w390 0x0800 vMorse
Gui, Add, Text, xm y+10 w483 h1 0x10

Gui, Add, Text, xm y+10 w80 h22 0x202, Text Length
Gui, Add, Edit, x+10 yp w80 0x0800 vTl, 0

Gui, Font, cSilver,
Gui, Add, Text, x+10 yp w300 h22 0x202, made with %love% and AHK 2013-%A_YYYY%, jNizM

Gui, Show, AutoSize, %name% %version%
return

Convert:
    Gui, Submit, NoHide
    Tl := StrLen(TextTo)
    Char := Dec := Oct := Bin := Hex := Morse := ""
    loop %Tl%
    {
        CChar := SubStr(TextTo, A_Index, 1)
        CAsc := Asc(CChar)
        Char = %Char%Chr(%CAsc%)
        Dec = %Dec% %CAsc%
        Oct .= convert(10, 8, CAsc) . " "
        Bin .= convert(10, 2, CAsc) . " "
        Hex .= convert(10, 16, CAsc) . " "
    }
    GuiControl,, Tl, %Tl%
    GuiControl,, Char, %Char%
    GuiControl,, Dec, %Dec%
    GuiControl,, Oct, %Oct%
    GuiControl,, Bin, %Bin%
    GuiControl,, Hex, %Hex%
    StringLower, TextTo, TextTo
    loop, Parse, TextTo
    {
        (A_LoopField = " ") ? Morse .= "     "
        (A_LoopField = "a") ? Morse .= ".- "
        (A_LoopField = "b") ? Morse .= "-... "
        (A_LoopField = "c") ? Morse .= "-.-. "
        (A_LoopField = "d") ? Morse .= "-.. "
        (A_LoopField = "e") ? Morse .= ". "
        (A_LoopField = "f") ? Morse .= "..-. "
        (A_LoopField = "g") ? Morse .= "--. "
        (A_LoopField = "h") ? Morse .= ".... "
        (A_LoopField = "i") ? Morse .= ".. "
        (A_LoopField = "j") ? Morse .= ".--- "
        (A_LoopField = "k") ? Morse .= "-.- "
        (A_LoopField = "l") ? Morse .= ".-.. "
        (A_LoopField = "m") ? Morse .= "-- "
        (A_LoopField = "n") ? Morse .= "-. "
        (A_LoopField = "o") ? Morse .= "--- "
        (A_LoopField = "p") ? Morse .= ".--. "
        (A_LoopField = "q") ? Morse .= "--.- "
        (A_LoopField = "r") ? Morse .= ".-. "
        (A_LoopField = "s") ? Morse .= "... "
        (A_LoopField = "t") ? Morse .= "- "
        (A_LoopField = "u") ? Morse .= "..- "
        (A_LoopField = "v") ? Morse .= "...- "
        (A_LoopField = "w") ? Morse .= ".-- "
        (A_LoopField = "x") ? Morse .= "-..- "
        (A_LoopField = "y") ? Morse .= "-.-- "
        (A_LoopField = "z") ? Morse .= "--.. "
        (A_LoopField = "!") ? Morse .= "---. "
        (A_LoopField = "\") ? Morse .= ".-..-. "
        (A_LoopField = "$") ? Morse .= "...-..- "
        (A_LoopField = "'") ? Morse .= ".----. "
        (A_LoopField = "(") ? Morse .= "-.--. "
        (A_LoopField = ")") ? Morse .= "-.--.- "
        (A_LoopField = "+") ? Morse .= ".-.-. "
        (A_LoopField = ",") ? Morse .= "--..-- "
        (A_LoopField = "-") ? Morse .= "-....- "
        (A_LoopField = ".") ? Morse .= ".-.-.- "
        (A_LoopField = "/") ? Morse .= "-..-. "
        (A_LoopField = "0") ? Morse .= "----- "
        (A_LoopField = "1") ? Morse .= ".---- "
        (A_LoopField = "2") ? Morse .= "..--- "
        (A_LoopField = "3") ? Morse .= "...-- "
        (A_LoopField = "4") ? Morse .= "....- "
        (A_LoopField = "5") ? Morse .= "..... "
        (A_LoopField = "6") ? Morse .= "-.... "
        (A_LoopField = "7") ? Morse .= "--... "
        (A_LoopField = "8") ? Morse .= "---.. "
        (A_LoopField = "9") ? Morse .= "----. "
        (A_LoopField = ":") ? Morse .= "---... "
        (A_LoopField = ";") ? Morse .= "-.-.-. "
        (A_LoopField = "=") ? Morse .= "-...- "
        (A_LoopField = "?") ? Morse .= "..--.. "
        (A_LoopField = "@") ? Morse .= ".--.-. "
        (A_LoopField = "[") ? Morse .= "-.--. "
        (A_LoopField = "]") ? Morse .= "-.--.- "
        (A_LoopField = "_") ? Morse .= "..--.- "
    }
    GuiControl,, Morse, %Morse%
return

; FUNCTIONS =========================================================================

convert(from, to, n)
{
    if (from > 16 || from < 1 || to > 16 || to < 1)
    {
        return "error"
    }
    x := n
    if (from <> 10)
    {
        x := to_decimal(from, n)
    }
    if (x = -1)
    {
        return "error"
    }
    n := x
    if (to <> 10)
    {
        n := from_decimal(to, x)
    }
    return n
}

from_decimal(to, n)
{
    o := ""
    h := "0123456789ABCDEF"
    while (n > 0)
    {
        rem := mod(n, to)
        n /= to
        y := SubStr(h, rem + 1, 1)
        o = %y%%o%
    }
    return o
}

to_decimal(from, n)
{
    h := SubStr("0123456789ABCDEF", 1, from)
    d := 0
    loop % StrLen(n)
    {
        d *= from
        StringGetPos, p, h, % SubStr(n, A_Index, 1)
        if (p = -1)
        {
            return p
        }
        d += p
    }
    return d
}

; EXIT ==============================================================================

Close:
GuiClose:
GuiEscape:
    exitapp