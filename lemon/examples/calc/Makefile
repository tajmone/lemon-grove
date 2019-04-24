# The author of this program disclaims copyright.

SHELL := $(shell which bash)
APP_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CC := gcc

CFLAGS = -Wall -W -O2 -s -pipe
CLMFLAGS = -Wall -W -O2 -s -pipe -lm
LFLAGS =  -O2 -s -pipe

all: calc

lemon: ../../lemon.c
	$(CC) -o $@ $(LFLAGS) $<

calc.c: lemon calc.y ../../lempar.c
	./lemon -T../../lempar.c calc.y

calc: calc.c calc.h
	cat main.c >> calc.c
	$(CC) -o calc $(LFLAGS)  $<

test: calc
	./calc

clean:
	-rm -f *.out lemon calc calc.c calc.h
