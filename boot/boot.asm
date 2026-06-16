
; Iniciando fazendo movimentação de bits
MBALIGIN equ 1<<0  ; move 0 1 byte  a esquerda
MEMINFO	equ 1<<1 ; move 1 1 byte a esquerda
MBFLAGS equ MBALIGN | MEMINFO ; 0101 /
MAGICNUMBER equ 0x1BADB002

; definindo as variaveis

section .multiboot ; função do multiboot
align 4 ; alinhar 4 bytes
	dd MAGIC
	dd MBFLAGS
	dd ;


section .idontunderstandkkkkkkk
align 16 ; alinhar 16bits  ; move os dados para o fim da stack
stack_bottom:
resb 16384 ; 16KiB
stack_top:

section .msg
global _start:function (_start.end - _start)
_start:
