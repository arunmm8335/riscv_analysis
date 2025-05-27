	.file	"binarysearch.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	binarySearch
	.type	binarySearch, @function
binarySearch:
.LFB0:
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
	sw	zero,-20(s0)
	lw	a5,-44(s0)
	addiw	a5,a5,-1
	sw	a5,-24(s0)
	j	.L2
.L6:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-20(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	srliw	a4,a5,31
	addw	a5,a4,a5
	sraiw	a5,a5,1
	sext.w	a5,a5
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-48(s0)
	sext.w	a4,a4
	bne	a4,a5,.L3
	lw	a5,-28(s0)
	j	.L4
.L3:
	lw	a5,-28(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-48(s0)
	sext.w	a4,a4
	ble	a4,a5,.L5
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	j	.L2
.L5:
	lw	a5,-28(s0)
	addiw	a5,a5,-1
	sw	a5,-24(s0)
.L2:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	ble	a4,a5,.L6
	li	a5,-1
.L4:
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	binarySearch, .-binarySearch
	.section	.rodata
	.align	3
.LC0:
	.string	"%d "
	.text
	.align	1
	.globl	printArray
	.type	printArray, @function
printArray:
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
	sw	a5,-44(s0)
	sw	zero,-20(s0)
	j	.L8
.L9:
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
.L8:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L9
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
.LFE1:
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
	.string	"Enter the elements in sorted order: "
	.align	3
.LC4:
	.string	"Enter the target element to search: "
	.align	3
.LC5:
	.string	"Element %d found at index %d.\n"
	.align	3
.LC6:
	.string	"Element %d not found in the array.\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-144
	.cfi_def_cfa_offset 144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	sd	s4,96(sp)
	sd	s5,88(sp)
	sd	s6,80(sp)
	sd	s7,72(sp)
	sd	s8,64(sp)
	sd	s9,56(sp)
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
	addi	s0,sp,144
	.cfi_def_cfa 8, 0
	mv	a5,sp
	mv	s1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	addi	a5,s0,-128
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	__isoc99_scanf
	lw	a5,-128(s0)
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
	j	.L11
.L12:
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
.L11:
	lw	a5,-128(s0)
	lw	a4,-100(s0)
	sext.w	a4,a4
	blt	a4,a5,.L12
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	addi	a5,s0,-132
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	__isoc99_scanf
	lw	a5,-128(s0)
	lw	a4,-132(s0)
	mv	a2,a4
	mv	a1,a5
	ld	a0,-120(s0)
	call	binarySearch
	mv	a5,a0
	sw	a5,-124(s0)
	lw	a5,-124(s0)
	sext.w	a4,a5
	li	a5,-1
	beq	a4,a5,.L13
	lw	a5,-132(s0)
	lw	a4,-124(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	printf
	j	.L14
.L13:
	lw	a5,-132(s0)
	mv	a1,a5
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
.L14:
	li	a5,0
	mv	sp,s1
	mv	a0,a5
	addi	sp,s0,-144
	.cfi_def_cfa 2, 144
	ld	ra,136(sp)
	.cfi_restore 1
	ld	s0,128(sp)
	.cfi_restore 8
	ld	s1,120(sp)
	.cfi_restore 9
	ld	s2,112(sp)
	.cfi_restore 18
	ld	s3,104(sp)
	.cfi_restore 19
	ld	s4,96(sp)
	.cfi_restore 20
	ld	s5,88(sp)
	.cfi_restore 21
	ld	s6,80(sp)
	.cfi_restore 22
	ld	s7,72(sp)
	.cfi_restore 23
	ld	s8,64(sp)
	.cfi_restore 24
	ld	s9,56(sp)
	.cfi_restore 25
	addi	sp,sp,144
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
