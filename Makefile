.DEFAULT_GOAL := install

BIN_DIR ?= ~/.local/bin
CONFIG_DIR ?= ~/.config
CURRENT_DIR = $(shell pwd)

ifndef SCRIPT
SCRIPT := $(shell read -p "Script: " SCRIPT_NAME; echo $$SCRIPT_NAME)
CURRENT_DIR = $(shell pwd)/$(SCRIPT)
endif

ifndef SCRIPT_CONF
SCRIPT_CONF = $(SCRIPT).yml
endif

install:
		mkdir -p $(BIN_DIR)
		cp $(CURRENT_DIR)/$(SCRIPT) $(BIN_DIR)
		chmod u+x $(BIN_DIR)/$(SCRIPT)

uninstall:
		rm -f $(BIN_DIR)/$(SCRIPT)

config:
		cp -i $(CURRENT_DIR)/$(SCRIPT_CONF) $(CONFIG_DIR)

purge: uninstall
		rm -i $(CONFIG_DIR)/$(SCRIPT_CONF)
