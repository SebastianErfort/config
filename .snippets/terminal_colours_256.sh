for i in {0..255}; do echo -n "$(tput setaf $i)$i $(tput sgr0)"; done; echo
