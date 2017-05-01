%include "lib.inc"	

extern _initscr, _endwin, _getch, _addstr
extern _noecho, _raw, _nonl
extern _exit, _malloc, _bzero
extern _atoi, _printf, _printw

init:
	startx 2*8
	
	callf	_initscr
	
	mov	[scr], rax
	callf	_noecho
	
	callf	_raw
	
	callf	_nonl

	lea	rdi,	[hello]
	callf	_addstr

	finishx

break:
	startx 2*8

	callf	_endwin

	lea	rdi,	[goodbye]
	callf	_printf

	mov	rdi,	0
	callf	_exit

	finishx

process:
	startx 2*8

	mov	rdx,	[c]
	mov	rsi,	[c]
	lea	rdi,	[fmt]
	mov	ax,	0
	callf	_printw

	finishx

_main:
	startx 2*8

	callf	init
loop:
	callf	_getch
	mov	[c],	rax

	mov	rdi,	rax
	callf	process

	cmp2	[c], byte 113, je, done
	cmp2	[c], byte  65, je, done
	
	jmp	loop
done:
	callf	break
	finishx

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
	db	" arguments to average", 10, 0
