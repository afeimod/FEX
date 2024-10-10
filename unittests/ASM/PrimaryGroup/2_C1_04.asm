%ifdef CONFIG
{
  "RegData": {
    "RAX": "0x4142434415184748",
    "RBX": "0x5152535455595D60",
    "RCX": "0x95999da000000000"
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

shl  word [rdx + 8 * 0 + 2], 0x62
shl dword [rdx + 8 * 1 + 0], 0x62
shl qword [rdx + 8 * 2 + 0], 0x62

mov rax, [rdx + 8 * 0]
mov rbx, [rdx + 8 * 1]
mov rcx, [rdx + 8 * 2]
mov rdx, [rdx + 8 * 3]

hlt
