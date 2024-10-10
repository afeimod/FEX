%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM0": ["0x400000003F800000", "0x4080000040400000", "0x40C0000040A00000", "0x4100000040E00000"],
    "XMM1": ["0x4100000040E00000", "0x40C0000040A00000", "0x4080000040400000", "0x400000003F800000"],
    "XMM2": ["0x4120000041000000", "0x4120000041000000", "0x4120000041000000", "0x4120000041000000"],
    "XMM3": ["0x4120000041000000", "0x4120000041000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM4": ["0x4120000041000000", "0x4120000041000000", "0x4120000041000000", "0x4120000041000000"],
    "XMM5": ["0x4120000041000000", "0x4120000041000000", "0x0000000000000000", "0x0000000000000000"]
  }
}
%endif

lea rdx, [rel .data]

; Registers
vmovapd ymm0, [rdx]
vmovapd ymm1, [rdx + 32]
vaddps ymm2, ymm0, ymm1
vaddps xmm3, xmm0, xmm1

; Memory operand
vaddps ymm4, ymm0, [rdx + 32]
vaddps xmm5, xmm0, [rdx + 32]

hlt

align 32
.data:
dq 0x400000003F800000 ; 2.0, 1.0
dq 0x4080000040400000 ; 4.0, 3.0
dq 0x40C0000040A00000 ; 6.0, 5.0
dq 0x4100000040E00000 ; 8.0, 7.0

dq 0x4100000040E00000 ; 8.0, 7.0
dq 0x40C0000040A00000 ; 6.0, 5.0
dq 0x4080000040400000 ; 4.0, 3.0
dq 0x400000003F800000 ; 2.0, 1.0
