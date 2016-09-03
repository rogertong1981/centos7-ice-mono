FROM centos:latest
MAINTAINER isuper@qq.com
RUN yum -y update && \
	yum install -y wget yum-utils && \
	echo "Asia/shanghai" > /etc/timezone && \
	cd /etc/yum.repos.d && \
	wget https://zeroc.com/download/rpm/zeroc-ice-el7.repo && \
	rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" && \
	yum-config-manager --add-repo http://download.mono-project.com/repo/centos/ && \
	yum install -y ice-all-runtime ice-all-devel mono-complete && \
	ln -s /lib64/libMonoPosixHelper.so /lib/libMonoPosixHelper.so
	yum clean all
