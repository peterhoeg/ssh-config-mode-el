#
# ssh-config-mode-el/gen-keywords/Makefile ---
#

SHELL:=bash

_default: _update_keywords

#####

ifeq (${GITHUB_ACTIONS},)
# use ssh for humans...
  openssh_portable_url:="git@github.com:openssh/openssh-portable.git"
else
# ...https for robots
  openssh_portable_url:=https://github.com/openssh/openssh-portable.git
endif

openssh-portable:
	git clone ${openssh_portable_url} ${@}

# Get the latest tagged version.
_update_openssh: | openssh-portable
	cd openssh-portable && \
          git config advice.detachedHead false && \
	  git fetch && \
          git checkout $(git describe --tags $(git rev-list --tags --max-count=1))

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
