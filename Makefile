#! /usr/bin/make -f

##
# @file
# @brief Makefile.
# @copyright
#   (C) 2024 Mitsutoshi Nakano <ItSANgo@gmail.com>
#   SPDX-License-Identifier: GPL-3.0-or-later

TARGETS=prepared
prepared_ECPG_SRCS=prepared.pgc sql_error.pgc
prepared_C_SRCS=debug.c error.c
prepared_HEADERS=sql_error.h debug.h error.h
prepared_OBJS=$(prepared_ECPG_SRCS:.pgc=.o) $(prepared_C_SRCS:.c=.o)
prepared_CS=$(prepared_ECPG_SRCS:.pgc=.c)

ECPG=ecpg
CC=gcc-14
CFLAGS=-Wall -Wextra -Werror -std=gnu23 -Wpedantic -I/usr/include/postgresql
LIBS=-lecpg -lpq
FORMAT=clang-format -i

.PHONY: all gprof format check clean
.SUFFIXES: .o .c .pgc .h

all: $(TARGETS)
gprof: $(TARGETS)
gprof: CFLAGS+=-pg -g -O0
prepared: $(prepared_OBJS)
	$(CC) -o prepared $(prepared_OBJS) $(LIBS)
$(prepared_OBJS): $(prepared_HEADERS)
%.c: %.pgc
	$(ECPG) -o $@ $<
format:
	$(FORMAT) $(FORMAT_FLAGS) $(prepared_ECPG_SRCS) $(prepared_C_SRCS)\
		$(prepared_HEADERS)
clean:
	$(RM) $(TARGETS) $(prepared_OBJS) $(prepared_CS)
