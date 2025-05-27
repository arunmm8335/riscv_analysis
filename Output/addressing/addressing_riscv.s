	.file	"addressing.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	globalArray
	.bss
	.align	3
	.type	globalArray, @object
	.size	globalArray, 400
globalArray:
	.zero	400
	.section	.rodata
	.align	3
.LC0:
	.string	"Immediate Sum: %d\n"
	.align	3
.LC1:
	.string	"Indirect Value: %d\n"
	.align	3
.LC2:
	.string	"Displaced Value: %d\n"
	.align	3
.LC3:
	.string	"Scaled Value: %d\n"
	.align	3
.LC4:
	.string	"Memory Indirect Value: %d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	li	a5,10
	sw	a5,-64(s0)
	li	a5,20
	sw	a5,-24(s0)
	li	a5,30
	sw	a5,-28(s0)
	addi	a5,s0,-64
	sd	a5,-72(s0)
	lw	a5,-64(s0)
	addiw	a5,a5,100
	sw	a5,-32(s0)
	ld	a5,-72(s0)
	lw	a5,0(a5)
	sw	a5,-36(s0)
	sw	zero,-20(s0)
	j	.L2
.L3:
	lw	a5,-20(s0)
	slliw	a5,a5,1
	sext.w	a4,a5
	lui	a5,%hi(globalArray)
	addi	a3,a5,%lo(globalArray)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,99
	ble	a4,a5,.L3
	lui	a5,%hi(globalArray)
	addi	a5,a5,%lo(globalArray)
	lw	a5,200(a5)
	sw	a5,-40(s0)
	li	a5,5
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	slliw	a5,a5,1
	sext.w	a5,a5
	lui	a4,%hi(globalArray)
	addi	a4,a4,%lo(globalArray)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-48(s0)
	addi	a5,s0,-72
	sd	a5,-56(s0)
	ld	a5,-56(s0)
	ld	a5,0(a5)
	lw	a5,0(a5)
	sw	a5,-60(s0)
	lw	a5,-32(s0)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	lw	a5,-36(s0)
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	lw	a5,-40(s0)
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	lw	a5,-48(s0)
	mv	a1,a5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	lw	a5,-60(s0)
	mv	a1,a5
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
