%ifdef CONFIG
{
  "RegData": {
    "XMM0": ["0x5152535455565758", "0x7172737475767778"]
  }
}
%endif

mov rdx, 0xe0000000

mov rax, 0x4142434445464748
mov [rdx + 8 * 0], rax
mov rax, 0x5152535455565758
mov [rdx + 8 * 1], rax
mov rax, 0x6162636465666768
mov [rdx + 8 * 2], rax
mov rax, 0x7172737475767778
mov [rdx + 8 * 3], rax

; Preload
movupd xmm0, [rdx]
movupd xmm1, [rdx + 8 * 2]

unpckhpd xmm0, xmm1

hlt
