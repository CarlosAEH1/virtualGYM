#!/bin/bash

# @Integrantes:
#               -Elizarraras Herrera Carlos Amador
#               -Rocha García Erick Hazel
# @Fecha        11/05/2022
# @Descripcion  Simula dispositivos de almacenamiento.

#EJECUTAR SOLO EN CASO DE QUE NO SE HAYA MONTADO EN /unam-bd/disk01,
#/unam-bd/disk02 o /unam-bd/disk03 ANTERIORMENTE.

#EJECUTAR SOLO EN CASO DE QUE NO SE HAYA MONTADO EN /unam-bd/disk01,
#/unam-bd/disk02 o /unam-bd/disk03 ANTERIORMENTE.

#EJECUTAR SOLO EN CASO DE QUE NO SE HAYA MONTADO EN /unam-bd/disk01,
#/unam-bd/disk02 o /unam-bd/disk03 ANTERIORMENTE.

echo "Creando carpeta /unam-bd/disk-images"
if [ -d /unam-bd/disk-images ]; then echo "/unam-bd/disk-images existe."
else
  mkdir /unam-bd/disk-images
  chmod 755 /unam-bd/disk-images
fi
cd /unam-bd/disk-images
echo "Creando archivos loop devices"
dd if=/dev/zero of=disk01.img bs=100M count=10
dd if=/dev/zero of=disk02.img bs=100M count=10
dd if=/dev/zero of=disk03.img bs=100M count=10
echo "Verificando creación de archivos loop devices."
du -sh disk*.img
echo "Creando loop devices."
losetup -fP disk01.img
losetup -fP disk02.img
losetup -fP disk03.img
echo "Verificando creación de loop devices."
losetup -a
echo "Configurando formato de montado a loop devices."
mkfs.ext4 disk01.img
mkfs.ext4 disk02.img
mkfs.ext4 disk03.img
echo "Creando directorios de montado."
mkdir /unam-bd/d01
mkdir /unam-bd/d02
mkdir /unam-bd/d03