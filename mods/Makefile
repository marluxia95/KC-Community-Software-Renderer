MODLOADER_SRCS = modloader.c
MODLOADER_OBJS = $(addprefix ../$(BIN_DIR)/,$(MODLOADER_SRCS:.c=.o))
MODLOADER_LIB = ../$(BIN_DIR)/libmods.a

INCLUDE_FLAGS=$(addprefix -I../,$(SUBDIRS))

DO_CC = $(CC) -c $< $(EXTRA_FLAGS) $(INCLUDE_FLAGS) $(CFLAGS) -o $@
MACRO_PREFIX = X(
MACRO_SUFFIX = _load_submodule)
MODULE_LIST_MACRO = $(addsuffix $(MACRO_SUFFIX),$(addprefix $(MACRO_PREFIX), $(MODULE_LIST)))

$(MODLOADER_LIB): $(MODLOADER_OBJS)
	$(AR) rcs $@ $(MODLOADER_OBJS)

../$(BIN_DIR)/%.o: %.c
	$(DO_CC)

modloader.c: modloader.c.in submodules
	sed 's/@KC_MODULE_LIST@/$(MODULE_LIST_MACRO)/g' $< > $@

.PHONY: mods submodules clean dist

submodules:
	@for module in $(MODULE_DIRS) ; do \
		$(MAKE) -C $$module ; \
	done

mods: $(MODLOADER_LIB)

clean: dist
	@rm $(MODLOADER_LIB) 2> /dev/null || true
	@for module in $(MODULE_DIRS) ; do \
		$(MAKE) -C $$module clean ; \
	done

dist:
	@rm $(MODLOADER_OBJS) 2> /dev/null || true
	@for module in $(MODULE_DIRS) ; do \
		$(MAKE) -C $$module clean ; \
	done
