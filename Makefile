CPP = $(shell $(WXCONF) --cxx)
FLAGS = $(shell $(WXCONF) --cppflags) -std=c++11
LIBS = $(shell $(WXCONF) --libs)
WXCONF = ~/wxWidgets/$(DIR)/wx-config

SRC := $(wildcard src/*.cpp)
OBJ_O := $(patsubst src/%.cpp,osx/%.o,$(SRC))
OBJ_W := $(patsubst src/%.cpp,win/%.o,$(SRC))

.PHONY: osx osxdir win windir

osx: DIR := build-cocoa-debug
osx: osxdir a.out

osxdir:
	if [ ! -d osx ]; then mkdir -p osx; fi

a.out: $(OBJ_O)
	$(CPP) -o $@ $< $(LIBS)

$(OBJ_O): $(SRC)
	$(CPP) -o $@ -c $< $(FLAGS)

win: DIR := build-win32
win: windir thac.exe

windir:
	if [ ! -d win ]; then mkdir -p win; fi

thac.exe: $(OBJ_W)
	$(CPP) -o $@ $< $(LIBS)

$(OBJ_W): $(SRC)
	$(CPP) -o $@ -c $< $(FLAGS)
