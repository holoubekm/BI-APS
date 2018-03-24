.data
:X
.float 1.0
.float 2.0
.float 3.0
.float 4.0
.float 5.0
.float 6.0
.float 7.0
.float 8.0
.float 9.0
.float 10.0
.space 360

:K
.float 1.0

.text

/* r2 = addr of K, r1 = addr X */ 
ori r2,r0,K
ori r1,r0,X
nop
nop
nop;;

ori r3,r0,95
lf f1,0(r0)
lf f2,4(r0)
nop
nop;;

ori r1,r1,20
lf f0,0(r2)
nop
nop
nop;;

nop
nop
nop
nop
nop;;

nop
nop
nop
nop
nop;;

nop
lf f3, 8(r0)
lf f4, 12(r0)
addf f1, f1, f0
addf f2, f2, f0;;

nop
nop
lf f5, 16(r0)
nop
nop;;

nop
nop
nop
nop
nop;;

nop
nop
lf f2,4(r1)
addf f3, f3, f0
nop;;

nop
lf f1,0(r1)
sf -20(r1), f1
addf f4, f4, f0
nop;;

nop
nop
sf -16(r1), f2
addf f5, f5, f0
nop;;

nop
lf f3, 8(r1)
lf f4, 12(r1)
nop
nop;;

/* start of loop */
:loop
subui r3, r3, 5
lf f5, 16(r1)
sf -12(r1), f3
addf f1, f1, f0
addf f2, f2, f0;;

addi r1, r1, 20
nop
sf -8(r1), f4
nop
nop;;

nop
lf f1, 20(r1)
sf -4(r1), f5
addf f3, f3, f0
addf f4, f4, f0;;

nop
lf f2, 4(r1)
nop
addf f5, f5, f0
nop;;

bnez r3, loop
lf f3, 8(r1)
sf -20(r1), f1
nop
nop;;

nop
lf f4, 12(r1)
sf -16(r1), f2
nop
nop;;

:endlabel

nop
nop
nop
nop
nop;;

trap
nop
nop
nop
nop
;;
