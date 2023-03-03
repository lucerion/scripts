SCRIPT = send_to_google_drive
SCRIPT_CONF = google_drive.json

include ../Makefile

install:
	gem install google_drive
	mkdir -p $(BIN_DIR)
	cp $(CURRENT_SCRIPT) $(BIN_DIR)
	chmod u+x $(BIN_DIR)/$(SCRIPT)
