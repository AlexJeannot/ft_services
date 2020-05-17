echo -e "ssh_password\nssh_password" | adduser ssh_user

#openrc
#touch /run/openrc/softlevel
#rc-update add sshd

#/etc/init.d/sshd start
ssh-keygen -A
/usr/sbin/sshd
nginx -g "daemon off;"