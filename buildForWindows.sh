

read -n1 -p "Would you like to build for windows 64Bits[y] or windows 32Bits[n]" doit
case $doit in
y|Y) 
	sudo apt install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git g++-mingw-w64-x86-64 
	sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix

	PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g')
	cd depends
	sudo make HOST=x86_64-w64-mingw32
	cd ..
	./autogen.sh
	CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/
;;
n|N)
	sudo apt install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git g++-mingw-w64-i686 mingw-w64-i686-dev
	sudo update-alternatives --set i686-w64-mingw32-g++ /usr/bin/i686-w64-mingw32-g++-posix
	PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g')
	cd depends
	sudo make HOST=i686-w64-mingw32
	cd ..
	./autogen.sh
	CONFIG_SITE=$PWD/depends/i686-w64-mingw32/share/config.site ./configure --prefix=/
;;
*)
	 echo "Not a valid option, try Y (64-Bits) or N (32-Bits)";;
esac

make
make install DESTDIR=```pwd```/icacoin-builds
