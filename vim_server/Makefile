SCRIPT = vim_server

include ../Makefile

VIFM_LOCAL_MAPPINGS = ~/.config/vifm/mappings.local
export ALIASES_FILE = ${HOME}/.aliases.local

setup:
		echo "nmap cs :term -e vim_server %f &<cr>" >> $(VIFM_LOCAL_MAPPINGS)
		../als/als add vs vim_server

purge: uninstall
		sed -i '/vim_server/d' $(VIFM_LOCAL_MAPPINGS)
		../als/als del vs
