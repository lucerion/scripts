SCRIPT = vim-server

include ../Makefile

VIFM_LOCAL_MAPPINGS = ~/.config/vifm/mappings.local
ALIAS=vs

export ALIASES_FILE = ${HOME}/.aliases.local

setup:
		echo "nmap cs :term -e vim-server %f &<cr>" >> $(VIFM_LOCAL_MAPPINGS)
		../als/als add $(ALIAS) $(SCRIPT)

purge: uninstall
		sed -i '/vim-server/d' $(VIFM_LOCAL_MAPPINGS)
		../als/als del $(ALIAS)
