SCRIPT = id3tags

include ../Makefile

install:
	mkdir -p $(BIN_DIR)
	cp $(CURRENT_SCRIPT) $(BIN_DIR)
	chmod u+x $(BIN_DIR)/$(SCRIPT)

dependencies:
	sudo apt-get install id3v2
