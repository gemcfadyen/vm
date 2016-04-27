#!/bin/bash -eux

echo "setup sudo to allow no-password sudo for 'admin'"
groupadd -r admin
usermod -a -G admin ${SSH_USERNAME}
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e '/Defaults\s\+env_reset/a Defaults\tenv_keep+=SSH_AUTH_SOCK' /etc/sudoers
sed -i -e '/Defaults\s\+env_reset/a Defaults\tenv_keep+=PATH' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
