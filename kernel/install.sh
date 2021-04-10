#! /bin/bash

mkdir -p /data/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} || true
touch /data/.rpmmacros || true
yum install asciidoc audit-libs-devel binutils-devel elfutils-devel newt-devel numactl-devel openssl-devel python2-devel xmlto

