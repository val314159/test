
all: bins z.s runall

runall: rf ra

bins: average factorial

factorial  :depends-on callfactorial.o

z.s: z.c
	gcc -masm=intel -S $< -o $@

ra: average	; ./average 54.3 -4 -3 -25 455.1111

rf: factorial	; ./factorial

%.o: %.asm	; nasm -fmacho64 $<

clean:		; rm -fr average factorial *.o a.out *.s
