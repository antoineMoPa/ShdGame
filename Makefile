OGLCFLAGS=-lGL -lGLU -lglut -lGLEW -lSOIL

OPTIONS=$(OGLCFLAGS) -std=c++11 -g

all: main.o
	g++ main.o Shader.o ShdGame.o platform.o Image.o FrameBuffer.o $(OPTIONS) -o thegame

main.o: Shader.o ShdGame.o platform.o Image.o FrameBuffer.o src/main.cpp
	g++ -c src/main.cpp $(OPTIONS)

ShdGame.o: src/ShdGame.cpp
	g++ -c src/ShdGame.cpp $(OPTIONS)

platform.o: src/platform.cpp
	g++ -c src/platform.cpp $(OPTIONS)

Shader.o: src/Shader.cpp
	g++ -c src/Shader.cpp $(OPTIONS)

Image.o: src/Image.cpp
	g++ -c src/Image.cpp $(OPTIONS)

FrameBuffer.o: src/FrameBuffer.cpp
	g++ -c src/FrameBuffer.cpp $(OPTIONS)


install:
	cp thegame /usr/bin/

uninstall:
	rm /usr/bin/thegame

clean:
	rm -f *.o
	rm -f thegame
