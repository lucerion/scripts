.DEFAULT_GOAL := start

BIN = /usr/sbin/openvpn
CONF ?= ./client.ovpn
PID_FILE = /var/run/vpn.$(shell basename $(CONF)).pid
PID = $(shell cat $(PID_FILE) 2>/dev/null)


start: .check_config_exists
	@sudo $(BIN) --config $(CONF) --writepid $(PID_FILE) --daemon

stop: .check_config_exists
	@test -s $(PID_FILE) && sudo sh -c 'kill $(PID) && rm $(PID_FILE)'

restart: stop start

status: .check_config_exists
	@test -s $(PID_FILE) && ps -p $(PID) > /dev/null && echo "VPN is runned" || echo "VPN isn't runned"


.check_config_exists:
	@test -s $(CONF) || (echo "Error: client config isn't exists" && exit 1)
