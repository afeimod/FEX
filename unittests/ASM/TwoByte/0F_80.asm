%ifdef CONFIG
{
  "RegData": {
    "RAX": "0x1",
    "RBX": "0x0"
  }
}
%endif

mov r15, 0xe0000000

mov r10, 0x80000000
mov r11, 0x1
mov r12, 0x2

cmp r10d, r12d

mov rax, 0
mov rbx, 0

jo .tgt_1
jno .tgt_2
jmp .end

.tgt_1:
mov rax, 1
jmp .end

.tgt_2:
mov rbx, 1
jmp .end

.end:
hlt
