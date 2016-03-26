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
	  ${EL} 1> checkdoc.stdout 2> checkdoc.stderr ; \
	cat checkdoc.stdout checkdoc.stderr

###

_clean:
	-rm *.elc junit.xml junit.xml.tmp

_dist_clean: _clean
	-rm checkdoc-batch.el

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

junit=@echo -e ${1} >> junit.xml.tmp

_circleci_junit: _checkdoc_batch
	@echo -n "" > junit.xml.tmp
	@$(call junit,"<?xml version='1.0' encoding='utf-8'?>")
	@$(call junit,"<testsuite tests='1'>\n<testcase classname='checkdoc' name='checkdoc'/>")
	@$(call junit,"<system-out>")
	@cat checkdoc.stdout >> junit.xml.tmp
	@$(call junit,-e "<system-out/>\n<system-err>")
	@cat checkdoc.stderr >> junit.xml.tmp
	@$(call junit,"<system-err/>\n<testcase/>\n<testsuite/>")
	mv junit.xml.tmp junit.xml

_printenv:
	printenv | sort

_circleci_run: _clean _printenv _emacs_version _byte_compile _circleci_junit
