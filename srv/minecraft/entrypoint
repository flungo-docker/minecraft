#!/bin/bash

# Ingore case for case statements
shopt -s nocasematch

# Function to get user to accept the EULA
function eula_agreement {
	echo "You must agree to the Minecraft EULA to run the minecraft server. Please read the EULA then agree to the terms."
	echo "Minecraft EULA: https://account.mojang.com/documents/minecraft_eula"
	echo ""
	echo -n "Do you agree with the Minecraft EULA? (Yes/No): "
	read response;
	case "$response" in
		yes)
			if [ -a eula.txt ] && grep 'eula=false' eula.txt
			then
				sed -i 's/eula=false/eula=true/' eula.txt
			else
				echo "eula=true" >> eula.txt
			fi
			echo "Thank you for agreeing"
			;;
		no)
			echo "You cannot run a Minecraft Server without agreeing to the EULA."
			exit 1
			;;
		*)
			eula_agreement
			;;
	esac
}

# If EULA file does not exist or states that the eula hasn't been accepted request user accepts the licence agreement
if [ ! -a eula.txt ] || grep 'eula=false' eula.txt
then
	eula_agreement;
fi

# Load environment
. ./environment

java -Xmx${JAVA_XMX} -Xms${JAVA_XMS} ${JAVA_ARGS} -jar minecraft_server.jar ${MC_ARGS}
