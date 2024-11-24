#! /usr/bin/make -f

##
# @file
# @brief Makefile.

TARGETS=prepared
prepared_SRCS=prepared.pgc
prepared_CS=$(prepared_SRCS:.pgc=.c)
prepared_OBJS=$(prepared_SRCS:.pgc=.o)
ECPG=ecpg
CC=gcc-14
CFLAGS=-Wall -Wextra -Werror -std=gnu23 -pedantic -I/usr/include/postgresql
LIBS=-lecpg -lpq

.PHONY: all gprof check clean
.SUFFIXES: .o .c .pgc

all: $(TARGETS)
gprof: $(TARGETS)
gprof: CFLAGS+=-pg -g -O0
prepared: $(prepared_OBJS)
	$(CC) -o prepared $(prepared_OBJS) $(LIBS)
clean:
	$(RM) $(TARGETS) $(prepared_OBJS) $(prepared_CS)
%.c: %.pgc
	$(ECPG) -o $@ $^
