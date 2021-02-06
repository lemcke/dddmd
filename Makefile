TARGET := dddmd

# compiler options ----------------------------------------------------------- #

CC       := gcc
CSTD     := -std=c99
CFLAGS   := -Wall -pedantic
OPTIMIZE := -O0
LINKER   := -lm

# paths ---------------------------------------------------------------------- #

# general
BIN_DIR := ./bin
OBJ_DIR := ./obj
SRC_DIR := ./src

# source files
SRC_FILE_PATHS := $(shell find $(SRC_DIR) -type f -regex .*\.c)

# object files
# (Does `patsubst` have any advantages in this case?)
OBJ_FILE_PATHS := $(subst $(SRC_DIR),$(OBJ_DIR),$(SRC_FILE_PATHS:.c=.o))

# recipes -------------------------------------------------------------------- #

$(BIN_DIR)/$(TARGET): $(OBJ_FILE_PATHS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CSTD) $(CFLAGS) $(OPTIMIZE) -o $@ $^ $(LINKER)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CSTD) $(CFLAGS) $(OPTIMIZE) -c $^
	@mkdir -p $(OBJ_DIR)
	@mv *.o $(OBJ_DIR)

# make commands -------------------------------------------------------------- #

.PHONY: run
run:
	@$(BIN_DIR)/$(TARGET)

# Simply print this Makefile's variables by calling `make debug`.
.PHONY: debug
debug:
	@echo "SRC_FILE_PATHS: $(SRC_FILE_PATHS)"
	@echo "OBJ_FILE_PATHS: $(OBJ_FILE_PATHS)"

# Remove ./bin and ./obj directories
.PHONY: clean
clean:
	@rm -r $(BIN_DIR)
	@rm -r $(OBJ_DIR)