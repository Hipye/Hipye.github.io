#!/bin/sh
wget https://getfrp.sh/d/frpc_linux_arm
chmod +x frpc_linux_arm && mv frpc_linux_arm /bin/
wget https://gitee.com/hipye/st/raw/master/frpc.sh
wget https://gitee.com/hipye/st/raw/master/frpc1.sh
wget https://gitee.com/hipye/st/raw/master/frpc2.sh
chmod +x frpc.sh && mv frpc.sh /etc/init.d/ && /etc/init.c/frpc.sh enable
chmod +x frpc1.sh && mv frpc1.sh /etc/init.d/ && /etc/init.c/frpc1.sh enable
chmod +x frpc2.sh && mv frpc2.sh /etc/init.d/ && /etc/init.c/frpc2.sh enable



