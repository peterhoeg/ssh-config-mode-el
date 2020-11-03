#
# ssh-config-mode-el/tests/pkg-install/Makefile ---
#

SHELL:=/bin/bash
.SUFFIXES:

_default: _test_pkg_install

#####

# Took the package setup and definitions from here and modfied them:
# - wget http://www.melpa.org/packages/archive-contents
# - wget http://www.melpa.org/packages/ssh-config-mode-20191221.1051.tar

# use "gtar" if found (for OSX)
tar_exe=$(word 1,$(shell type -p gtar) $(shell type -p tar))

# This is our bogus package for testing.
scm_name:=ssh-config-mode-99998877.1234
scm_tar:=./${scm_name}.tar

${scm_tar}: Makefile \
	ssh-config-mode-pkg.el \
	../../ssh-config-mode.el \
	../../ssh-config-keywords.txt
#
	${tar_exe} -cv \
	  --transform 's,^\.,${scm_name},' \
	  -f ${@} \
	  ./ssh-config-mode-pkg.el \
	  -C ../.. \
	  ./ssh-config-mode.el \
	  ./ssh-config-keywords.txt
#
	tar -tf ${@}

_build_tar: ${scm_tar}

_test_pkg_install: ${scm_tar}
# remove the existing install
	rm -rf ~/.emacs.d/elpa/ssh-config-mode-*
# install ssh-config-mode non-interactively
	emacs --batch -Q -l test-pkg-install.el
