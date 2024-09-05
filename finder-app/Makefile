CC = $(CROSS_COMPILE)gcc
CFLAGS = -Wall -g
RM     = rm -f

all: writer

writer: writer.o
	$(CC) writer.o -o writer

writer.o: writer.c
	$(CC) $(CFLAGS) -c writer.c -o writer.o

clean:
	$(RM) *.o writer *.txt