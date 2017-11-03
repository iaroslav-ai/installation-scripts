### Installation of dependencies for deep learning and beyond ###
### supports both Ubuntu 14 and Ubuntu 16 ###
### run script like `bash ..untu.sh gpu` to install gpu drivers ###
### be sure to disable the safe boot first though ###

if [[ $1 == "gpu" ]]; then 
read -p "Did you disable secure boot in BIOS settings? If not, please do so. Otherwise installing Nvidia drivers will likely break your installation." yn
fi

# remember script location
the_script_path=$PWD
# get distribution name
sudo apt-get install lsb-release -y
distrib_nam="$(lsb_release -c -s)"

# install Docker
bash docker_install.sh

# switch to home directory to not clutter repo
cd

if [[ $1 == "gpu" ]]; then 

if [[ "$distrib_nam" == 'xenial' ]]; then
# install cuda (and drivers)
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
fi
if [[ "$distrib_nam" == 'trusty' ]]; then
# install cuda (and drivers)
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
fi

sudo apt-get update
sudo apt-get install cuda -y

echo 'export PATH="/usr/local/cuda/bin:"$PATH' >> .bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda/lib64:/usr/local/cuda/lib:/usr/local/lib:"$LD_LIBRARY_PATH' >> .bashrc

# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker_1.0.0-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

fi

# install python essentials
sudo apt-get install python3 python3-pip -y

# numeric processing
pip3 install numpy
pip3 install scipy
pip3 install pandas

# machine learning
pip3 install scikit-learn
pip3 install scikit-optimize
pip3 install keras

# web programming
pip3 install tornado
pip3 install tornado_jinja2
pip3 install flask

# notebooks
pip3 install jupyter

# distributed computing
pip3 install joblib
pip3 install dask[complete]

# fix libdc warning on ubuntu
sudo ln /dev/null /dev/raw1394

# install mongod
bash mongodb_install.sh

