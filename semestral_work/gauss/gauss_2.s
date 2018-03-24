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
_size:
	.word	10
	.align 2
_numbers:
	;.float	 2.0
	;.float	-1.0
	;.float	 5.0
	;.float	-1.0
	;.float	-3.0
	;.float	1.0

	;.float	 1
	;.float	-3
	;.float	 1
	;.float	 4
	;.float	 2
	;.float	-8
	;.float	 8
	;.float	-2
	;.float	-6
	;.float	 3
	;.float	-15
	;.float	 9

	;.float	2
	;.float	2
	;.float	3
	;.float	4
	;.float	5
	;.float	7
	;.float	7
	;.float	9
	;.float	9
	;.float	10
	;.float	11
	;.float	14
	;.float	13
	;.float	14
	;.float	16
	;.float	16
	;.float	17
	;.float	21
	;.float	19
	;.float	20
	;.float	21
	;.float	23
	;.float	23
	;.float	28
	;.float	25
	;.float	26
	;.float	27
	;.float	28
	;.float	30
	;.float	35


	.float	1
	.float	1
	.float	1
	.float	1
	.float	5
	.float	6
	.float	7
	.float	8
	.float	9
	.float	10
	.float	11
	.float	12
	.float	13
	.float	4
	.float	15
	.float	16
	.float	17
	.float	18
	.float	19
	.float	20
	.float	21
	.float	22
	.float	23
	.float	24
	.float	5
	.float	-26
	.float	27
	.float	28
	.float	29
	.float	30
	.float	31
	.float	32
	.float	33
	.float	34
	.float	35
	.float	6
	.float	7
	.float	8
	.float	39
	.float	40
	.float	41
	.float	-42
	.float	43
	.float	44
	.float	45
	.float	46
	.float	7
	.float	4
	.float	-9
	.float	-50
	.float	51
	.float	52
	.float	53
	.float	54
	.float	55
	.float	56
	.float	57
	.float	8
	.float	5
	.float	-60
	.float	61
	.float	62
	.float	63
	.float	64
	.float	65
	.float	66
	.float	67
	.float	68
	.float	9
	.float	70
	.float	71
	.float	72
	.float	7
	.float	74
	.float	75
	.float	76
	.float	77
	.float	78
	.float	79
	.float	7
	.float	81
	.float	82
	.float	83
	.float	-84
	.float	85
	.float	86
	.float	87
	.float	88
	.float	89
	.float	90
	.float	91
	.float	92
	.float	93
	.float	94
	.float	95
	.float	96
	.float	97
	.float	98
	.float	99
	.float	100
	.float	101
	.float	102
	.float	103
	.float	104
	.float	105
	.float	16
	.float	107
	.float	108
	.float	19
	.float	11

	.align 2
LC0:
	.word	0
.text
	.align 2
_gauss:
;  Function 'gauss'; 44 bytes of locals, 10 regs to save.
	sw	-4(r29),r30	; push fp
	add	r30,r0,r29	; fp = sp
	sw	-8(r29),r31	; push ret addr
	subui	r29,r29,#56	; alloc local storage

	sw	0(r29),r2
	sw	4(r29),r3
	sw	8(r29),r4
	sw	12(r29),r5
	sw	16(r29),r6
	sw	20(r29),r7
	sw	24(r29),r16
	sf	28(r29),f2
	sf	32(r29),f3
	sf	36(r29),f4

	lhi	r14,((_numbers)>>16)&0xffff
	addui	r14,r14,(_numbers)&0xffff ; r14 = _numbers

	lw	r4,(r30) ; size
	addi	r1,r0,#0 ; index i = 0
	addi	r5,r4,#1 ; cols = size + 1
	slli r8,r5,#2 ; r8 = cols * sizeof(float)
	addi	r6,r0,#0 ; r6 = i * cols = 0
_ROWS:
; {
	; f1 - _numbers[i * cols + i]
	; f2 - ratio
	; f3 - tmp
	; f4 - tmp

	; r1 - index i
	; r2 - index j
	; r3 - index k
	; r4 - size
	; r5 - size + 1
	; r6 - (i * cols) * sizeof(float) = i * r8
	; r7 - (j * cols) * sizeof(float) = j * r8
	; r8 - cols * size(float)
	; r14 - _numbers
	; r15 - tmp
	; r16 - tmp
	; r30 - stack pointer

	slli r15, r1, #2 ; tmp = i * sizeof(float)
	add r15, r6, r15 ; tmp = i * sezeof(float) + (i * cols) * sizeof(float)
	add r15,r15,r14 ; _numbers + tmp
	lf f1,0(r15) ; f1 = _numbers[i * cols + i]

	addi	r2,r1,#1 ; int j = i + 1
	add	r7,r6,r8 ; r7 = j * cols = (i + 1) * cols * sizeof(float) = (i * cols + cols) * sizeof(float)
	_COLS:
		; {
			slli r16,r1,#2 ; tmp = i * sizeof(float)
			add r16,r16,r7 ;
			add r16,r14,r16 ; tmp = _numbers + (j * cols + i) * sizeof(float)
			lf f2,0(r16) ; f2 = _numbers[j * cols + i]
			addi	r3,r1,#1 ; int k = j + 1
			divf f2,f2,f1 ; f2 = _numbers[j * col + i] / tmp
			
			addi r15,r0,#0 ; r15 = 0
			movi2fp f3,r15
			sf 0(r16),f3 ; _numbers[j * cols + i] = 0.0

			_FILL:
			; {
				slli r15,r3,#2 ; k * sizeof(float)
				add r15,r7,r15
				add r15,r15,r14 ; tmp = _numbers + (j * cols + k) * sizeof(float)
				lf f3, 0(r15)

				slli r16,r3,#2 ; tmp = k * sizeof(float)
				add r16, r6, r16 ; tmp = k * sizeof(float) + (i * cols) * sizeof(float)
				add r16,r16,r14 ; tmp = _numbers + (j * cols + k) * sizeof(float)
				lf f4, 0(r16)

				multf f4,f4,f2 ; tmp = c * _numbers[i * cols + k]
				subf f3,f3,f4
				sf 0(r15),f3

				addi r3,r3,#1 ; k = k + 1
				slt r15,r3,r5 ; timp = k < cols (size + 1)
				bnez r15,_FILL
			; }

		add r7, r7, r8 ; r6 = r6 + cols * sizeof(float)
		addi r2,r2,#1 ; j = j + 1
		slt r15,r2,r4 ; tmp = j < size
		bnez	r15,_COLS ; while(tmp) -> _COLS
		; columns loop END
		; } 

	add r6, r6, r8 ; r6 = r6 + cols * sizeof(float)
	addi r1,r1,#1 ; i = i + 1
	subi r15,r4,#1 ; rmp = size - 1
	slt	r15,r1,r15 ; tmp = i < size - 1
	bnez	r15,_ROWS ; while(tmp) -> _ROWS
; rows loop END
; }

	lw	r2, 0(r29)
	lw	r3, 4(r29)
	lw	r4, 8(r29)
	lw	r5, 12(r29)
	lw	r6, 16(r29)
	lw	r7, 20(r29)
	lw	r16, 24(r29)
	lf	f2, 28(r29)
	lf	f3, 32(r29)
	lf	f4, 36(r29)

	lw	r31,-8(r30)
	add	r29,r0,r30
	lw	r30,-4(r30)
	jr	r31
	.align 2
_main:
;  Function 'main'; 0 bytes of locals, 0 regs to save.
	sw	-4(r29),r30	; push fp
	add	r30,r0,r29	; fp = sp
	sw	-8(r29),r31	; push ret addr
	subui	r29,r29,#8	; alloc local storage
	jal	___main
	addi	r29,r29,#-8
	add	r2,r0,r29
	lhi	r1,((_size)>>16)&0xffff
	addui	r1,r1,(_size)&0xffff
	lw	r1,(r1)
	sw	(r2),r1
	jal	_gauss
	addi	r29,r29,#8
	addi	r1,r0,#0
	jal	_exit
	nop
