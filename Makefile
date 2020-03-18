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

build:
	[ -f $(CURRENT_SCRIPT).cr ] && crystal build $(CURRENT_SCRIPT).cr

install: build
	mkdir -p $(BIN_DIR)
	cp $(CURRENT_SCRIPT) $(BIN_DIR)
	[ -f $(CURRENT_SCRIPT).cr ] && rm $(CURRENT_SCRIPT)
	chmod u+x $(BIN_DIR)/$(CURRENT_SCRIPT)

uninstall:
	rm -i $(BIN_DIR)/$(SCRIPT)

config:
	cp -i $(CURRENT_DIR)/$(SCRIPT_CONF) $(CONFIG_DIR)

purge: uninstall
	rm -i $(CONFIG_DIR)/$(SCRIPT_CONF)
