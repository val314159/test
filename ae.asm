	global _main
	extern _initscr, _endwin, _getch, _addstr
	extern _noecho, _raw, _nonl
	extern _exit, _malloc, _bzero
	extern _atoi, _printf, _printw
	default rel
	section .text
init:
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

	call	_initscr
	
	mov	[scr], rax
	call	_noecho
	
	call	_raw
	
	call	_nonl

	lea	rdi,	[hello]
	call	_addstr

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
break:
	push	rbp
	call	_endwin
	lea	rdi,	[goodbye]
	mov	rax,	0
	call	_printf
	mov	rdi,	0
	call	_exit
process:
	push	rbp
	mov	rbp,	rsp
	sub	sp, 16

	mov	rdx,	[c]
	mov	rsi,	[c]
	lea	rdi,	[fmt]
	mov	ax,	0
	call	_printw

	add	sp,	16
	pop	rbp
	ret

_main:
	push	rbp
	mov	rbp,	rsp

	call	init
loop:
	call	_getch
	mov	[c],	rax

	mov	rdi,	rax
	call	process

	cmp	[c],	byte 113
	je	done

	cmp	[c],	byte 65
	jne	loop
done:
	call	break

	section  .data
scr:	dq      0
c:	dq      0
count:	dq      0
sum:	dq      0
hello:	db	">> Hello!", 10, 0
goodbye:db	">> Goodbye!", 10, 0
format: db      "%g", 10, 0
fmt:	db      "{%d/%c}", 0
error:	db      "There are no command line"
	db " arguments to average", 10, 0
