#
# ssh-config-mode-el/gen-keywords/Makefile ---
#

SHELL:=bash

_default: _update_keywords

#####

openssh-portable:
	git clone git@github.com:openssh/openssh-portable.git ${@}

_update_openssh: | openssh-portable
	cd openssh-portable && \
	  git pull

_get_keywords: | openssh-portable
	./get-keywords openssh-portable/readconf.c > keywords.txt
	mv keywords.txt ../ssh-config-keywords.txt

_update_keywords: _update_openssh _get_keywords
