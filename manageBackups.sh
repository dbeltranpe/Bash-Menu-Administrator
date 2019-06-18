clear

colorI="\e[1;36m"
colorF="\e[0m"

echo -e "$colorI ************************** $colorF"
echo -e "$colorI     GESTIÓN DE BACKUPS     $colorF"
echo -e "$colorI ************************** $colorF"
echo " "

echo -e "\e[1;32m 1. Realizar Backup \e[0m"
echo -e "\e[1;32m 2. Restaurar Backup \e[0m"
echo " "

read -p "Opción a realizar: " op

case $op in
	1)	
		clear

		cd /home
		ls -ltr
		echo " "


		read -p "Escriba la dirección en la cual se va ha realizar un backup: " dirI
		echo " "
		
		read -p "Escriba la ruta donde quiere guardar el backup: " dirF
		echo " "
		read -p "Nombre del Backups: " nomBack
		
	        des="$dirF/$nomBack"
		echo $des

		sudo tar -cvf $des $dirI
		echo " "

		ls -ltr $dirF 
		echo " "

		echo "Backup con el nombre $nomBack se realizó con exito."
		echo " "
		;;

	2)
		clear

		echo "Backups que se encuentran en la carpeta del usuario"
		user=`who i am|awk {'print $1'}`
		ls /home/$user *.tar

		echo " "

		read -p "Escriba el nombre del backup a retaurar: " arch
		echo " "
		
		read -p "Escriba el lugar en donde se quiere restaurar: " destino
		echo " "

		cd $destino
		sudo tar -xvf $arch

		echo "Backup restaurado en la dirección $destino"	
		;;
esac
