.PHONY: all upx test testsoft test60 dbg clean

name = game
SHELL := /bin/bash

all:
	gcc main.c -Ofast -lSDL2 -lGLESv2 -lEGL -lm -o $(name)_linux
	strip --strip-unneeded $(name)_linux

upx:
	upx --lzma --best $(name)_linux

test:
	gcc main.c -Ofast -lSDL2 -lGLESv2 -lEGL -lm -o /tmp/$(name)_test
	/tmp/$(name)_test
	rm /tmp/$(name)_test

testsoft:
	gcc main.c -Ofast -lSDL2 -lGLESv2 -lEGL -lm -o /tmp/$(name)_test
	LIBGL_ALWAYS_SOFTWARE=1 /tmp/$(name)_test
	rm /tmp/$(name)_test

test60:
	gcc main.c -Ofast -lSDL2 -lGLESv2 -lEGL -lm -o /tmp/$(name)_test
	xrandr --rate 60 && /tmp/$(name)_test && xrandr --rate 165
	rm /tmp/$(name)_test

dbg:
	gcc main.c -fsanitize=leak -fsanitize=undefined -fsanitize=address -ggdb3 -lSDL2 -lGLESv2 -lEGL -lm -o $(name)_dbg
	$(name)_dbg

clean:
	rm -f $(name)_linux