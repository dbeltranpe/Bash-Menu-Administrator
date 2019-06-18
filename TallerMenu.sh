#!/bin/bash
clear

colorI="\e[1;36m"
colorF="\e[0m"

echo -e "$colorI ***************************** $colorF"
echo -e "$colorI    ADMINISTRACIÓN PERMISOS    $colorF"
echo -e "$colorI ***************************** $colorF"
echo " "

BLUE='\033[1;32m'
NC='\033[0m'
echo -e $BLUE'Nombre del archivo:' $NC
read nombreArchivo
A=`find / -name "*$nombreArchivo"`

num=1;
for a in $A
do
 arrayArchivos[$num]=$a
 echo $num '->' $a;
 let num=$num+1;
done

echo ''
echo -e $BLUE'Dígite el número del archivo al cual se le cambiaran los permisos'$NC
read numeroArchivo

echo ''
echo -e $BLUE'A continuación dígite los permisos correspondientes para cada categoría'$NC
echo -e $BLUE'L(Lectura) E(Escritura X(Ejecución)'$NC
echo ''

read -p 'Permisos para usuario: '  perUsuario
read -p 'Permisos para grupo: ' perGrupo
read -p 'Permisos para otro: ' perOtro

numUsuario=0;
numGrupo=0;
numOtro=0;

if [[ $perUsuario == *"X"* ]]; then
  let numUsuario=$numUsuario+1;
fi

if [[ $perUsuario == *"E"* ]]; then
  let numUsuario=$numUsuario+2;
fi

if [[ $perUsuario == *"L"* ]]; then
  let numUsuario=$numUsuario+4;
fi

if [[ $perGrupo = *"X"* ]]; then
  let numGrupo=$numGrupo+1;
fi

if [[ $perGrupo == *"E"* ]]; then
  let numGrupo=$numGrupo+2;
fi

if [[ $perGrupo == *"L"* ]]; then
  let numGrupo=$numGrupo+4;
fi

if [[ $perOtro == *"X"* ]]; then
  let numOtro=$numOtro+1;
fi

if [[ $perOtro == *"E"* ]]; then
  let numOtro=$numOtro+2;
fi

if [[ $perOtro == *"L"* ]]; then
  let numOtro=$numOtro+4;
fi

numeroPermiso=$numUsuario$numGrupo$numOtro

C=`sudo chmod $numeroPermiso ${arrayArchivos[$numeroArchivo]}`
echo " "
echo 'Se han cambiado los permisos' 
