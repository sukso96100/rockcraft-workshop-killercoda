sudo snap install lxd
sudo snap install --classic rockcraft
sudo snap install --classic chisel
sudo lxd init --auto
# https://documentation.ubuntu.com/lxd/en/latest/howto/network_bridge_firewalld/#prevent-connectivity-issues-with-lxd-and-docker
sudo echo "net.ipv4.conf.all.forwarding=1" > /etc/sysctl.d/99-forwarding.conf
sudo systemctl restart systemd-sysctl

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo apt install -y -q ./packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update
sudo apt install -y -q dotnet-sdk-8.0 aspnetcore-runtime-8.0

touch /home/ubuntu/.tools-installed