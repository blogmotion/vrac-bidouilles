#!/bin/bash
# xhark 27.03.2023 - blogmotion.fr
# https://twitter.com/xhark/status/1640132586453233664

# Lance une lecture table SMART en boucle
# pour stimuler le disque et copier les donnees
# en parallele. Va savoir pourquoi, ça juste marche...

DISK="/dev/sdd"

NB=0
PSNB=0

for (( ; ; ))
do
   echo "boucle_smart $D"
   NB=$NB+1
   PSNB=$(ps aux | grep "[s]martctl --all"|wc -l)
   if [ "$PSNB" -eq "0" ]; then
   	echo "aucun SMART en cours, on le lance..."
        smartctl --all $DISK
   else
        echo "deja un SMART en cours [${PSNB}]... temporisation de 10s (loop $NB)"
        sleep 10
   fi
done
