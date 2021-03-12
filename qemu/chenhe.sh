#! /bin/bash
/data/qemu-5.0.0/x86_64-softmmu/qemu-system-x86_64 \
-enable-kvm \
-smp cpus=4,cores=2,threads=2,sockets=1 \
-cpu host \
-m 8192 \
-drive format=qcow2,file=./vm.qcow2,id=drive0,if=none \
-device virtio-blk-pci,scsi=off,drive=drive0,bootindex=1 \
-drive format=qcow2,file=./data1-50g.qcow2,id=data1,if=none \
-device virtio-blk-pci,scsi=off,drive=data1 \
-drive format=qcow2,file=./data2-50g.qcow2,id=data2,if=none \
-device virtio-blk-pci,scsi=off,drive=data2 \
-parallel /dev/null \
-nographic \
-no-reboot \
-serial mon:stdio \
-monitor telnet:127.0.0.1:5678,server,nowait \
-device e1000,netdev=net0,mac='00:00:00:01:00:0e' \
-netdev tap,ifname=tap0,id=net0,script=no,downscript=no,vhost=on \
-vnc :1 \
#-S -s
