#Colors
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

#Esto lo hioce en GIT de n uevo

echo """

$blu escribiste $# Argumentos

$grn El primer argumento es $1

$yel El segundo argumento \$2 es $2

$cyn El tercer argumento es $3

$mag EL PID es $$

$red Todos los argumentos $* $end

"""


function Leer()
{
dialog \
--title "Mi Script" \
--backtitle "Menu Dialog" \
--inputbox "Adivina el numero que estoy pensando?" 0 0 2>/tmp/input.$$ # este 0 0  sirve para cuadrar el contenido en la caja de mensaje
A=$(cat /tmp/input.$$)
proceso
}


function proceso()
{
for i in $(seq 0 50 100);do
   sleep 1
   echo $i|dialog --gauge "leyendo tu mente" 0 0 0
done
validar

}

function validar()
{
if [ $A == 1 ]; then
 
  dialog \
   --title "Respuesta" \
   --backtitle "Menu" \
   --msgbox "Acertaste" 0 0

    elif [ $A == 2 ] || [ $A == 3]; then
    dialog \
    --title "Respuesta" \
    --backtitle "Menu" \
    --msgbox "muy cerca" 0 0

    else
    dialog \
    --title "Respuesta" \
    --backtitle "Menu" \
    --yesno "Desea Continuar" 0 0
    RESPUESTA=$? # 0 ES YES - 1 ES NO

    while [ $RESPUEST == 0 ];do
      echo "elegiste $RESPUESTA "
      Leer
    done

fi


dialog \
   --title "Respuesta" \
   --backtitle "Menu" \
   --msgbox "Acertaste" 0 0
}



Leer





clear;

