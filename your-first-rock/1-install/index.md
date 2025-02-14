### Installing tools for this workshop

We need to install following tools to before continuing this workshop.

- Rockcraft
- Docker
- Chisel
- LXD
- .NET SDK

These tools are already being installed in background. Please wait a few minutes then click "Check" to see if tools are installed.

#### Manual install

If you want to install tools manually, you may follow instructions below.

- 1. Install Rockcraft, Chisel, LXD using Snap

```bash
sudo snap install lxd
sudo snap install --classic rockcraft
sudo snap install --classic chisel
```

- 2. Initialize LXD

```bash
sudo lxd init --auto
```

- 3. Enable IPv4 forwarding to prevent networking issues when using LXD and Docker at the same time [(Learn more on LXD Docs)](https://documentation.ubuntu.com/lxd/en/latest/howto/network_bridge_firewalld/#prevent-connectivity-issues-with-lxd-and-docker)

```bash
sudo echo "net.ipv4.conf.all.forwarding=1" > /etc/sysctl.d/99-forwarding.conf
sudo systemctl restart systemd-sysctl
sudo systemctl restart docker
```

- 4. For installing .NET, refer to the link below.
  - https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-install
  - Check Ubuntu release of this environemnt using `lsb_release -a` before following installation guidance.