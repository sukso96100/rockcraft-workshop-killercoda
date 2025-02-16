sudo apt update
sudo apt install -y -q snapd dotnet-sdk-8.0 aspnetcore-runtime-8.0

sudo snap install lxd
sudo snap install --classic rockcraft
sudo snap install --classic chisel
sudo lxd init --auto
# https://documentation.ubuntu.com/lxd/en/latest/howto/network_bridge_firewalld/#prevent-connectivity-issues-with-lxd-and-docker
sudo echo "net.ipv4.conf.all.forwarding=1" > /etc/sysctl.d/99-forwarding.conf
sudo systemctl restart systemd-sysctl

touch /home/ubuntu/.tools-installed