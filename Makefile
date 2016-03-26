#
# ~/share/emacs/pkg/Makefile ---
#
# $Id: Makefile,v 1.2 2011/11/26 22:43:18 harley Exp $
#

SHELL:=bash

###

EL:=ssh-config-mode.el
_default: _byte_compile

_byte_compile:
	emacs --batch \
	  --funcall batch-byte-compile \
	  ${EL}

checkdoc-batch.el:
	wget -O ${@}.tmp http://download.tuxfamily.org/user42/${@}
	mv ${@}.tmp ${@}

_checkdoc_batch: | checkdoc-batch.el
	emacs --batch \
	  --load ${PWD}/checkdoc-batch.el \
	  --funcall checkdoc-batch-commandline \
	  ${EL}


_dist_clean:
	rm checkdoc-batch.el

###

NEW_TAG ?= $(shell date +%Y%m%dT%H%M)

_update_tag:
	echo "### Tagging as: '$(NEW_TAG)'..."
	sed -i "" -e 's/^;; Tag: .*/;; Tag:       $(NEW_TAG)/' $(EL)
	git commit -am "set tag to: '$(NEW_TAG)'"
	git tag -a $(NEW_TAG) -m $(NEW_TAG)

###

_emacs_version:
	emacs --version

_circleci: _emacs_version _byte_compile _checkdoc_batch 

