%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM0": ["0x4142434445464748", "0x5152535455565758", "0x6162636465666768", "0x7172737475767778"],
    "XMM1": ["0xCCCCCCCC75767778", "0x61626364DDDDDDDD", "0xEEEEEEEE55565758", "0x41424344FFFFFFFF"],
    "XMM2": ["0x8C8C8C8830303030", "0x2020202088898885", "0x8E8C8C8A10101010", "0x000000008A898887"],
    "XMM3": ["0x8C8C8C8830303030", "0x2020202088898885", "0x0000000000000000", "0x0000000000000000"],
    "XMM4": ["0x8C8C8C8830303030", "0x2020202088898885", "0x8E8C8C8A10101010", "0x000000008A898887"],
    "XMM5": ["0x8C8C8C8830303030", "0x2020202088898885", "0x0000000000000000", "0x0000000000000000"]
  }
}
%endif

lea rdx, [rel .data1]
lea rbx, [rel .data2]

vmovapd ymm0, [rdx]
vmovapd ymm1, [rbx]

; Register only
vpandn ymm2, ymm0, ymm1
vpandn xmm3, xmm0, xmm1

; With memory operand
vpandn ymm4, ymm0, [rbx]
vpandn xmm5, xmm0, [rbx]

hlt

align 32
.data1:
dq 0x4142434445464748
dq 0x5152535455565758
dq 0x6162636465666768
dq 0x7172737475767778

.data2:
dq 0xCCCCCCCC75767778
dq 0x61626364DDDDDDDD
dq 0xEEEEEEEE55565758
dq 0x41424344FFFFFFFF
