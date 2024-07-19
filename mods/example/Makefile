EXAMPLE_SRCS = example.c
EXAMPLE_OBJS = $(addprefix ../../$(BIN_DIR)/,$(EXAMPLE_SRCS:.c=.o))
EXAMPLE_LIB = ../../$(BIN_DIR)/libkcmod_example.a
INCLUDE_FLAGS=$(addprefix -I../../,$(SUBDIRS))
DO_CC = $(CC) -c $< -DMA_SUBMODULE_NAME_=EXAMPLE $(INCLUDE_FLAGS) $(CFLAGS) -o $@


$(EXAMPLE_LIB): $(EXAMPLE_OBJS)
	$(AR) rcs $@ $(EXAMPLE_OBJS)

../../$(BIN_DIR)/%.o: %.c
	$(DO_CC)

.PHONY: example clean dist

example: $(EXAMPLE_LIB)

clean: dist
	@rm $(EXAMPLE_LIB) 2> /dev/null || true

dist:
	@rm $(EXAMPLE_OBJS) 2> /dev/null || true
