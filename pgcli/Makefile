.DEFAULT_GOAL := install

BIN_PATH ?= ~/.local/bin
CONFIG_PATH ?= ~/.config

install:
		mkdir -p $(BIN_PATH)
		cp `pwd`/pgcli $(BIN_PATH)/pgcli
		chmod u+x $(BIN_PATH)/pgcli

uninstall:
		rm -f $(BIN_PATH)/pgcli

config:
		cp -i `pwd`/pgcli.yml $(CONFIG_PATH)

purge: uninstall
		rm -fi $(CONFIG_PATH)/open_vpn.yml
