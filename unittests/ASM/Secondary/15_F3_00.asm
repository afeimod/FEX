%ifdef CONFIG
{
  "RegData": {
    "RAX": "0x0000434445464748",
    "RBX": "0x0000000045464748",
    "RCX": "0x0000434445464748"
  }
}
%endif

mov rax, 0x0000434445464748
mov rbx, -1
mov rcx, -1

wrfsbase rax
rdfsbase ebx ; 32bit
rdfsbase rcx ; 64bit

hlt
