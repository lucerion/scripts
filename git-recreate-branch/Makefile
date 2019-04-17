SCRIPT = git-recreate-branch

include ../Makefile

ALIAS=gbr
export ALIASES_FILE = ${HOME}/.aliases.local

setup:
		../als/als add $(ALIAS) $(SCRIPT)

purge: uninstall
		../als/als del $(ALIAS)
