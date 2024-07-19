export CC = gcc
export AR = ar
export CFLAGS = -O3
export BIN_DIR = bin
#export EXTRA_FLAGS=

# add new targets here and below (optional)
export SUBDIRS = pl fw ma mods

# add new modules here
export MODULE_DIRS = example
export MODULE_LIST = EXAMPLE

MODULE_LIBS = $(addprefix -lkcmod_, $(MODULE_DIRS))

unexport INCLUDE_FLAGS = $(addprefix -I,$(SUBDIRS))
unexport DO_CC = $(CC) -c $< $(INCLUDE_FLAGS) $(CFLAGS) -o $@

export LIB_FLAGS = $(MODULE_LIBS) $(addprefix -l,$(SUBDIRS)) -lX11 -lXext

MAIN_EXEC = $(BIN_DIR)/main
MAIN_OBJ = $(BIN_DIR)/main.o
MAIN_DEPS = $(addsuffix .a,$(addprefix $(BIN_DIR)/lib,$(SUBDIRS)))

all: main $(SUBDIRS)

$(BIN_DIR):
	@echo "[make] making bin directory"
	@mkdir -p $@

$(MAIN_EXEC): $(MAIN_OBJ) $(MAIN_DEPS)
	$(CC) $(CFLAGS) $(EXTRA_FLAGS) $(MAIN_OBJ) -L$(BIN_DIR) $(LIB_FLAGS) -o $@

$(BIN_DIR)/%.o: %.c
	$(DO_CC)

$(BIN_DIR)/libfw.a: $(BIN_DIR) fw

$(BIN_DIR)/libma.a: $(BIN_DIR) ma

$(BIN_DIR)/libpl.a: $(BIN_DIR) pl

$(BIN_DIR)/libmods.a: $(BIN_DIR) mods

.PHONY: all $(SUBDIRS) main clean dist

fw: $(BIN_DIR)
	$(MAKE) -C $@

ma: $(BIN_DIR)
	$(MAKE) -C $@

pl: $(BIN_DIR)
	$(MAKE) -C $@

mods: $(BIN_DIR)
	$(MAKE) -C $@

main: $(MAIN_EXEC) $(BIN_DIR)

clean: dist
	@rm $(MAIN_EXEC) 2> /dev/null || true
	@for dir in $(SUBDIRS) ; do \
		$(MAKE) -C $$dir clean ; \
	done

dist:
	@rm $(BIN_DIR)/main.o 2> /dev/null || true
	@for dir in $(SUBDIRS) ; do \
		$(MAKE) -C $$dir dist ; \
	done




