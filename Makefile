#
# ~/share/emacs/pkg/Makefile ---
#
# $Id: Makefile,v 1.2 2011/11/26 22:43:18 harley Exp $
#

_default: _cvs_up

SUBDIRS:=$(dir $(wildcard */Makefile))

#_subdirs:
#	for dir in ${SUBDIRS} ; do echo ${MAKE} ${MAKEFLAGS} -C $$dir $@ ; done

#
include ./Makefile.inc


#
_jane_push_all:
	scp $(wildcard */*.el) jane:public_html/elisp
