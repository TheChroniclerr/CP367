CC = gcc
CFLAGS = -g # -std=c99 -Wall
SRC = src
BIN = bin
SUB = submit

submission: all
	rm -f $(SUB)/a1.zip
	zip -j $(SUB)/a1.zip $(SRC)/* assets/tests.docx

all: $(BIN)/q1 $(BIN)/q2 $(BIN)/q3 $(BIN)/q4

$(BIN)/q1: $(SRC)/q1.c
	$(CC) $(CFLAGS) $< -o $@

$(BIN)/q2: $(SRC)/q2.c
	$(CC) $(CFLAGS) $< -o $@

$(BIN)/q3: $(SRC)/q3.c
	$(CC) $(CFLAGS) $< -o $@

$(BIN)/q4: $(SRC)/q4.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(BIN)/*