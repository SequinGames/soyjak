.PHONY: all install uninstall clean

name = soyjak

all:
	gcc ../main.c -I ../ -Ofast -lSDL2 -lGLESv2 -lEGL -lm -o $(name)

install:
	cp $(name) $(DESTDIR)

uninstall:
	rm $(DESTDIR)/$(name)

clean:
	rm $(name)
