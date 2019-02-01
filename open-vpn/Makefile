.DEFAULT_GOAL := install

BIN_PATH ?= ~/.local/bin
CONFIG_PATH ?= ~/.config

install:
		mkdir -p $(BIN_PATH)
		cp `pwd`/open_vpn $(BIN_PATH)/open_vpn
		chmod u+x $(BIN_PATH)/open_vpn

uninstall:
		rm $(BIN_PATH)/open_vpn
