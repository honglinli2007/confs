#! /bin/bash

tag=wbtcg
version=$1
dest_host=192.168.122.59
dest_host_dir=/data/kernel

target_dir="kernel"
if [ -z $version ]
then
	echo cp $tag kernel rpm to $dest_host:$dest_host_dir
	echo "usage: $0 <version>"
	exit
fi

kernel_dbg_rpm=kernel-debuginfo-common-5.4.87-19.0004_${tag}_v${version}.tl3.x86_64.rpm
kernel_rpm=kernel-5.4.87-19.0004_${tag}_v${version}.tl3.x86_64.rpm
scp $target_dir/$kernel_rpm root@${dest_host}:${dest_host_dir}
#scp root@${dest_host}:/data/rpmbuild/RPMS/x86_64/$kernel_dbg_rpm $target_dir/
