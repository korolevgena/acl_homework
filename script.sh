#!/bin/bash
cd /opt/
rm -f -r Proj*
mkdir Proj{1..3}

#creating developers
for i in {1..5}
do
    if id R$i >/dev/null 2>&1; then
    sudo userdel R$i
    sudo rm -r /home/R$i
    fi

   sudo useradd -m -s /bin/bash R$i
   echo -e "P@ssw0rd$i\nP@ssw0rd$i" | passwd R$i
done

#creating analysts
for i in {1..4}
do
    if id A$i >/dev/null 2>&1; then
    sudo userdel A$i
    sudo rm -r /home/A$i
    fi

   sudo useradd -m -s /bin/bash A$i
   echo -e "P@ssw0rd$i\nP@ssw0rd$i" | passwd A$i
done

#creating information managers
for i in {1..3}
do
    if id I$i >/dev/null 2>&1; then
    sudo userdel I$i
    sudo rm -r /home/I$i
    fi

   sudo useradd -m -s /bin/bash I$i
   echo -e "P@ssw0rd$i\nP@ssw0rd$i" | passwd I$i
done

sudo setfacl -Rm u:R2:rwx,u:R3:rwx,u:R5:rwx,u:A1:rwx,u:A4:rx Proj1
sudo setfacl -Rm u:R1:rwx,u:R5:rwx,u:A1:rwx,u:A2:rx,u:A3:rx Proj2
sudo setfacl -Rm u:R1:rwx,u:R2:rwx,u:R4:rwx,u:A2:rwx,u:A1:rx,u:A4:rx Proj3
sudo setfacl -Rdm u:R2:rwx,u:R3:rwx,u:R5:rwx,u:A1:rwx,u:A4:rx Proj1
sudo setfacl -Rdm u:R1:rwx,u:R5:rwx,u:A1:rwx,u:A2:rx,u:A3:rx Proj2
sudo setfacl -Rdm u:R1:rwx,u:R2:rwx,u:R4:rwx,u:A2:rwx,u:A1:rx,u:A4:rx Proj3

sudo setfacl -Rm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj1
sudo setfacl -Rm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj2
sudo setfacl -Rm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj3
sudo setfacl -Rdm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj1
sudo setfacl -Rdm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj2
sudo setfacl -Rdm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj3
