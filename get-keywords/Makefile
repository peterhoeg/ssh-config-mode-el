#
# ssh-config-mode-el/gen-keywords/Makefile ---
#

SHELL:=bash

_default: _run

#####

openssh-portable:
	git clone git@github.com:openssh/openssh-portable.git ${@}

_run: | openssh-portable
	./get-keywords openssh-portable/readconf.c > keywords.txt
	mv keywords.txt ../ssh-config-keywords.txt



