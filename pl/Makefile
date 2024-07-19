PL_SRCS = clip.c gfx.c imode.c importer.c math.c pl.c
PL_OBJS = $(addprefix ../$(BIN_DIR)/,$(PL_SRCS:.c=.o))
PL_LIB = ../$(BIN_DIR)/libpl.a
DO_CC = $(CC) -c $< $(EXTRA_FLAGS) $(INCLUDE_FLAGS) $(CFLAGS) -o $@

$(PL_LIB): $(PL_OBJS)
	$(AR) rcs $@ $(PL_OBJS)

../$(BIN_DIR)/%.o: %.c
	$(DO_CC)

.PHONY: pl clean dist

pl: $(PL_LIB)

clean: dist
	@rm $(PL_LIB) 2> /dev/null || true

dist:
	@rm $(PL_OBJS) 2> /dev/null || true
