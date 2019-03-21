SCRIPT = add_path

include ../Makefile

BIN_PATH = $(BIN_DIR)/$(SCRIPT)

setup:
	# add local bin dir (~/.local/bin)
	$(BIN_PATH) $(BIN_DIR)
	# add rvm bin dir
	$(BIN_PATH) ~/.rvm/bin
	# add user node_modules bin dir
	$(BIN_PATH) ~/node_modules/.bin
