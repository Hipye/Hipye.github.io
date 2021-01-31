#!/bin/sh /etc/rc.common
# Copyright (C) 2008 OpenWrt.org

START=99
USE_PROCD=1
PROG="/bin/frpc_linux_arm" #..................frp...............

start_service() {
    rm -f /frpc_overload*.log* # remove old logt/logp files
    procd_open_instance
    procd_set_param command "$PROG"
   #procd_append_param command -f 002f8228a9b3c455:813776
    procd_append_param command -f 002f8228a9b3c455:829271
    procd_set_param stdout 1 # forward stdout of the command to logd
    procd_set_param stderr 1 # same for stder
    procd_set_param respawn
    procd_close_instance
}
