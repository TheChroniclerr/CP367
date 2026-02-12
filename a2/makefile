CC = gcc
CFLAGS = -Werror -Wall -g -std=gnu99
SRC = src
BIN = bin
SUB = submit

.PHONY: all clean submission

submission: $(SUB)/a2.zip

$(SUB)/a2.zip: $(SRC)/word_count.c $(SRC)/shell.c assets/tests.docx | $(SUB)
	rm -f $@
	zip -j $@ $^

all: $(BIN)/word_count $(BIN)/shell

$(BIN)/word_count: $(SRC)/word_count.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@

$(BIN)/shell: $(SRC)/shell.c | $(BIN)
	$(CC) $(CFLAGS) $< -o $@

$(BIN):
	mkdir -p $(BIN)

$(SUB):
	mkdir -p $(SUB)

clean:
	rm -f $(BIN)/*