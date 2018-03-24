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
nop
;;

ori r3,r0,100
lf f1,0(r0)
lf f2,4(r0)
nop
nop
;;

nop
lf f0,0(r2)
nop
nop
nop
;;

nop
lf f3,8(r0)
lf f4,12(r0)
nop
nop;;

nop
nop
nop
nop
nop;;





/* start of loop */
:loop
subui r3, r3, 5
lf f5, 0(r1)
sf 0(r1), f3
addf f1, f1, f0
addf f2, f2, f0;;


addi r1, r1, 20
nop
sf 0(r1), f5
nop
nop;;

nop
lf f1, 0(r1)
sf 0(r1), f4
addf f3, f3, f0
addf f4, f4, f0;;

nop
lf f2, 0(r1)
sf 0(r1), f4
addf f5, f5, f0
nop;;

bnez r3, loop
lf f3, 0(r1)
sf 0(r1), f1
nop
nop;;

nop
lf f4, 0(r1)
sf 0(r1), f2
nop
nop;;


:endlabel
trap
nop
nop
nop
nop
;;
