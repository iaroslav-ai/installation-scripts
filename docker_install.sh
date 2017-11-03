# copy pasted from official instructions

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo rm /etc/apt/sources.list.d/docker.list
# get version of os
. /etc/lsb-release
echo 'deb https://apt.dockerproject.org/repo ubuntu-'$DISTRIB_CODENAME' main' | sudo tee --append /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install apparmor -y

sudo apt-get update
sudo apt-get install docker-engine -y
sudo service docker start
sudo docker run hello-world
