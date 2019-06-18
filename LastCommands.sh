clear

colorI="\e[1;36m"
colorF="\e[0m"

echo -e "$colorI ******************************* $colorF"
echo -e "$colorI        COMANDOS DIGITADOS       $colorF"
echo -e "$colorI ******************************* $colorF"
echo " "

echo '¿Para quién desea mostrar los últimos diez comandos?'
echo -e "\e[1;32m 1. root \e[0m"
echo -e "\e[1;32m 2. usuario \e[0m"
echo " "

read -p 'Dígite la opción que desea: ' opcion	
echo " "

if [ $opcion -eq '1' ]; then
 sudo tail -10 /root/.bash_history

elif [ $opcion -eq '2' ]; then
 read -p 'Dígite el nombre del usuario: ' nombre

 if [ -f "/home/$nombre/.bash_history" ]; then
	 echo " "
	 sudo tail -10 /home/$nombre/.bash_history
 else
	 echo " "
	 echo "El usuario no existe o no ha digitado comandos"
 fi

else
	echo " "
 echo 'La opción digitada es incorrecta'

fi


