clear

colorI="\e[1;36m"
colorF="\e[0m"

echo -e "$colorI **************************************** $colorF"
echo -e "$colorI           Gestión de procesos            $colorF"
echo -e "$colorI **************************************** $colorF"
echo " "

echo -e "\e[1;32m 1. Congelar Porceso \e[0m"
echo -e "\e[1;32m 2. Matar Proceso \e[0m"
echo -e "\e[1;32m 3. Reanudar Proceso \e[0m"
echo " "

read -p "Ingrese la opción que se quiere realizar: " op
echo " "

case $op in
	1)
		clear

		echo -e "\e[1;36m CONGELAR PROCESO \e[0m"
		echo " "

		ps -ef
		echo " "

		read -p "Ingrese el número del proceso: " pro
		sudo kill -19 $pro
		echo "--------------------------------------"

		echo " "
		ps -f

		echo " "
		echo "Proceso con el ID $pro ha sido detenido."
		;;
	2)
		clear

		echo -e "\e[1;36m MATAR UN PROCESO \e[0m"
		echo " "

		ps -ef
		echo " "

		read -p "Ingrese el número del proceso: " pro2
		sudo kill -9 $pro2

		echo "---------------------------------------"
		ps -f
		echo " "

		echo "El proceso con el ID $pro2 ha sido matado."
		;;
	3)
		clear

		echo -e "\e[1;36m REANUDAR UN PROCESO \e[0m"
		echo " "

		ps -ef
		echo " "

		read -p "Ingrese el número del proceso: " pro3
		sudo kill -18 $pro3 &

		echo "El proceso con el ID $pro3 ha sido reanudado."	
		;;
esac	
