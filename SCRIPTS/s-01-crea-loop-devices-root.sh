#!/bin/bash

# @Integrantes:
#               -Elizarraras Herrera Carlos Amador
#               -Rocha García Erick Hazel
# @Fecha        11/05/2022
# @Descripcion  Simula dispositivos de almacenamiento.

echo "Creando carpeta /unam-bda/disk-images"
if [ -d /unam-bda/disk-images ]; then echo "/unam-bda/disk-images existe."
else
  mkdir /unam-bda/disk-images
  chmod 755 /unam-bda/disk-images
fi
cd /unam-bda/disk-images
echo "Creando archivos loop devices"
dd if=/dev/zero of=disk11.img bs=100M count=10
dd if=/dev/zero of=disk12.img bs=100M count=10
dd if=/dev/zero of=disk13.img bs=100M count=10
echo "Verificando creación de archivos loop devices."
du -sh disk*.img
echo "Creando loop devices."
losetup -fP disk11.img
losetup -fP disk12.img
losetup -fP disk13.img
echo "Verificando creación de loop devices."
losetup -a
echo "Configurando formato de montado a loop devices."
mkfs.ext4 disk11.img
mkfs.ext4 disk12.img
mkfs.ext4 disk13.img
echo "Creando directorios de montado."
mkdir /unam-bda/d11
mkdir /unam-bda/d12
mkdir /unam-bda/d13