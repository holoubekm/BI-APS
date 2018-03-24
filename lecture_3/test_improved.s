; for the benefit of gcc.
.text
Start:
	lhi	r29,((_stack + 4092)>>16)&0xffff
	addui	r29,r29,(_stack + 4092)&0xffff
	jal	_main        
	nop

;
; DLX traps and other support functions.
;
; Aaron Sawdey 1994,1995; released to the Public Domain.
;
.text
_trap_exit:		
	trap	#0
	jr	r31
	nop

_trap_open:		
	trap	#1
	jr	r31
	nop

_trap_close:		
	trap	#2
	jr	r31
	nop

_trap_read:		
	trap	#3
	jr	r31
	nop

_trap_write:		
	trap	#4
	jr	r31
	nop

_trap_printf:		
	trap	#5
	jr	r31
	nop

_trap_lseek:		
	trap	#6
	jr	r31
	nop

_trap_random:		
	trap	#7
	jr	r31
	nop

_barrier:		
	trap	#8
	jr	r31
	nop

_trap_tell:		
	trap	#9
	jr	r31
	nop

_trap_isatty:		
	trap	#10
	jr	r31
	nop

_trap_access:		
	trap	#11
	jr	r31
	nop

_fork:		
	trap	#13
	jr	r31
	nop

_join:		
	trap	#14
	jr	r31
	nop

_trap_srandom:		
	trap	#15
	jr	r31
	nop

;
; Math related traps.
;

_trap_cos:
        trap 	#20
	jr	r31
	nop

_trap_acos:
        trap 	#21
	jr	r31
	nop

_trap_sin:
        trap 	#22
	jr	r31
	nop

_trap_asin:
        trap 	#23
	jr	r31
	nop

_trap_tan:
        trap 	#24
	jr	r31
	nop

_trap_atan:
        trap 	#25
	jr	r31
	nop

_trap_log10:
        trap 	#26
	jr	r31
	nop

_trap_log:
        trap 	#27
	jr	r31
	nop

_trap_exp:
        trap 	#28
	jr	r31
	nop

_trap_sqrt:		
	trap	#29
	jr	r31
	nop

_trap_pow:
        trap 	#30
	jr	r31
	nop

; for the benefit of gcc.
___main:
        nop
	jr	r31
	nop

.data
.align 2
_stack:
.space 4096

;
; Stub functions for DLX traps.
;
; Aaron Sawdey 1996; released to the Public Domain.
;
.text
_exit:		
	trap	#0
	jr	r31
	nop

;
; Stub functions for DLX traps.
;
; Aaron Sawdey 1996; released to the Public Domain.
;
.text
_printf:		
	trap	#5
	jr	r31
	nop

;
; Stub functions for DLX traps.
;
; Aaron Sawdey 1996; released to the Public Domain.
;
.text
_srandom:		
	trap	#15
	jr	r31
	nop


;
; Stub functions for DLX traps.
;
; Aaron Sawdey 1996; released to the Public Domain.
;
.text
_cos:
        trap 	#20
	jr	r31
	nop

_acos:
        trap 	#21
	jr	r31
	nop

_sin:
        trap 	#22
	jr	r31
	nop

_asin:
        trap 	#23
	jr	r31
	nop

_tan:
        trap 	#24
	jr	r31
	nop

_atan:
        trap 	#25
	jr	r31
	nop

_log10:
        trap 	#26
	jr	r31
	nop

_log:
        trap 	#27
	jr	r31
	nop

_exp:
        trap 	#28
	jr	r31
	nop

_sqrt:		
	trap	#29
	jr	r31
	nop

_pow:
        trap 	#30
	jr	r31
	nop


;
; Stub functions for DLX traps.
;
; Aaron Sawdey 1996; released to the Public Domain.
;
.text
_random:		
	trap	#7
	jr	r31
	nop

;
; Stub functions for DLX traps.
;
; Aaron Sawdey 1996; released to the Public Domain.
;
.text
_write:		
	trap	#4
	jr	r31
	nop

.text
_lseek:		
	trap	#6
	jr	r31
	nop

.text
_tell:		
	trap	#9
	jr	r31
	nop


.text
_isatty:		
	trap	#10
	jr	r31
	nop


.text
_access:		
	trap	#11
	jr	r31
	nop

.data
	.align 2
_numbers:
	.word	20
	.word	50
	.word	100
	.word	40
	.word	1
	.word	10
	.word	25
	.word	80
	.word	13
	.word	7
	.word	37
	.word	200
	.word	50
	.word	17
	.word	28
	.word	6
	.word	12
	.word	3
	.word	130
	.word	77
.text
	.align 2
_main:
;  Function 'main'; 0 bytes of locals, 0 regs to save.
	sw	-4(r29),r30	; push fp
	add	r30,r0,r29	; fp = sp
	sw	-8(r29),r31	; push ret addr
	subui	r29,r29,#8	; alloc local storage
	jal	___main
	lhi	r31,((_numbers)>>16)&0xffff
	addui	r31,r31,(_numbers)&0xffff
	lw	r3,(r31)
	addi	r4,r0,#1
	addi	r2,r31,#4
L7:
	lw	r31,(r2)
	addi	r4,r4,#1
	sge	r1,r3,r31
	bnez	r1,L4
	add	r3,r0,r31
L4:
	slei	r31,r4,#19
	addi	r2,r2,#4
	bnez	r31,L7
	add	r1,r0,r3
	jal	_exit
	nop
	.align 2
_Max:
;  Function 'Max'; 0 bytes of locals, 4 regs to save.
	sw	-4(r29),r30	; push fp
	add	r30,r0,r29	; fp = sp
	sw	-8(r29),r31	; push ret addr
	subui	r29,r29,#24	; alloc local storage
	sw	0(r29),r2
	sw	4(r29),r3
	sw	8(r29),r4
	sw	12(r29),r5
	lhi	r2,((_numbers)>>16)&0xffff
	addui	r2,r2,(_numbers)&0xffff
	lw	r3,(r2)
	addi	r4,r0,#1
	lw	r31,(r30)
	addi	r5,r31,#-1
	sle	r31,r4,r5
	beqz	r31,L19
	addi	r2,r2,#4
L17:
	lw	r31,(r2)
	sge	r1,r3,r31
	bnez	r1,L14
	add	r3,r0,r31
L14:
	addi	r2,r2,#4
	addi	r4,r4,#1
	sle	r31,r4,r5
	bnez	r31,L17
L19:
	add	r1,r0,r3
	lw	r2,0(r29)
	lw	r3,4(r29)
	lw	r4,8(r29)
	lw	r5,12(r29)
	lw	r31,-8(r30)
	add	r29,r0,r30
	lw	r30,-4(r30)
	jr	r31
