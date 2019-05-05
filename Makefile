# Makefile for UD CISC user-level thread library

CC = gcc
CFLAGS = -g

LIBOBJS = t_lib.o 

TSTOBJS = test01x.o test01.0 test03.o philosophers.o 3test.o test05.o test06.o test08.o test09.o test11.o

# specify the executable 

EXECS = test01x test01 test03 philosophers 3test test05 test06 test08 test09 test11

# specify the source files

LIBSRCS = t_lib.c

TSTSRCS = test01x.c test01.c test03.c philosophers.c 3test.c test05.c test08.c test06.c test09.c test11.c

# ar creates the static thread library

t_lib.a: ${LIBOBJS} Makefile
	ar rcs t_lib.a ${LIBOBJS}

# here, we specify how each file should be compiled, what
# files they depend on, etc.

t_lib.o: t_lib.c t_lib.h Makefile
	${CC} ${CFLAGS} -c t_lib.c

test01.o: test01.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01.c
	
test01: test01.o t_lib.a Makefile
	${CC} ${CFLAGS} test01.o t_lib.a -o test01

test01x.o: test01x.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test01x.c

test01x: test01x.o t_lib.a Makefile
	${CC} ${CFLAGS} test01x.o t_lib.a -o test01x
	
test03.o: test03.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c test03.c
	
test03: test03.o t_lib.a Makefile
	${CC} ${CFLAGS} test03.o t_lib.a -o test03

test05: test05.o t_lib.a Makefile
	${CC} ${CFLAGS} test05.o t_lib.a -o test05
	
test06: test06.o t_lib.a Makefile
	${CC} ${CFLAGS} test06.o t_lib.a -o test06

test08: test08.o t_lib.a Makefile
	${CC} ${CFLAGS} test08.o t_lib.a -o test08

test09: test09.o t_lib.a Makefile
	${CC} ${CFLAGS} test09.o t_lib.a -o test09

test11: test11.o t_lib.a Makefile
	${CC} ${CFLAGS} test11.o t_lib.a -o test11

philosophers.o: philosophers.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c philosophers.c
	
philosophers: philosophers.o t_lib.a Makefile
	${CC} ${CFLAGS} philosophers.o t_lib.a -o philosophers
	
3test.o: 3test.c ud_thread.h Makefile
	${CC} ${CFLAGS} -c 3test.c
	
3test: 3test.o t_lib.a Makefile
	${CC} ${CFLAGS} 3test.o t_lib.a -o 3test

clean:
	rm -f t_lib.a ${EXECS} ${LIBOBJS} ${TSTOBJS} 
