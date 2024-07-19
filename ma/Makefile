MA_SRCS = bstrap.c ma.c
MA_OBJS = $(addprefix ../$(BIN_DIR)/,$(MA_SRCS:.c=.o))
MA_LIB = ../$(BIN_DIR)/libma.a
DO_CC = $(CC) -c $< $(EXTRA_FLAGS) $(INCLUDE_FLAGS) $(CFLAGS) -o $@

$(MA_LIB): $(MA_OBJS)
	$(AR) rcs $@ $(MA_OBJS)

../$(BIN_DIR)/%.o: %.c
	$(DO_CC)

.PHONY: ma clean dist

ma: $(MA_LIB)

clean: dist
	@rm $(MA_LIB) 2> /dev/null || true

dist:
	@rm $(MA_OBJS) 2> /dev/null || true
