	lhi	r1,((_numbers)>>16)&0xffff
	addui	r1,r1,(_numbers)&0xffff
	lf	f1, 0(r1)
	lf	f2, 20(r1)
	divf	f2,f2,f1
	movi2fp f3,r0
	sf 20(r1),f3
		lf f3, 4(r1)
		lf f5, 8(r1)
		lf f7, 12(r1)
		lf f9, 16(r1)
		multf f3,f3,f2
		multf f5,f5,f2
		multf f7,f7,f2
		multf f9,f9,f2
		lf f4, 24(r1)
		lf f6, 28(r1)
		lf f8, 32(r1)
		lf f10, 36(r1)
		subf f4,f4,f3
		subf f6,f6,f5
		subf f8,f8,f7
		subf f10,f10,f9
		sf 24(r1), f4
		sf 28(r1), f6
		sf 32(r1), f8
		sf 36(r1), f10
	lf	f2, 40(r1)
	divf	f2,f2,f1
	movi2fp f3,r0
	sf 40(r1),f3
		lf f3, 4(r1)
		lf f5, 8(r1)
		lf f7, 12(r1)
		lf f9, 16(r1)
		multf f3,f3,f2
		multf f5,f5,f2
		multf f7,f7,f2
		multf f9,f9,f2
		lf f4, 44(r1)
		lf f6, 48(r1)
		lf f8, 52(r1)
		lf f10, 56(r1)
		subf f4,f4,f3
		subf f6,f6,f5
		subf f8,f8,f7
		subf f10,f10,f9
		sf 44(r1), f4
		sf 48(r1), f6
		sf 52(r1), f8
		sf 56(r1), f10
	lf	f2, 60(r1)
	divf	f2,f2,f1
	movi2fp f3,r0
	sf 60(r1),f3
		lf f3, 4(r1)
		lf f5, 8(r1)
		lf f7, 12(r1)
		lf f9, 16(r1)
		multf f3,f3,f2
		multf f5,f5,f2
		multf f7,f7,f2
		multf f9,f9,f2
		lf f4, 64(r1)
		lf f6, 68(r1)
		lf f8, 72(r1)
		lf f10, 76(r1)
		subf f4,f4,f3
		subf f6,f6,f5
		subf f8,f8,f7
		subf f10,f10,f9
		sf 64(r1), f4
		sf 68(r1), f6
		sf 72(r1), f8
		sf 76(r1), f10
	lf	f1, 24(r1)
	lf	f2, 44(r1)
	divf	f2,f2,f1
	movi2fp f3,r0
	sf 44(r1),f3
		lf f3, 28(r1)
		lf f5, 32(r1)
		lf f7, 36(r1)
		multf f3,f3,f2
		multf f5,f5,f2
		multf f7,f7,f2
		lf f4, 48(r1)
		lf f6, 52(r1)
		lf f8, 56(r1)
		subf f4,f4,f3
		subf f6,f6,f5
		subf f8,f8,f7
		sf 48(r1), f4
		sf 52(r1), f6
		sf 56(r1), f8
	lf	f2, 64(r1)
	divf	f2,f2,f1
	movi2fp f3,r0
	sf 64(r1),f3
		lf f3, 28(r1)
		lf f5, 32(r1)
		lf f7, 36(r1)
		multf f3,f3,f2
		multf f5,f5,f2
		multf f7,f7,f2
		lf f4, 68(r1)
		lf f6, 72(r1)
		lf f8, 76(r1)
		subf f4,f4,f3
		subf f6,f6,f5
		subf f8,f8,f7
		sf 68(r1), f4
		sf 72(r1), f6
		sf 76(r1), f8
	lf	f1, 48(r1)
	lf	f2, 68(r1)
	divf	f2,f2,f1
	movi2fp f3,r0
	sf 68(r1),f3
		lf f3, 52(r1)
		lf f5, 56(r1)
		multf f3,f3,f2
		multf f5,f5,f2
		lf f4, 72(r1)
		lf f6, 76(r1)
		subf f4,f4,f3
		subf f6,f6,f5
		sf 72(r1), f4
		sf 76(r1), f6
