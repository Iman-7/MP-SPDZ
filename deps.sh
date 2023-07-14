sudo apt update
sudo apt-get install automake build-essential clang cmake git libboost-dev libboost-thread-dev libgmp-dev libntl-dev libsodium-dev libssl-dev libtool python3 g++ autotools-dev libicu-dev libbz2-dev -y


sudo mkdir -p /src
sudo chmod -R 777 /src

cd /src
wget -O boost_1_81_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.81.0/boost_1_81_0.tar.gz/download
tar xzvf boost_1_81_0.tar.gz


cd /src/boost_1_81_0/
./bootstrap.sh --prefix=/usr/
./b2
sudo ./b2 install

mkdir -p ~/MP-SPDZ/Player-Data