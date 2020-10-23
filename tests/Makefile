#
# ssh-config-mode-el/tests/Makefile ---
#

SHELL:=/bin/bash
.SUFFIXES:

_default: ./known_hosts

#####

# Grab a copy of known_hosts to test with.
# The licences are different, so not checked in.
./known_hosts:
	cp \
	  ../get-keywords/openssh-portable/regress/unittests/hostkeys/testdata/known_hosts \
	  .

