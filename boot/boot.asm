
; Iniciando fazendo movimentação de bits
MBALIGN equ 1<<0  ; move 0 1 byte  a esquerda
MEMINFO	equ 1<<1 ; move 1 1 byte a esquerda
MBFLAGS equ MBALIGN | MEMINFO ; 0101 /
MAGICNUMBER equ 0x1BADB002
CHECKSUM equ -(MAGICNUMBER + MBFLAGS)
; definindo as variaveis

section .multiboot ; função do multiboot
align 4 ; alinhar 4 bytes
	dd MAGICNUMBER
	dd MBFLAGS
	dd CHECKSUM;


section .bss
align 16 ; alinhar 16bits  ; move os dados para o fim da stack
stack_bottom:
resb 16384 ; 16KiB
stack_top:

section .msg
global _start:function (_start.end - _start)
_start:
	mov esp, stack_top

	extern kernel_main 
	call kernel_main ; chama o codigo externo do kernel
	cli
.hang: hlt
	jmp .hang
.end:
