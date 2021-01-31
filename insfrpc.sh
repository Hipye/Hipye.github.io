#!/bin/sh
wget https://getfrp.sh/d/frpc_linux_arm
chmod +x frpc_linux_arm && mv frpc_linux_arm /bin/
wget https://gitee.com/hipye/st/raw/master/frpc.sh
wget https://gitee.com/hipye/st/raw/master/frpc1.sh
wget https://gitee.com/hipye/st/raw/master/frpc2.sh
chmod +x frpc && mv frpc /etc/init.d/ && /etc/init.c/frpc enable
chmod +x frpc1 && mv frpc1 /etc/init.d/ && /etc/init.c/frpc1 enable
chmod +x frpc2 && mv frpc2 /etc/init.d/ && /etc/init.c/frpc2 enable



