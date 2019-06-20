SCRIPT = add_path

include ../Makefile

CREATE_FILE = ${HOME}/.shrc.local

setup: create_file
	# add local bin dir (~/.local/bin)
	$(CURRENT_SCRIPT) $(BIN_DIR)
	# add user node_modules bin dir
	$(CURRENT_SCRIPT) ~/node_modules/.bin
