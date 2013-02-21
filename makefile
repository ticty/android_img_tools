#
# Makefile For Android img tools
# including:  mkbootfs mkbootimg unpackbootimg 
# suggestions please mail to dev.guofeng@gmail.com
#

TARGETS = mkbootfs mkbootimg unpackbootimg 


MKBOOTFS_SRCS = mkbootfs.c
MKBOOTFS_OBJS = $(patsubst %.c,%.o,$(MKBOOTFS_SRCS))

MKBOOTIMG_SRCS = mkbootimg.c \
                 mincrypt/sha.c
MKBOOTIMG_OBJS = $(patsubst %.c,%.o,$(MKBOOTIMG_SRCS))

UNPACKBOOTIMG_SRCS = unpackbootimg.c \
                     mincrypt/sha.c
UNPACKBOOTIMG_OBJS = $(patsubst %.c,%.o,$(UNPACKBOOTIMG_SRCS))


CC = gcc
CFLAGS = -Wall -W -O2
IDIR = -I.
RM = rm -f


all: $(TARGETS)

mkbootfs: $(MKBOOTFS_OBJS)
	$(CC) $(LFLAGS) -o "$@" $(MKBOOTFS_OBJS)
	@echo ""
	@echo "### Build $@ finish ###"
	@echo ""

mkbootimg: $(MKBOOTIMG_OBJS)
	$(CC) $(LFLAGS) -o "$@" $(MKBOOTIMG_OBJS)
	@echo ""
	@echo "### Build $@ finish ###"
	@echo ""

unpackbootimg: $(UNPACKBOOTIMG_OBJS)
	$(CC) $(LFLAGS) -o "$@" $(UNPACKBOOTIMG_OBJS)
	@echo ""
	@echo "### Build $@ finish ###"
	@echo ""

%.o: %.c
	$(CC) $(CFLAGS) $(IDIR) -c "$<" -o "$@"

clean:
	$(RM) $(MKBOOTFS_OBJS) $(MKBOOTIMG_OBJS) $(UNPACKBOOTIMG_OBJS) \
	$(TARGETS)

.PHONY: clean all

