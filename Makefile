#
# Makefile
# sabertazimi, 2016-11-13 17:29
#
#

OJNAME=uva
PROG=1593_alignment_of_code

CC=g++
CFLAGS=-g -Wall -Wextra
DEBUG=gdb
BREAK_LINE=66
RM=rm -fr

all:
	$(CC) -o $(OJNAME)/$(PROG).out $(CFLAGS) $(OJNAME)/$(PROG).cc

.PHONY=run clean debug

run:
	./$(OJNAME)/$(PROG).out

clean:
	$(foreach filename, $(shell find . -name "*~"), $(RM) $(filename);)
	$(foreach filename, $(shell find . -name "*.out"), $(RM) $(filename);)
	$(foreach filename, $(shell find . -name ".gdb_history"), $(RM) $(filename);)

debug:
	$(DEBUG) $(OJNAME)/$(PROG).out -q -ex "b $(OJNAME)/$(PROG).cc:$(BREAK_LINE)" -ex "r"

# vim:ft=make
#
