	.file	"dfs.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	graph
	.bss
	.align	3
	.type	graph, @object
	.size	graph, 40000
graph:
	.zero	40000
	.globl	visited
	.align	3
	.type	visited, @object
	.size	visited, 400
visited:
	.zero	400
	.globl	nodes
	.section	.sbss,"aw",@nobits
	.align	2
	.type	nodes, @object
	.size	nodes, 4
nodes:
	.zero	4
	.section	.rodata
	.align	3
.LC0:
	.string	"%d "
	.text
	.align	1
	.globl	dfs
	.type	dfs, @function
dfs:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	lui	a5,%hi(visited)
	addi	a4,a5,%lo(visited)
	lw	a5,-36(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	li	a4,1
	sw	a4,0(a5)
	sw	zero,-20(s0)
	j	.L2
.L4:
	lui	a5,%hi(graph)
	addi	a4,a5,%lo(graph)
	lw	a5,-20(s0)
	lw	a2,-36(s0)
	li	a3,100
	mul	a3,a2,a3
	add	a5,a3,a5
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	li	a5,1
	bne	a4,a5,.L3
	lui	a5,%hi(visited)
	addi	a4,a5,%lo(visited)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	bne	a5,zero,.L3
	lw	a5,-20(s0)
	mv	a0,a5
	call	dfs
.L3:
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lui	a5,%hi(nodes)
	lw	a5,%lo(nodes)(a5)
	lw	a4,-20(s0)
	sext.w	a4,a4
	blt	a4,a5,.L4
	nop
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	dfs, .-dfs
	.section	.rodata
	.align	3
.LC1:
	.string	"Enter number of nodes: "
	.align	3
.LC2:
	.string	"%d"
	.align	3
.LC3:
	.string	"Enter number of edges: "
	.align	3
.LC4:
	.string	"Enter the edges (u v):"
	.align	3
.LC5:
	.string	"%d %d"
	.align	3
.LC6:
	.string	"Enter starting node: "
	.align	3
.LC7:
	.string	"DFS Traversal starting from node %d: "
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	lui	a5,%hi(nodes)
	addi	a1,a5,%lo(nodes)
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	scanf
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	addi	a5,s0,-32
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	scanf
	sw	zero,-20(s0)
	j	.L6
.L9:
	sw	zero,-24(s0)
	j	.L7
.L8:
	lui	a5,%hi(graph)
	addi	a4,a5,%lo(graph)
	lw	a5,-24(s0)
	lw	a2,-20(s0)
	li	a3,100
	mul	a3,a2,a3
	add	a5,a3,a5
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,0(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L7:
	lui	a5,%hi(nodes)
	lw	a5,%lo(nodes)(a5)
	lw	a4,-24(s0)
	sext.w	a4,a4
	blt	a4,a5,.L8
	lui	a5,%hi(visited)
	addi	a4,a5,%lo(visited)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L6:
	lui	a5,%hi(nodes)
	lw	a5,%lo(nodes)(a5)
	lw	a4,-20(s0)
	sext.w	a4,a4
	blt	a4,a5,.L9
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	sw	zero,-28(s0)
	j	.L10
.L11:
	addi	a4,s0,-40
	addi	a5,s0,-36
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	scanf
	lw	a2,-36(s0)
	lw	a5,-40(s0)
	lui	a4,%hi(graph)
	addi	a4,a4,%lo(graph)
	li	a3,100
	mul	a3,a2,a3
	add	a5,a3,a5
	slli	a5,a5,2
	add	a5,a4,a5
	li	a4,1
	sw	a4,0(a5)
	lw	a2,-40(s0)
	lw	a5,-36(s0)
	lui	a4,%hi(graph)
	addi	a4,a4,%lo(graph)
	li	a3,100
	mul	a3,a2,a3
	add	a5,a3,a5
	slli	a5,a5,2
	add	a5,a4,a5
	li	a4,1
	sw	a4,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L10:
	lw	a5,-32(s0)
	lw	a4,-28(s0)
	sext.w	a4,a4
	blt	a4,a5,.L11
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	addi	a5,s0,-44
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	scanf
	lw	a5,-44(s0)
	mv	a1,a5
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf
	lw	a5,-44(s0)
	mv	a0,a5
	call	dfs
	li	a0,10
	call	putchar
	li	a5,0
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
