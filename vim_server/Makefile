SCRIPT = vim_server

include ../Makefile

VIFM_LOCAL_MAPPINGS = ~/.config/vifm/mappings.local
LOCAL_ALIASES = ~/.aliases.local

setup:
		touch $(VIFM_LOCAL_MAPPINGS)
		echo "nmap cs :term -e vim_server %f &<cr>" >> $(VIFM_LOCAL_MAPPINGS)
		touch $(LOCAL_ALIASES)
		echo "alias vs='vim_server'" >> $(LOCAL_ALIASES)

purge: uninstall
		sed -i '/vim_server/d' $(VIFM_LOCAL_MAPPINGS) $(LOCAL_ALIASES)
