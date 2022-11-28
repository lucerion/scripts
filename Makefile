.DEFAULT_GOAL := install

BIN_DIR ?= ~/bin
CONFIG_DIR ?= ~/.config
CURRENT_DIR = $(shell pwd)

ifndef SCRIPT
SCRIPT := $(shell read -p "Script: " SCRIPT_NAME; echo $$SCRIPT_NAME)
CURRENT_DIR = $(shell pwd)/$(SCRIPT)
endif

SCRIPT_CONF = $(SCRIPT).yml
CURRENT_SCRIPT = $(CURRENT_DIR)/$(SCRIPT)

build:
	if [ -f $(CURRENT_SCRIPT).cr ]; then crystal build $(CURRENT_SCRIPT).cr; fi

install: build
	mkdir -p $(BIN_DIR)
	cp $(CURRENT_SCRIPT) $(BIN_DIR)
	if [ -f $(CURRENT_SCRIPT).cr ]; then rm $(CURRENT_SCRIPT); fi
	chmod u+x $(BIN_DIR)/$(SCRIPT)

uninstall:
	rm -i $(BIN_DIR)/$(SCRIPT)

config:
	cp -i $(CURRENT_DIR)/$(SCRIPT_CONF) $(CONFIG_DIR)

purge: uninstall
	rm -i $(CONFIG_DIR)/$(SCRIPT_CONF)
