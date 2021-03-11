# env : docker-ce
# port : 9000
sudo systemctl enable docker
sudo iptables -I INPUT -p tcp --dport 9000 -j ACCEPT
sudo groupadd docker
sudo usermod -aG docker $USER
docker volume create portainer_data
 docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce