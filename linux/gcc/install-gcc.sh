#! /bin/bash
version=${1}
echo "gcc version is ${version}"
echo "gcc-${version}'s url is http://ftp.gnu.org/gnu/gcc/gcc-${version}/gcc-${version}.tar.gz"
wget http://ftp.gnu.org/gnu/gcc/gcc-${version}/gcc-${version}.tar.gz
tar -zxvf gcc-${version}.tar.gz
cd gcc-${version}
if [ ! -f "./contrib/download_prerequisites"  ]
then
		mkdir -p ./contrib
		cp ../download_prerequisites ./contrib/
fi

./contrib/download_prerequisites
mkdir gcc-build-${version}
cd gcc-build-${version}
chmod +x ../configure
../configure --prefix=/usr/share/gcc-${version} --enable-checking=release --enable-languages=c,c++ --disable-multilib

make -j4
make install
cd ../../
rm -rf gcc-${version}*
