sudo snap install lxd
sudo snap install docker
sudo snap install --classic rockcraft
sudo snap install --classic chisel
sudo lxd init --auto
# https://documentation.ubuntu.com/lxd/en/latest/howto/network_bridge_firewalld/#prevent-connectivity-issues-with-lxd-and-docker
sudo echo "net.ipv4.conf.all.forwarding=1" > /etc/sysctl.d/99-forwarding.conf
sudo systemctl restart systemd-sysctl
echo "===== All tools installed! Have fun! ====="