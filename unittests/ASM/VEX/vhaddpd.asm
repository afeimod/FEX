%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM0": ["0x3FF0000000000000", "0x4000000000000000", "0x3FF0000000000000", "0x4000000000000000"],
    "XMM1": ["0x4010000000000000", "0x4020000000000000", "0x4010000000000000", "0x4020000000000000"],
    "XMM2": ["0x4008000000000000", "0x4028000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM3": ["0x4008000000000000", "0x4028000000000000", "0x4008000000000000", "0x4028000000000000"],
    "XMM4": ["0x4008000000000000", "0x4028000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM5": ["0x4008000000000000", "0x4028000000000000", "0x4008000000000000", "0x4028000000000000"]
  }
}
%endif

lea rdx, [rel .data]

vmovapd ymm0, [rdx]
vmovapd ymm1, [rdx + 32]

vhaddpd xmm2, xmm0, xmm1
vhaddpd ymm3, ymm0, ymm1

vhaddpd xmm4, xmm0, [rdx + 32]
vhaddpd ymm5, ymm0, [rdx + 32]

hlt

align 32
.data:
dq 0x3FF0000000000000 ; 1.0
dq 0x4000000000000000 ; 2.0
dq 0x3FF0000000000000 ; 1.0
dq 0x4000000000000000 ; 2.0

dq 0x4010000000000000 ; 4.0
dq 0x4020000000000000 ; 8.0
dq 0x4010000000000000 ; 4.0
dq 0x4020000000000000 ; 8.0
