TARGET := dddmd

# compiler options ----------------------------------------------------------- #

CC       := gcc
CSTD     := -std=c99
CFLAGS   := -Wall -Wextra -Wpedantic
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

# Link object files into main binary.
$(BIN_DIR)/$(TARGET): $(OBJ_FILE_PATHS)
	@echo "  linking ..."
	@mkdir -p $(BIN_DIR)
	@$(CC) $(CSTD) $(CFLAGS) $(OPTIMIZE) -o $@ $^ $(LINKER)

# Compile object files.
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@printf "  compiling %-20s => %s\n" "$<" "$@"
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CSTD) $(CFLAGS) $(OPTIMIZE) -o $@ -c $^

# make commands -------------------------------------------------------------- #

# Run the binary.
.PHONY: run
run:
	@$(BIN_DIR)/$(TARGET)

# Simply print this Makefile's variables by calling `make debug`.
.PHONY: debug
debug:
	@echo "SRC_FILE_PATHS: $(SRC_FILE_PATHS)"
	@echo "OBJ_FILE_PATHS: $(OBJ_FILE_PATHS)"

# Remove ./bin and ./obj directories.
.PHONY: clean
clean:
	@rm -r $(BIN_DIR)
	@rm -r $(OBJ_DIR)
