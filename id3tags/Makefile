SCRIPT = id3tags

include ../Makefile

install:
		sudo apt-get install id3v2
		mkdir -p $(BIN_DIR)
		cp $(CURRENT_SCRIPT) $(BIN_DIR)
		chmod u+x $(BIN_DIR)/$(SCRIPT)
