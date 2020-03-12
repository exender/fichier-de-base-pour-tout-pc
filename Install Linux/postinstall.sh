#!/bin/bash

########################################
# Execute sub scripts
########################################
chmod u+x sub_scripts/*.sh
for SCRIPT in sub_scripts/*.sh
do
    echo ""
    echo "###########################################"
    echo "#   $SCRIPT"
    echo "###########################################"
    echo ""
    PROGRAM_NAME=`basename $SCRIPT`
    PROGRAM_NAME=${PROGRAM_NAME%.*}
    read -p "est ce que vous voulez installez ceci${PROGRAM_NAME}? " choice
    case "$choice" in 
        [yY][eE][sS]|[yY] )
            eval $SCRIPT
            ;;
        [nN][oO]|[nN] )
            echo "passez l'installation de ${PROGRAM_NAME}"
            ;;
        * ) 
            echo "refus d'installer"
            ;;
    esac
done

########################################
# end
########################################
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
