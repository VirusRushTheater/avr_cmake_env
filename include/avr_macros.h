#ifndef __AVR_MACROS_H
#define __AVR_MACROS_H

#define NEEDS_BIT(N, B)     (((unsigned long)N >> B) > 0)

#define LOG2_32B(N) ( \
    (N > 0x00000001) + (N > 0x00000002) + (N > 0x00000004) + (N > 0x00000008) + \
    (N > 0x00000010) + (N > 0x00000020) + (N > 0x00000040) + (N > 0x00000080) + \
    (N > 0x00000100) + (N > 0x00000200) + (N > 0x00000400) + (N > 0x00000800) + \
    (N > 0x00001000) + (N > 0x00002000) + (N > 0x00004000) + (N > 0x00008000) + \
    (N > 0x00010000) + (N > 0x00020000) + (N > 0x00040000) + (N > 0x00080000) + \
    (N > 0x00100000) + (N > 0x00200000) + (N > 0x00400000) + (N > 0x00800000) + \
    (N > 0x01000000) + (N > 0x02000000) + (N > 0x04000000) + (N > 0x08000000) + \
    (N > 0x10000000) + (N > 0x20000000) + (N > 0x40000000) + (N > 0x80000000))

#define LOG2_8B(N) ( \
    (N > 0x01) + (N > 0x02) + (N > 0x04) + (N > 0x08) + \
    (N > 0x10) + (N > 0x20) + (N > 0x40) + (N > 0x80))

#endif