# Generated automatically from Makefile.in by configure.
#
# Useful ./configure options with respect to this Makefile:
#
# --prefix=PREFIX
# --exec_prefix=EXEC_PREFIX
# --bindir=BINDIR
# --datadir=DATADIR
# --mandir=MANDIR
# --with-sharedir=SHAREDIR

prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
sharedir = ${prefix}/share/tworld
mandir = ${prefix}/man

CC = gcc

CFLAGS = -Wall -W -ggdb $(shell sdl-config --cflags) '-DROOTDIR="$(sharedir)"'
LDFLAGS = -Wall -W -ggdb
LOADLIBES = $(shell sdl-config --libs)

#
# End of configure section
#

OBJS = \
tworld.o series.o play.o solution.o res.o lxlogic.o mslogic.o help.o score.o \
random.o cmdline.o fileio.o err.o liboshw.a

RESOURCES = tworldres.o

#
# Binaries
#

tworld: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LOADLIBES)

tworld.exe: $(OBJS) $(RESOURCES)
	$(CC) $(LDFLAGS) -o $@ $^ $(LOADLIBES)

mklynxcc: mklynxcc.c
	$(CC) -Wall -W -O -o $@ $^

#
# Object files
#

tworld.o   : tworld.c defs.h gen.h err.h series.h res.h play.h score.h \
             solution.h fileio.h help.h oshw.h cmdline.h ver.h
series.o   : series.c series.h defs.h gen.h err.h fileio.h solution.h
play.o     : play.c play.h defs.h gen.h err.h state.h random.h oshw.h res.h \
             logic.h solution.h fileio.h
solution.o : solution.c solution.h defs.h gen.h err.h fileio.h
res.o      : res.c res.h defs.h gen.h fileio.h err.h oshw.h
lxlogic.o  : lxlogic.c logic.h defs.h gen.h err.h state.h random.h
mslogic.o  : mslogic.c logic.h defs.h gen.h err.h state.h random.h
help.o     : help.c help.h defs.h gen.h state.h oshw.h ver.h comptime.h
score.o    : score.c score.h defs.h gen.h err.h play.h
random.o   : random.c random.h defs.h gen.h
cmdline.o  : cmdline.c cmdline.h gen.h
fileio.o   : fileio.c fileio.h defs.h gen.h err.h
err.o      : err.c oshw.h err.h

#
# Generated files
#

comptime.h:
	echo \#define COMPILE_TIME \"`date '+%Y %b %e %T %Z'`\" > comptime.h

#
# Libraries
#

liboshw.a: oshw.h defs.h gen.h state.h err.h oshw/*.c oshw/*.h
	(cd oshw && make)

#
# Resources
#

tworldres.o: tworld.ico
	echo 1 ICON $^ | windres -o $@

#
# Other
#

install: tworld
	cp -i ./tworld $(bindir)/.
	mkdir -p $(sharedir)/sets
	mkdir -p $(sharedir)/data
	mkdir -p $(sharedir)/res
	mkdir -p $(mandir)/man6
	cp -i sets/*.dac $(sharedir)/sets/.
	cp -i data/*.dat $(sharedir)/data/.
	cp -i resources/rc $(sharedir)/res/.
	cp -i resources/*.bmp $(sharedir)/res/.
	cp -i resources/*.wav $(sharedir)/res/.
	cp -i docs/tworld.6 $(mandir)/man6/.

clean:
	rm -f $(OBJS) tworld mklynxcc comptime.h config.*
	rm -f tworldres.o tworld.exe mklynxcc.exe
	(cd oshw && make clean)

spotless:
	rm -f $(OBJS) tworld mklynxcc comptime.h config.* configure
	rm -f tworldres.o tworld.exe mklynxcc.exe
	(cd oshw && make spotless)
#	rm -f Makefile