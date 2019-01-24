.DEFAULT_GOAL := install

BIN_PATH ?= ~/.local/bin
CONFIG_PATH ?= ~/.config

install:
		mkdir -p $(BIN_PATH)
		cp `pwd`/starter $(BIN_PATH)/start
		chmod u+x $(BIN_PATH)/start

uninstall:
		rm $(BIN_PATH)/start

config:
		([ ! -f $(CONFIG_PATH)/starter.yml ] && cp `pwd`/starter.yml $(CONFIG_PATH)) || echo "config already exists"
