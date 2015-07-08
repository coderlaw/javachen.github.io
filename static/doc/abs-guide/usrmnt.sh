#!/bin/bash
# usrmnt.sh, ��Anthony Richardson��д, 
# ����������Ȩ, �����ڱ�����ʹ��. 

# �÷�:       usrmnt.sh
# ����: �����豸, ��������ű����û���������
#              /etc/sudoers�ļ��е�MNTUSERS��. 

# ----------------------------------------------------------
#  ����һ���û������豸�Ľű�, �ű�����ʹ��sudo���ݹ�ĵ�������. 
#  ֻ��ӵ�к���Ȩ�޵��û�����ʹ��

#   usermount /dev/fd0 /mnt/floppy

#  ������

#   sudo usermount /dev/fd0 /mnt/floppy

#  ��ʹ����ͬ�ļ��������������е�sudo�ű�, 
#+ ��Ϊ�Ҿ������ܷ���. 
# ----------------------------------------------------------

#  ���û������SUDO_COMMAND����, �������ǲ�û�д���sudo���е�״̬��
#+ (����ע: Ҳ����˵��һ������, ��û���ݹ�), �����ͻῪʼ�ݹ���. �����û�����ʵid����id . . . 

if [ -z "$SUDO_COMMAND" ]
then
   mntusr=$(id -u) grpusr=$(id -g) sudo $0 $*
   exit 0
fi

# ������Ǵ���sudo����������״̬��(����ע: ����˵���ڵݹ���), ��ô���Ǿͻ����е�����. 
/bin/mount $* -o uid=$mntusr,gid=$grpusr

exit 0

# ��ע(�ű��������ӵ�): 
# -------------------------------------------------

# 1) Linux������/etc/fstab�ļ���ʹ��"users"ѡ��, 
#    �Ա����κ��û������Թ��ؿ��ƶ��豸. 
#    ����, �ڷ�������, 
#    ��ϣ��ֻ��һС�����û����Է��ʿ��ƶ��豸. 
#    �ҷ���ʹ��sudo���Ը��Ҹ���Ŀ��ƿռ�. 

# 2) �һ�����, ͨ��ʹ����, 
#    ���ܹ������׵�����������. 

# 3) ����������Խ�root����mount�����Ȩ��, 
#    �����κξ��к���Ȩ�޵��û�, 
#    ����һ��ҪС����Щ���㸳�����Ȩ�޵��û�. 
#    ����Կ�����������mntfloppy, mntcdrom,
#    ��mntsamba�ű�, ���������ͷ���, 
#    Ȼ����Ϳ���ʹ���������������ּ���, 
#    ��ö�mount������õĿ���. 