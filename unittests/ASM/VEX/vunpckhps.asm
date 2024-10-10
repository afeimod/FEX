%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM2": ["0x7576777855565758", "0x7172737451525354", "0x0000000000000000", "0x0000000000000000"],
    "XMM3": ["0x7576777855565758", "0x7172737451525354", "0x0000000000000000", "0x0000000000000000"],
    "XMM4": ["0x7576777855565758", "0x7172737451525354", "0x88888888CCCCCCCC", "0x99999999DDDDDDDD"],
    "XMM5": ["0x7576777855565758", "0x7172737451525354", "0x88888888CCCCCCCC", "0x99999999DDDDDDDD"]
  }
}
%endif

lea rdx, [rel .data]

vmovaps ymm0, [rdx]
vmovaps ymm1, [rdx + 32]

vunpckhps xmm2, xmm0, xmm1
vunpckhps xmm3, xmm0, [rdx + 32]

vunpckhps ymm4, ymm0, ymm1
vunpckhps ymm5, ymm0, [rdx + 32]

hlt

align 32
.data:
dq 0x4142434445464748
dq 0x5152535455565758
dq 0xFFFFFFFFEEEEEEEE
dq 0xDDDDDDDDCCCCCCCC

dq 0x6162636465666768
dq 0x7172737475767778
dq 0xBBBBBBBBAAAAAAAA
dq 0x9999999988888888
