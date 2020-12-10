to install berkeleyDB4.8 on linux machines you should perform these actions.

Please do not install any newer version of BerkeleyDB because this will make the wallet crash instantaneously

`wget http://download.oracle.com/berkeley-db/db-4.8.30.zip`

`unzip db-4.8.30.zip`

`cd db-4.8.30`

`cd build_unix /`

`../dist/configure --prefix=/usr/local --enable-cxx`

`make`

`make install`