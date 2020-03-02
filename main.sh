#! /bin/bash
action=$(yad --width 500 --entry --title "System Logout" \
--image=gnome-shutdo­wn \
--center --on-top \
--button="gtk-ok:0" --button="gtk-close:­1" \
--text "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n                        M A I N - M E N U                       \n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n -s : verfier l'exsistance \n-ar :créer une archive compressée  \n -re : Restaurer les documents \n -clean : Netoyer tous les archives compressé \n -help : Afficher le help\n
 vous devez choisir une option:" \
--entry-text  \
"s" "ar" "re" "clean" "help" )
ret=$?


[[ $ret -eq 1 ]] && exit 0
case $action in
s*) if [[ ! -a ~/home/rakeem/backup ]]
		then
		echo " Le repertoire Backup n'esxiste pas " 
		sleep 3 
		echo " Creation du repertoire Backup est en cours"
		echo " ###--------------"
		sleep 1
		echo " #######----------"
		sleep 1
		echo " ###########------"
		sleep 1
		echo " ##############---"
		sleep 2
		echo " #################"
		sleep 1	
		mkdir /home/rakeem/backup
		echo " Creation du repertoire Backup est terminé"
	fi ;;
ar*) name=`cat /etc/passwd | grep $USER | cut -f1 -d:`
 
		  tar -cvjf $name.tar.bz2 /home/$name/
		  sudo mv $name.tar.bz2 /home/backup ;;
re*) cd /home/rakeem/backup
	sudo tar -jcvf $USER.tar.bz2;;

clean*) echo " pas de fonction " ;;
help*)
yad --form --width=500 --text="-s pour verifier l'exsistance du repertoir
-ar pour archiver le fichier backup en extension .tar
-re pour restaurer les documents
-clean pour nettoyer les archives compresses " \ && help ;;




esac
