#!/bin/bash
clear

BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[92m'
YELLOW='\e[33m'
ORANGE='\e[93m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
NC='\e[0m'
purpal='\033[35m'

echo -e "${ORANGE} "
echo ""
echo "	  _____       _ _   _____           _                 ";
echo "	 | ____|_   _(_) | |_   _|__   ___ | |___  v1.4 Beta  ";
echo "	 |  _| \ \ / / | |   | |/ _ \ / _ \| / __|            ";
echo "	 | |___ \ V /| | |   | | (_) | (_) | \__ \            ";
echo "	 |_____| \_/ |_|_|   |_|\___/ \___/|_|___/	      ";
echo "	                                                      ";
echo "	     	Pages & cPanel Phishing Tools                 ";
echo "                                                        ";
echo -e "${BLUE}       EvilTools Must Run As Root During Installation ${NC}"


echo ""
echo -e ${CYAN}              "Select Best Option : "
echo ""
echo -e "${WHITE}[1] Kali Linux / Parrot-Os "
echo -e "${WHITE}[0] Exit "
echo ""
echo -n -e "EvilTools =>> "
read choice
INSTALL_DIR="/usr/share/doc/ch3r0"
BIN_DIR="/usr/bin/"
if [ $choice == 1 ]; then 
	echo "[*] Checking Internet Connection .."
	wget -q --tries=10 --timeout=20 --spider http://google.com
	if [[ $? -eq 0 ]]; then
	    echo -e ${BLUE}"[✔] Loading ... "
	    sudo apt-get update && apt-get upgrade 
	    sudo apt-get install python3 python3-pip python3-dev -y
	    sudo apt-get install python-pip
	    sudo apt update
	    sudo apt install python3-pip
	    echo "[✔] Checking directories..."
	    if [ -d "$INSTALL_DIR" ]; then
	        echo "[!] A Directory Evil Was Found.. Do You Want To Replace It ? [y/n]:" ;
	        read input
	        if [ "$input" = "y" ]; then
	            rm -R "$INSTALL_DIR"
	        else
	            exit
	        fi
	    fi
		echo ""; 
		echo "[✔] Trying to installing Requirements ..."
		sudo pip3 install licensing
		sudo pip3 install bs4
    		echo "[✔] Installing ...";
		echo "";
		wget https://raw.githubusercontent.com/lhost25/EvilTools/main/evil.py && python3 evil.py;
		echo "#!/bin/bash
		python3 evil.py" '${1+"$@"}' > evil;
		sudo chmod +x evil;
		sudo cp evil /usr/bin/;
		rm evil;
	else 
		echo -e $RED "Please Check Your Internet Connection ..!!"
	fi

    if [ -d "$INSTALL_DIR" ]; then
        echo "";
        echo "[✔] Successfuly Installed !!! ";
        echo "";
        echo "";
        echo -e $ORANGE "		[+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
        echo 		"		[+]						      		[+]"
        echo -e $ORANGE  "		[+]             ✔✔✔ Now Just Type In Terminal ✔✔✔        	[+]"
        echo 		"		[+]						      		[+]"
        echo -e $ORANGE "		[+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
    else
        echo "[✔] Installation Successful !!! ";
        exit
    fi
elif [ $choice -eq 0 ];
then
echo ""
echo -e $WHITE"Thank You!!"
    exit
else 
    echo -e $RED "[!] Select Valid Option [!]"
fi
