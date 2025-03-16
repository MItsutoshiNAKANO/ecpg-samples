#! /usr/bin/make -f

##
# @file
# @brief Makefile.
# @copyright
#   (C) 2025 Mitsutoshi Nakano <ItSANgo@gmail.com>
#   SPDX-License-Identifier: GPL-3.0-or-later

TARGETS=too_many_match loop_prepare prepared

too_many_match_ECPG_SRCS=too_many_match.pgc sql_error.pgc
too_many_match_C_SRCS=error.c
too_many_match_HEADERS=sql_error.h error.h
too_many_match_OBJS=$(too_many_match_ECPG_SRCS:.pgc=.o)\
	$(too_many_match_C_SRCS:.c=.o)
too_many_match_CS=$(too_many_match_ECPG_SRCS:.pgc=.c)

loop_prepare_ECPG_SRCS=loop_prepare.pgc sql_error.pgc
loop_prepare_C_SRCS=error.c
loop_prepare_HEADERS=sql_error.h error.h
loop_prepare_OBJS=$(loop_prepare_ECPG_SRCS:.pgc=.o) $(loop_prepare_C_SRCS:.c=.o)
loop_prepare_CS=$(loop_prepare_ECPG_SRCS:.pgc=.c)

prepared_ECPG_SRCS=prepared.pgc sql_error.pgc
prepared_C_SRCS=debug.c error.c
prepared_HEADERS=sql_error.h debug.h error.h
prepared_OBJS=$(prepared_ECPG_SRCS:.pgc=.o) $(prepared_C_SRCS:.c=.o)
prepared_CS=$(prepared_ECPG_SRCS:.pgc=.c)

ECPG=ecpg
CC=gcc-14
CFLAGS=-Wall -Wextra -Werror -std=gnu23 -Wpedantic -g -I/usr/include/postgresql
LIBS=-lecpg -lpq
FORMAT=clang-format -i

.PHONY: all gprof format check clean
.SUFFIXES: .o .c .pgc .h

all: $(TARGETS)
gprof: $(TARGETS)
gprof: CFLAGS+=-pg -O0
too_many_match: $(too_many_match_OBJS)
	$(CC) -o too_many_match $(too_many_match_OBJS) $(LIBS)
loop_prepare: $(loop_prepare_OBJS)
	$(CC) -o loop_prepare $(loop_prepare_OBJS) $(LIBS)
prepared: $(prepared_OBJS)
	$(CC) -o prepared $(prepared_OBJS) $(LIBS)
$(too_many_match_OBJS): $(too_many_match_HEADERS)
$(loop_prepare_OBJS): $(loop_prepare_HEADERS)
$(prepared_OBJS): $(prepared_HEADERS)
too_many_match.c: too_many_match.pgc
loop_prepare.c: loop_prepare.pgc
sql_error.c: sql_error.pgc
%.c: %.pgc
	$(ECPG) -o $@ $<
format:
	$(FORMAT) $(FORMAT_FLAGS) $(too_many_match_ECPG_SRCS)\
		$(too_many_match_C_SRCS) $(loop_prepare_ECPG_SRCS)\
		$(prepared_ECPG_SRCS) $(prepared_C_SRCS) $(prepared_HEADERS)
clean:
	$(RM) $(TARGETS) $(too_many_match_OBJS) $(too_many_match_CS)\
		$(loop_prepare_OBJS) $(loop_prepare_CS) $(prepared_OBJS) $(prepared_CS)
