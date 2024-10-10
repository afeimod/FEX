%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM0": ["0xC008000000000000", "0x5152535455565758", "0x0000000000000000", "0x0000000000000000"],
    "XMM1": ["0x4010000000000000", "0x5152535455565758", "0x5152535455565758", "0x5152535455565758"],
    "XMM2": ["0xC01C000000000000", "0x5152535455565758", "0x0000000000000000", "0x0000000000000000"],
    "XMM3": ["0x4030000000000000", "0x5152535455565758", "0x5152535455565758", "0x5152535455565758"],
    "XMM4": ["0x4038000000000000", "0x5152535455565758", "0x0000000000000000", "0x0000000000000000"],
    "XMM5": ["0x4035000000000000", "0x5152535455565758", "0x0000000000000000", "0x0000000000000000"],
    "XMM7": ["0xC022000000000000", "0x5152535455565758", "0x0000000000000000", "0x0000000000000000"],
    "XMM8": ["0x4030000000000000", "0x5152535455565758", "0x5152535455565758", "0x5152535455565758"],
    "XMM9": ["0x4039000000000000", "0x5152535455565758", "0x5152535455565758", "0x5152535455565758"]
  }
}
%endif

lea rdx, [rel .data]

vmovapd ymm0, [rdx + 32 * 0]
vmovapd ymm1, [rdx + 32 * 1]
vmovapd ymm2, [rdx + 32 * 2]
vmovapd ymm3, [rdx + 32 * 3]
vmovapd ymm4, [rdx + 32 * 4]

; Register only
vsubsd xmm0, xmm0, xmm1
vsubsd xmm2, xmm2, xmm3

; Memory operand
vsubsd xmm5, xmm4, [rdx + 32 * 1]
vsubsd xmm4, xmm4, [rdx + 32 * 0]

; Merging different src into destination
vpxor xmm7, xmm7, xmm7
vmovapd ymm8, [rdx + 32 * 3]
vmovapd ymm9, [rdx + 32 * 4]
vsubsd xmm7, xmm8, xmm9

hlt

align 32
.data:
dq 0x3FF0000000000000 ; 1.0
dq 0x5152535455565758
dq 0x5152535455565758
dq 0x5152535455565758

dq 0x4010000000000000 ; 4.0
dq 0x5152535455565758
dq 0x5152535455565758
dq 0x5152535455565758

dq 0x4022000000000000 ; 9.0
dq 0x5152535455565758
dq 0x5152535455565758
dq 0x5152535455565758

dq 0x4030000000000000 ; 16.0
dq 0x5152535455565758
dq 0x5152535455565758
dq 0x5152535455565758

dq 0x4039000000000000 ; 25.0
dq 0x5152535455565758
dq 0x5152535455565758
dq 0x5152535455565758
