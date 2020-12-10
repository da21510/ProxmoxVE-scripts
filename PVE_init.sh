echo "" >> /etc/apt/sources.list
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" >> /etc/apt/sources.list
sed -i 's/deb/#&/g' /etc/apt/sources.list.d/pve-enterprise.list
apt update
apt upgrade -y

apt install -y vim

sed -i 's/if (res === null || res === undefined || !res || res/if (false) {/g' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
sed -i '/.data.status.toLowerCase() !== '"'"'active'"'"') {/d' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js

wget -qO- https://raw.githubusercontent.com/da21510/gpupassthrough_script/master/setup-modules.sh | bash
wget -qO- https://raw.githubusercontent.com/da21510/gpupassthrough_script/master/setup-vfio.sh | bash
update-initramfs -u -k all
