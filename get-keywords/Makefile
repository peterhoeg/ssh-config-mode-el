#
# ssh-config-mode-el/gen-keywords/Makefile ---
#

SHELL:=bash

_default: _update_keywords

#####

openssh-portable:
	git clone "git@github.com:openssh/openssh-portable.git" ${@}

_update_openssh: | openssh-portable
	cd openssh-portable && \
	  git pull

_get_keywords: | openssh-portable
#
	rm -f ./keywords.txt
#
	./get-keywords \
	   --output-file ./keywords.txt \
	  ./openssh-portable/readconf.c
	mv keywords.txt ../ssh-config-keywords.txt

_update_keywords: _update_openssh _get_keywords

#####

_get_keywords_debug:
	./get-keywords \
	  --debug \
	  ./openssh-portable/readconf.c
