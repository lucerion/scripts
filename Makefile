.DEFAULT_GOAL := install

BIN_DIR ?= ~/.local/bin
CONFIG_DIR ?= ~/.config
CURRENT_DIR = $(shell pwd)

ifndef SCRIPT
SCRIPT := $(shell read -p "Script: " SCRIPT_NAME; echo $$SCRIPT_NAME)
CURRENT_DIR = $(shell pwd)/$(SCRIPT)
endif

SCRIPT_CONF = $(SCRIPT).yml
CURRENT_SCRIPT = $(CURRENT_DIR)/$(SCRIPT)

install:
	../installer/installer $(CURRENT_SCRIPT) $(BIN_DIR)

uninstall:
	rm -i $(BIN_DIR)/$(SCRIPT)
	rm -ri $(BIN_DIR)/src/$(SCRIPT)

config:
	cp -i $(CURRENT_DIR)/$(SCRIPT_CONF) $(CONFIG_DIR)

purge: uninstall
	rm -i $(CONFIG_DIR)/$(SCRIPT_CONF)


create_file:
	if [ ! -f $(CREATE_FILE) ]; then echo "# vi: filetype=sh\n" >> $(CREATE_FILE); fi
