%ifdef CONFIG
{
  "RegData": {
    "RCX": "5",
    "RDI": "0xE0000003"
  }
}
%endif

mov rdx, 0xe0000000

mov rax, 0x4142434445466161
mov [rdx + 8 * 0], rax
mov rax, 0x5152535455565758
mov [rdx + 8 * 1], rax
mov rax, 0x0
mov [rdx + 8 * 2], rax

lea rdi, [rdx + 8 * 0]

cld
mov rax, 0x61
mov rcx, 8
cmp rax, 0x61

rep scasb

hlt
