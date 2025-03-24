	.file	"mergesort.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	merge
	.type	merge, @function
merge:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s2,136(sp)
	sd	s3,128(sp)
	sd	s4,120(sp)
	sd	s5,112(sp)
	sd	s6,104(sp)
	sd	s7,96(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 18, -24
	.cfi_offset 19, -32
	.cfi_offset 20, -40
	.cfi_offset 21, -48
	.cfi_offset 22, -56
	.cfi_offset 23, -64
	addi	s0,sp,160
	.cfi_def_cfa 8, 0
	sd	a0,-136(s0)
	mv	a0,a1
	mv	a1,a2
	mv	a2,a3
	mv	a3,a0
	sw	a3,-140(s0)
	mv	a3,a1
	sw	a3,-144(s0)
	mv	a3,a2
	sw	a3,-148(s0)
	mv	a3,sp
	mv	a1,a3
	lw	a3,-144(s0)
	mv	a2,a3
	lw	a3,-140(s0)
	subw	a3,a2,a3
	sext.w	a3,a3
	addiw	a3,a3,1
	sw	a3,-88(s0)
	lw	a3,-148(s0)
	mv	a2,a3
	lw	a3,-144(s0)
	subw	a3,a2,a3
	sw	a3,-92(s0)
	lw	a3,-88(s0)
	mv	a2,a3
	addi	a2,a2,-1
	sd	a2,-104(s0)
	mv	a2,a3
	mv	s6,a2
	li	s7,0
	srli	a2,s6,59
	slli	t4,s7,5
	or	t4,a2,t4
	slli	t3,s6,5
	mv	a2,a3
	mv	s4,a2
	li	s5,0
	srli	a2,s4,59
	slli	t2,s5,5
	or	t2,a2,t2
	slli	t1,s4,5
	slli	a3,a3,2
	addi	a3,a3,15
	srli	a3,a3,4
	slli	a3,a3,4
	sub	sp,sp,a3
	mv	a3,sp
	addi	a3,a3,3
	srli	a3,a3,2
	slli	a3,a3,2
	sd	a3,-112(s0)
	lw	a3,-92(s0)
	mv	a2,a3
	addi	a2,a2,-1
	sd	a2,-120(s0)
	mv	a2,a3
	mv	s2,a2
	li	s3,0
	srli	a2,s2,59
	slli	a7,s3,5
	or	a7,a2,a7
	slli	a6,s2,5
	mv	a2,a3
	mv	t5,a2
	li	t6,0
	srli	a2,t5,59
	slli	a5,t6,5
	or	a5,a2,a5
	slli	a4,t5,5
	mv	a5,a3
	slli	a5,a5,2
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	mv	a5,sp
	addi	a5,a5,3
	srli	a5,a5,2
	slli	a5,a5,2
	sd	a5,-128(s0)
	sw	zero,-68(s0)
	j	.L2
.L3:
	lw	a5,-140(s0)
	mv	a4,a5
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	slli	a5,a5,2
	ld	a4,-136(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	ld	a3,-112(s0)
	lw	a5,-68(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-68(s0)
	addiw	a5,a5,1
	sw	a5,-68(s0)
.L2:
	lw	a5,-68(s0)
	mv	a4,a5
	lw	a5,-88(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L3
	sw	zero,-72(s0)
	j	.L4
.L5:
	lw	a5,-144(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	lw	a4,-72(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	slli	a5,a5,2
	ld	a4,-136(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	ld	a3,-128(s0)
	lw	a5,-72(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-72(s0)
	addiw	a5,a5,1
	sw	a5,-72(s0)
.L4:
	lw	a5,-72(s0)
	mv	a4,a5
	lw	a5,-92(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L5
	sw	zero,-76(s0)
	sw	zero,-80(s0)
	lw	a5,-140(s0)
	sw	a5,-84(s0)
	j	.L6
.L10:
	ld	a4,-112(s0)
	lw	a5,-76(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	ld	a3,-128(s0)
	lw	a5,-80(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	bgt	a4,a5,.L7
	lw	a5,-84(s0)
	slli	a5,a5,2
	ld	a4,-136(s0)
	add	a5,a4,a5
	ld	a3,-112(s0)
	lw	a4,-76(s0)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-76(s0)
	addiw	a5,a5,1
	sw	a5,-76(s0)
	j	.L8
.L7:
	lw	a5,-84(s0)
	slli	a5,a5,2
	ld	a4,-136(s0)
	add	a5,a4,a5
	ld	a3,-128(s0)
	lw	a4,-80(s0)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-80(s0)
	addiw	a5,a5,1
	sw	a5,-80(s0)
.L8:
	lw	a5,-84(s0)
	addiw	a5,a5,1
	sw	a5,-84(s0)
.L6:
	lw	a5,-76(s0)
	mv	a4,a5
	lw	a5,-88(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L11
	lw	a5,-80(s0)
	mv	a4,a5
	lw	a5,-92(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L10
	j	.L11
.L12:
	lw	a5,-84(s0)
	slli	a5,a5,2
	ld	a4,-136(s0)
	add	a5,a4,a5
	ld	a3,-112(s0)
	lw	a4,-76(s0)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-76(s0)
	addiw	a5,a5,1
	sw	a5,-76(s0)
	lw	a5,-84(s0)
	addiw	a5,a5,1
	sw	a5,-84(s0)
.L11:
	lw	a5,-76(s0)
	mv	a4,a5
	lw	a5,-88(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L12
	j	.L13
.L14:
	lw	a5,-84(s0)
	slli	a5,a5,2
	ld	a4,-136(s0)
	add	a5,a4,a5
	ld	a3,-128(s0)
	lw	a4,-80(s0)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-80(s0)
	addiw	a5,a5,1
	sw	a5,-80(s0)
	lw	a5,-84(s0)
	addiw	a5,a5,1
	sw	a5,-84(s0)
.L13:
	lw	a5,-80(s0)
	mv	a4,a5
	lw	a5,-92(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L14
	mv	sp,a1
	nop
	addi	sp,s0,-160
	.cfi_def_cfa 2, 160
	ld	ra,152(sp)
	.cfi_restore 1
	ld	s0,144(sp)
	.cfi_restore 8
	ld	s2,136(sp)
	.cfi_restore 18
	ld	s3,128(sp)
	.cfi_restore 19
	ld	s4,120(sp)
	.cfi_restore 20
	ld	s5,112(sp)
	.cfi_restore 21
	ld	s6,104(sp)
	.cfi_restore 22
	ld	s7,96(sp)
	.cfi_restore 23
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	merge, .-merge
	.align	1
	.globl	mergeSort
	.type	mergeSort, @function
mergeSort:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	mv	a5,a1
	mv	a4,a2
	sw	a5,-44(s0)
	mv	a5,a4
	sw	a5,-48(s0)
	lw	a5,-44(s0)
	mv	a4,a5
	lw	a5,-48(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L17
	lw	a5,-48(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	srliw	a4,a5,31
	addw	a5,a4,a5
	sraiw	a5,a5,1
	sext.w	a5,a5
	lw	a4,-44(s0)
	addw	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-44(s0)
	mv	a2,a4
	mv	a1,a5
	ld	a0,-40(s0)
	call	mergeSort
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	lw	a4,-48(s0)
	mv	a2,a4
	mv	a1,a5
	ld	a0,-40(s0)
	call	mergeSort
	lw	a3,-48(s0)
	lw	a4,-20(s0)
	lw	a5,-44(s0)
	mv	a2,a4
	mv	a1,a5
	ld	a0,-40(s0)
	call	merge
.L17:
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	mergeSort, .-mergeSort
	.section	.rodata
	.align	3
.LC0:
	.string	"%d "
	.text
	.align	1
	.globl	printArray
	.type	printArray, @function
printArray:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	mv	a5,a1
	sw	a5,-44(s0)
	sw	zero,-20(s0)
	j	.L19
.L20:
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L19:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L20
	li	a0,10
	call	putchar
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	printArray, .-printArray
	.section	.rodata
	.align	3
.LC1:
	.string	"Enter the number of elements: "
	.align	3
.LC2:
	.string	"%d"
	.align	3
.LC3:
	.string	"Enter the elements: "
	.align	3
.LC4:
	.string	"Original array: "
	.align	3
.LC5:
	.string	"Sorted array: "
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	s5,72(sp)
	sd	s6,64(sp)
	sd	s7,56(sp)
	sd	s8,48(sp)
	sd	s9,40(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	addi	s0,sp,128
	.cfi_def_cfa 8, 0
	mv	a5,sp
	mv	s1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	addi	a5,s0,-124
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	__isoc99_scanf
	lw	a5,-124(s0)
	mv	a4,a5
	addi	a4,a4,-1
	sd	a4,-112(s0)
	mv	a4,a5
	mv	s8,a4
	li	s9,0
	srli	a4,s8,59
	slli	s5,s9,5
	or	s5,a4,s5
	slli	s4,s8,5
	mv	a4,a5
	mv	s6,a4
	li	s7,0
	srli	a4,s6,59
	slli	s3,s7,5
	or	s3,a4,s3
	slli	s2,s6,5
	slli	a5,a5,2
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	mv	a5,sp
	addi	a5,a5,3
	srli	a5,a5,2
	slli	a5,a5,2
	sd	a5,-120(s0)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	sw	zero,-100(s0)
	j	.L22
.L23:
	lw	a5,-100(s0)
	slli	a5,a5,2
	ld	a4,-120(s0)
	add	a5,a4,a5
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	__isoc99_scanf
	lw	a5,-100(s0)
	addiw	a5,a5,1
	sw	a5,-100(s0)
.L22:
	lw	a5,-124(s0)
	lw	a4,-100(s0)
	sext.w	a4,a4
	blt	a4,a5,.L23
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	lw	a5,-124(s0)
	mv	a1,a5
	ld	a0,-120(s0)
	call	printArray
	lw	a5,-124(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	mv	a2,a5
	li	a1,0
	ld	a0,-120(s0)
	call	mergeSort
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	printf
	lw	a5,-124(s0)
	mv	a1,a5
	ld	a0,-120(s0)
	call	printArray
	li	a5,0
	mv	sp,s1
	mv	a0,a5
	addi	sp,s0,-128
	.cfi_def_cfa 2, 128
	ld	ra,120(sp)
	.cfi_restore 1
	ld	s0,112(sp)
	.cfi_restore 8
	ld	s1,104(sp)
	.cfi_restore 9
	ld	s2,96(sp)
	.cfi_restore 18
	ld	s3,88(sp)
	.cfi_restore 19
	ld	s4,80(sp)
	.cfi_restore 20
	ld	s5,72(sp)
	.cfi_restore 21
	ld	s6,64(sp)
	.cfi_restore 22
	ld	s7,56(sp)
	.cfi_restore 23
	ld	s8,48(sp)
	.cfi_restore 24
	ld	s9,40(sp)
	.cfi_restore 25
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
