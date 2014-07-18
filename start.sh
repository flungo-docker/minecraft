#!/bin/bash
shopt -s nocasematch

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

if [ ! -a eula.txt ] || grep 'eula=false' eula.txt
then
	eula_agreement;
fi

java ${MC_JAVA_ARGS} -jar minecraft_server.jar ${MC_ARGS}
