SCRIPT = vim-server

include ../Makefile

ALIAS = vs

VIFM_LOCAL_MAPPINGS = ~/.config/vifm/mappings.local

setup: add_alias
		echo "nmap cs :term -e vim-server %f &<cr>" >> $(VIFM_LOCAL_MAPPINGS)

purge: uninstall remove_alias
		sed -i '/vim-server/d' $(VIFM_LOCAL_MAPPINGS)
