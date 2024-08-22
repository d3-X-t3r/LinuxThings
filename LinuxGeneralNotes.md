### Start Windows11 VM and connect to it via FreeRDP
sudo systemctl start virtnetworkd.service && virsh start Windows11; while not nc -zv 192.168.122.3 3389; sleep 1; end; xfreerdp /v:192.168.122.3 /u:username /p:password /drive:/home/username/Downloads,Downloads /cert:ignore /dynamic-resolution +clipboard /scale:180 /f

### Connecto to an already running VM via FreeRPD
xfreerdp /v:192.168.122.3 /u:username /p:password /drive:/home/username/Downloads,Downloads /cert:ignore /dynamic-resolution +clipboard /scale:180 /f
