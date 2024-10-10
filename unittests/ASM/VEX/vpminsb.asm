%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM0": ["0x4142434445464748", "0x7172737475767778", "0x4142434445464748", "0x7172737475767778"],
    "XMM1": ["0x8062636465666768", "0x5152535455565758", "0x6162636465666768", "0x5152535455565758"],
    "XMM2": ["0x8042434445464748", "0x5152535455565758", "0x0000000000000000", "0x0000000000000000"],
    "XMM3": ["0x8042434445464748", "0x5152535455565758", "0x4142434445464748", "0x5152535455565758"],
    "XMM4": ["0x8042434445464748", "0x5152535455565758", "0x0000000000000000", "0x0000000000000000"],
    "XMM5": ["0x8042434445464748", "0x5152535455565758", "0x4142434445464748", "0x5152535455565758"],
    "XMM6": ["0x8042434445464748", "0x5152535455565758", "0x4142434445464748", "0x5152535455565758"],
    "XMM7": ["0x8042434445464748", "0x5152535455565758", "0x4142434445464748", "0x5152535455565758"]
  }
}
%endif

lea rdx, [rel .data]

vmovapd ymm0, [rdx]
vmovapd ymm1, [rdx + 32]

vpminsb xmm2, xmm0, xmm1
vpminsb ymm3, ymm0, ymm1

vpminsb xmm4, xmm0, [rdx + 32]
vpminsb ymm5, ymm0, [rdx + 32]

; Some funky combinations for testing fast paths
; Related to SVE sources aliasing the destination
vmovapd ymm6, ymm0
vpminsb ymm6, ymm6, ymm5

vmovapd ymm7, ymm0
vpminsb ymm7, ymm5, ymm7

hlt

align 32
.data:
dq 0x4142434445464748
dq 0x7172737475767778
dq 0x4142434445464748
dq 0x7172737475767778

dq 0x8062636465666768
dq 0x5152535455565758
dq 0x6162636465666768
dq 0x5152535455565758
