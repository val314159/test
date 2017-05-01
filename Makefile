LDLIBS=-lcurses
all: bins z.s runall
runall: rf ra ; ./ae
bins: average factorial ae
factorial: callfactorial.o
%.s: %.c	; gcc -masm=intel -S $< -o $@
ra: average	; ./average 54.3 -4 -3 -25 455.1111
rf: factorial	; ./factorial
%.o: %.asm lib.inc	; nasm -fmacho64 $<
clean:		; rm -fr average factorial ae *.o a.out *.s
docker:
	docker build . --tag nasm
	docker run --rm -it -v `pwd`:`pwd` -w `pwd` nasm
