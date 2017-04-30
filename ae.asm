        global _main
	extern _initscr, _endwin, _getch, _addstr
	extern _noecho, _raw, _nonl
	extern _exit, _malloc, _bzero
	extern _atoi, _printf, _printw
        default  rel
        section  .text
init:
	push	rbp
	pop	rax
	pop	rbx
	push	r9
	push	r8
	push	rcx
	push	rdx
	push	rsi
	push	rdi
	push	rbx
	push	rax
	call	_initscr
	mov	[scr], rax
	call	_noecho
	call	_raw
	call	_nonl
	lea	rdi,	[hello]
	call	_addstr
	pop	rax
	pop	rbx
	pop	rdi
	pop	rsi
	pop	rdx
	pop	rcx
	pop	r8
	pop	r9
	push	rbx
	push	rax
	pop	rbp
	ret
break:
	push	rbp
	call	_endwin
	lea	rdi,	[goodbye]
	mov	rax, 0
	call	_printf
	mov	rdi, 0
	call	_exit
process:
	push	rbp
	mov	rbp,	rsp
	sub	sp, 16

	mov	rdx,	[c]
	mov	rsi,	[c]
	lea	rdi,	[fmt]
	mov	ax, 0
	call	_printw

	add	sp, 16
	pop	rbp
	ret

_main:
	push     rbp
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
scr:    dq      0
c:      dq      0
count:  dq      0
sum:    dq      0
hello:	db	">> Hello!", 10, 0
goodbye:db	">> Goodbye!", 10, 0
format: db      "%g", 10, 0
fmt: db      "{%d/%c}", 0
error:  db      "There are no command line"
	db " arguments to average", 10, 0
