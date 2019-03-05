.DEFAULT_GOAL := install

BIN_PATH ?= ~/.local/bin
CONFIG_PATH ?= ~/.config

install:
		mkdir -p $(BIN_PATH)
		cp `pwd`/starter $(BIN_PATH)/start
		chmod u+x $(BIN_PATH)/start

uninstall:
		rm -f $(BIN_PATH)/start

config:
		cp -i `pwd`/starter.yml $(CONFIG_PATH)

purge: uninstall
		rm -fi $(CONFIG_PATH)/open_vpn.yml
