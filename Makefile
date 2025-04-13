#! /usr/bin/make -f

##
# @file
# @brief Makefile.
# @copyright
#   (C) 2025 Mitsutoshi Nakano <ItSANgo@gmail.com>
#   SPDX-License-Identifier: Apache-2.0

TARGETS=too_many_match loop_prepare prepared

too_many_match_ECPG_SRCS=too_many_match.pgc sql_error.pgc
too_many_match_C_SRCS=error.c
too_many_match_OBJS=$(too_many_match_ECPG_SRCS:.pgc=.o)\
	$(too_many_match_C_SRCS:.c=.o)
too_many_match_CS=$(too_many_match_ECPG_SRCS:.pgc=.c)

loop_prepare_ECPG_SRCS=loop_prepare.pgc sql_error.pgc
loop_prepare_C_SRCS=error.c
loop_prepare_OBJS=$(loop_prepare_ECPG_SRCS:.pgc=.o) $(loop_prepare_C_SRCS:.c=.o)
loop_prepare_CS=$(loop_prepare_ECPG_SRCS:.pgc=.c)

prepared_ECPG_SRCS=prepared.pgc sql_error.pgc
prepared_C_SRCS=debug.c error.c
prepared_OBJS=$(prepared_ECPG_SRCS:.pgc=.o) $(prepared_C_SRCS:.c=.o)
prepared_CS=$(prepared_ECPG_SRCS:.pgc=.c)

SRCS=$(too_many_match_ECPG_SRCS) $(too_many_match_C_SRCS)\
	$(loop_prepare_ECPG_SRCS) $(loop_prepare_C_SRCS)\
	$(prepared_ECPG_SRCS) $(prepared_C_SRCS)
HEADERS=sql_error.h debug.h error.h
CS=$(too_many_match_CS) $(loop_prepare_CS) $(prepared_CS)
OBJS=$(too_many_match_OBJS) $(loop_prepare_OBJS) $(prepared_OBJS)
DEPS=$(OBJS:.o=.d)

ECPG=ecpg
CC=gcc-14
CPPFLAGS=-I/usr/include/postgresql
CFLAGS=-Wall -Wextra -Werror -std=gnu23 -Wpedantic -g
LDLIBS=-lecpg
FORMAT=clang-format -i

.PHONY: all gprof format check clean

all: $(TARGETS)
gprof: $(TARGETS)
gprof: CFLAGS+=-pg -O0
too_many_match: $(too_many_match_OBJS)
loop_prepare: $(loop_prepare_OBJS)
prepared: $(prepared_OBJS)
%.d: %.c
	$(CC) -MM $(CPPFLAGS) -o $@ $<
%.c: %.pgc
	$(ECPG) -o $@ $<
format:
	$(FORMAT) $(FORMAT_FLAGS) $(SRCS) $(HEADERS)
clean:
	$(RM) $(TARGETS) $(OBJS) $(DEPS) $(CS)
-include $(DEPS)
