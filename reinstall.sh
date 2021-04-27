#!/usr/bin/env bash
## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')"
GREEN="$(printf '\033[32m')"
ORANGE="$(printf '\033[33m')"
BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"
CYAN="$(printf '\033[36m')"
WHITE="$(printf '\033[37m')"
BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"
GREENBG="$(printf '\033[42m')"
ORANGEBG="$(printf '\033[43m')"
BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"
CYANBG="$(printf '\033[46m')"
WHITEBG="$(printf '\033[47m')"
BLACKBG="$(printf '\033[40m')"

# Path
DIR=`pwd`
DES="/usr/share"

reset_color() {
	tput sgr0
	tput op
}
trap reset_color EXIT

check() {
	if ! [[ -d "$DES"/dynamic-wallpaper ]]; then
		echo "${RED}[*] FAILED: Dynamic Wallpaper directory does not exist!${WHITE}"
		exit 1
	fi
}

reinstall_dwall() {
	sudo cp -r "$DIR"/dwall.sh "$DES"/dynamic-wallpaper
	sudo chmod +x "$DES"/dynamic-wallpaper/dwall.sh
}

echo -e ${ORANGE}"[*] Reinstalling Dynamic Wallpaper..."${WHITE}
check
reinstall_dwall
echo -e ${GREEN}"[*] Installed Successfully. Execute 'dwall' to Run."${WHITE}
