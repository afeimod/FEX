%ifdef CONFIG
{
  "RegData": {
    "MM5":  ["0x0000000000000000", "0x0000"],
    "MM6":  ["0x8000000000000000", "0x3FFF"],
    "MM7":  ["0x8000000000000000", "0x3FFF"]
  }
}
%endif

mov rdx, 0xe0000000

mov eax, 0x3f800000 ; 1.0
mov [rdx + 8 * 0], eax

fld1
fldz

mov eax, 2
cmp eax, 2

fcmovbe st0, st1

fldz
cmp eax, 0
fcmovbe st0, st2

hlt
