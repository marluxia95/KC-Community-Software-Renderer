FW_SRCS = pkb.c sys.c wvid.c xvid.c
FW_OBJS = $(addprefix ../$(BIN_DIR)/,$(FW_SRCS:.c=.o))
FW_LIB = ../$(BIN_DIR)/libfw.a
DO_CC = $(CC) -c $< $(EXTRA_FLAGS) $(INCLUDE_FLAGS) $(CFLAGS) -o $@

$(FW_LIB): $(FW_OBJS)
	$(AR) rcs $@ $(FW_OBJS)

../$(BIN_DIR)/%.o: %.c
	$(DO_CC)

.PHONY: fw clean dist

fw: $(FW_LIB)

clean: dist
	rm $(FW_LIB) 2> /dev/null || true

dist:
	rm $(FW_OBJS) 2> /dev/null || true

