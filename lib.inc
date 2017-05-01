%define A7  [rbp+9*8]
%define A6  [rbp+8*8]
%define OIP [rbp+7*8]
%define OBP [rbp+6*8]
%define A5  [rbp+5*8]
%define A4  [rbp+4*8]
%define A3  [rbp+3*8]
%define A2  [rbp+2*8]
%define A1  [rbp+1*8]
%define A0  [rbp-0*8]
%define L1  [rbp-1*8]
%define L2  [rbp-2*8]
%define L3  [rbp-3*8]
%define L4  [rbp-4*8]
%define L5  [rbp-5*8]
%define L6  [rbp-6*8]
%define L7  [rbp-7*8]
%define L8  [rbp-8*8]
%define L9  [rbp-9*8]

%macro callf 1
	xor	rax,	rax
	call %1
%endmacro
	
%macro cmp2 4
	cmp	%1,	%2
	%3	%4
%endmacro
	
%macro startx 1
	push	rbp
	push	r9
	push	r8
	push	rcx
	push	rdx
	push	rsi
	push	rdi
	mov	rbp,	rsp
	sub	rsp,	%1
%endmacro
	
%macro finishx 0
	mov	rsp,	rbp
	add	rsp,	6*8
	pop	rbp
	ret
%endmacro

default rel
	
section .text
global _main
