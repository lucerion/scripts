SCRIPT = add_path

include ../Makefile

export SHELL_CONFIG = ${HOME}/.shrc.local

setup:
	if [ ! -f $(SHELL_CONFIG) ]; then echo "# vi: filetype=sh\n" >> $(SHELL_CONFIG); fi
	../export_var SHELL_CONFIG $(SHELL_CONFIG)
	# add local bin dir (~/.local/bin)
	$(CURRENT_SCRIPT) $(BIN_DIR)
	# add user node_modules bin dir
	$(CURRENT_SCRIPT) ~/node_modules/.bin
