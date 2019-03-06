SCRIPT = vim-server

include ../Makefile

VIFM_LOCAL_MAPPINGS = ~/.config/vifm/mappings.local
LOCAL_ALIASES = ~/.aliases.local

setup:
		touch $(VIFM_LOCAL_MAPPINGS)
		echo "nmap cs :term -e vim-server %f &<cr>" >> $(VIFM_LOCAL_MAPPINGS)
		touch $(LOCAL_ALIASES)
		echo "alias vs='vim-server'" >> $(LOCAL_ALIASES)

purge: uninstall
		sed -i '/vim-server/d' $(VIFM_LOCAL_MAPPINGS) $(LOCAL_ALIASES)
