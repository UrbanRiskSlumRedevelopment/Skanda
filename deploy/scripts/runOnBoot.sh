sudo cp ../docker-skanda.service /etc/systemd/system/docker-skanda.service
sudo systemctl enable docker-skanda.service
sudo systemctl start docker-skanda.service
