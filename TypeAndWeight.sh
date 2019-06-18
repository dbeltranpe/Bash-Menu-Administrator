clear

colorI="\e[1;36m"
colorF="\e[0m"

echo -e "$colorI ******************************* $colorF"
echo -e "$colorI       ARCHIVOS POR TAMAÑO       $colorF"
echo -e "$colorI ******************************* $colorF"
echo " "

read -p 'Ingrese el usuario: ' usuario
A=`find /home/$usuario -name "*"`

echo " "
echo -e "$colorI Especificación General $colorF"
echo " "

#Especificacion General

IFS=$'\n'
audio=0;
pa=0;
video=0;
pv=0;
image=0;
pi=0;
application=0;
pap=0;
text=0;
pt=0;

for a in $A
do
B=`file --mime-type -b $a`
B=${B%/*}

C=`du -b $a | awk '{print $1}'`

if [ $B == 'audio' ]; then
let audio=$audio+1;
let pa=$pa+$C;
fi

if [ $B == 'video' ]; then
let video=$video+1;
let pv=$pv+$C;
fi


if [ $B == 'image' ]; then
let image=$image+1;
let pi=$pi+$C;
fi

if [ $B == 'text' ]; then
let text=$text+1;
let pt=$pt+$C;
fi


if [ $B == 'video' ]; then
let application=$application+1;
let pap=$pap+$C;
fi

done
array=()

array+=("Hay $audio archivos de audio y pesan $pa")
array+=("Hay $video archivos de video y pesan $pv")
array+=("Hay $text archivos de texto y pesas $pt")
array+=("Hay $image archivos de aplicación y pesan $pap")

arreglo=( $(printf "%s\n" ${array[@]} | sort -k 8nr) )

for z in {0..5}
do
echo ${arreglo[z]}
done

ta=0;
tp=0;
let ta=$audio+$video+$text+$image+$application;
let tp=$pa+$pv+$pt+$pi+$pap;
echo "Total de Archivos: $ta Tamaño total: $tp"

#Especificacion Detallada
echo " "
echo -e "$colorI Especificación Detallada $colorF"
echo " "


tipos=()
for a in $A
do

B=`file --mime-type -b  $a`
if [[ '${B%/*}' !=  'inode' ]]; then
B=${B##*/}

if [[ ! " ${tipos[@]} " =~ " $B " ]]; then
 B="${B//-}"
 tipos+=("$B")
fi

fi

done

for tipo in ${tipos[*]}
do

 eval "t$tipo=0";
 eval "p$tipo=0";

done

for a in $A
do

B=`file --mime-type -b $a`
if [[ '${B%/*}' !=  'inode' ]]; then
B=${B##*/}
B="${B//-}"
C=`du -b $a |awk '{print $1}'`

typ=t$B;
wei=p$B;
let t$B=${!typ}+1;
let p$B=${!wei}+$C;
fi

done

for tipo in ${tipos[*]}
do

num=t$tipo;
pes=p$tipo;
echo "Hay ${!num} archivos tipo $tipo y pesan ${!pes}"

done
