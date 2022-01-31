# Install Docker 

echo "Uninstall old versions"

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine -y

echo "Set up the repository "

sudo yum install -y yum-utils -y 

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

echo "Install Docker Engine"

sudo yum install docker-ce docker-ce-cli containerd.io -y 


echo "Start Docker."
sudo systemctl start docker
sudo systemctl enable docker


echo "Manage Docker as a non-root user"    

echo "Create the docker group."
sudo groupadd docker

echo "Add vagrant user to the docker group."

sudo usermod -aG docker vagrant

newgrp docker 

echo "Verify that Docker Engine is installed correctly by running the hello-world image."

docker run hello-world

