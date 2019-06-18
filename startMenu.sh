clear

while $true 
do

echo " " 

colorI="\e[1;36m"
colorF="\e[0m"

echo -e "$colorI *************************************** $colorF"
echo -e "$colorI                  MENÚ                   $colorF"
echo -e "$colorI *************************************** $colorF"
echo " "

echo -e "\e[1;32m 1. Últimos comandos 10 comandos escritos. \e[0m"
echo -e "\e[1;32m 2. Gestión de Procesos. \e[0m"
echo -e "\e[1;32m 3. Cantidad Archivos. \e[0m"
echo -e "\e[1;32m 4. Gestión de Backups. \e[0m"
echo -e "\e[1;32m 5. Otorgar Permisos. \e[0m"
echo -e "\e[1;32m 6. Salir. \e[0m"
echo " "

read -p "Opción a realizar: " op

case $op in
	1)
		bash /home/usuario1/ManageMenu/LastCommands.sh
		;;
	2)
		bash /home/usuario1/ManageMenu/manageProcess.sh
		;;
	3)
	        bash /home/usuario1/ManageMenu/TypeAndWeight.sh
		;;
	4)
		bash /home/usuario1/ManageMenu/manageBackups.sh
		;;
	5)
		bash /home/usuario1/ManageMenu/TallerMenu.sh
		;;
	6)
		break
		;;

esac
done
