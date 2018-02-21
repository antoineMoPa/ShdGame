# ShdGame

I just want to code a small linux game using shaders. This might also end up just being a platform used to test visual effects. Nothing very important.

# Building & installing

This should work on  Ubuntu and Debian. For other distributions, you'll have to find these dependencies, it should not be too difficult.

	sudo apt-get install freeglut3-dev libglm-dev libglew-dev libsoil-dev
	git clone https://github.com/antoineMoPa/ShdGame.git
	cd ShdGame
	make all
	sudo make install	# (optional)
	./thegame			# or just `thegame` if you did `make install`

