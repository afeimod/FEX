%ifdef CONFIG
{
  "RegData": {
    "RAX": "0x1",
    "RBX": "0xFFFFFFFFFFFFFFFF"
  }
}
%endif

mov r15, 0xe0000000

mov rax, 0x0
mov [r15 + 8 * 0], rax
mov rax, 0x1
mov [r15 + 8 * 1], rax
mov rax, 0x2
mov [r15 + 8 * 2], rax

mov r10, 0x3
mov r11, 0x0
mov r12, 0x1

cmp r10d, r12d

mov rax, -1
mov rbx, -1
cmovnp rax, [r15 + 8 * 1]
cmovp  rbx, [r15 + 8 * 0]

hlt
