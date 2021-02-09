#!/bin/sh
wget https://getfrp.sh/d/frpc_linux_arm
chmod +x frpc_linux_arm && mv frpc_linux_arm /bin/
wget https://gitee.com/hipye/st/raw/master/frpc
wget https://gitee.com/hipye/st/raw/master/frpc1
wget https://gitee.com/hipye/st/raw/master/frpc2
chmod +x frpc && mv frpc /etc/init.d/ && /etc/init.d/frpc enable
chmod +x frpc1 && mv frpc1 /etc/init.d/ && /etc/init.d/frpc1 enable
chmod +x frpc2 && mv frpc2 /etc/init.d/ && /etc/init.d/frpc2 enable



