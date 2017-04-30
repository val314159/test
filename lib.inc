%define RV1 rax
%define RV2 rbx
%define RV3 rcx
%define RV4 rdx
%define A1 [rbp+0]
%define A2 [rbp+8]
%define A3 [rbp+16]
%define A4 [rbp+24]
%define A5 [rbp+32]
%define A6 [rbp+40]
%define XP [rbp+48]
%define YP [rbp+56]
%define A7 [rbp+64]
%define A8 [rbp+72]

%macro callf 1
	xor	rax,	rax
	call %1
%endmacro
	
%macro cmp2 4
	cmp	%1,	%2
	%3	%4
%endmacro
	
%macro start 1
	push	rbp

	pop	rax
	pop	rbx
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	r8
	push	r9
	push	rbx
	push	rax
%endmacro

%macro finish 1
	pop	rcx
	pop	rdx
	pop	r9
	pop	r8
	add	sp,	16
	pop	rsi
	pop	rdi
	push	rdx
	push	rcx

	pop	rbp
	ret
%endmacro

default rel
	
section .text
global _main
