.DEFAULT_GOAL := install

BIN_PATH ?= ~/.local/bin
CONFIG_PATH ?= ~/.config

install:
		mkdir -p $(BIN_PATH)
		cp `pwd`/open_vpn $(BIN_PATH)/open_vpn
		chmod u+x $(BIN_PATH)/open_vpn

uninstall:
		rm -f $(BIN_PATH)/open_vpn

config:
		([ ! -f $(CONFIG_PATH)/open_vpn.yml ] && cp `pwd`/open_vpn.yml $(CONFIG_PATH)) || echo "config already exists"
