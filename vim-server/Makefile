.DEFAULT_GOAL := install

BIN_PATH ?= ~/.local/bin
VIFM_LOCAL_MAPPINGS = ~/.config/vifm/mappings.local
LOCAL_ALIASES = ~/.aliases.local

install:
		mkdir -p $(BIN_PATH)
		cp `pwd`/vim-server $(BIN_PATH)
		chmod u+x $(BIN_PATH)/vim-server

uninstall:
		rm -f $(BIN_PATH)/vim-server

setup:
		touch $(VIFM_LOCAL_MAPPINGS)
		echo "nmap cs :term -e vim-server %f &<cr>" >> $(VIFM_LOCAL_MAPPINGS)
		touch $(LOCAL_ALIASES)
		echo "alias vs='vim-server'" >> $(LOCAL_ALIASES)

clean:
		sed -i '/vim-server/d' $(VIFM_LOCAL_MAPPINGS) $(LOCAL_ALIASES)

purge: uninstall clean
