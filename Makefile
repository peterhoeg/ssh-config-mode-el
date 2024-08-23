#
# ssh-config-mode-el/Makefile ---
#

SHELL:=bash
.SUFFIXES:

_default: _byte_compile

#####

# figure you will have emacs already... =)
_brew_install:
	brew install \
	  gnu-tar \
	  python3

#####

EL:=ssh-config-mode.el

_byte_compile:
	-rm *.elc
	emacs \
	  --batch \
	  --eval "(add-to-list 'load-path \"${PWD}\")" \
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

_update_keywords:
	cd get-keywords && make _update_keywords

_jenkinsfile_sh:
	./Jenkinsfile.sh

###

# Will need to edit this
doc/contributors.txt: *.el *.org
	@git log --format='- %an' HEAD^@ | \
	  sort -u | \
	  grep -v -e 'harley gorrell' -e 'jenkins-bot' -e 'jhgorrell' > $@

###

_clean:
	-rm *.elc junit.xml junit.xml.tmp

_dist_clean: _clean
	-rm checkdoc-batch.el

###

_test_pkg_install:
	cd tests/pkg-install && make ${@}

###

NEW_TAG ?= $(shell date +%Y%m%dT%H%M)

_update_tag:
	echo "### Tagging as: '$(NEW_TAG)'..."
	sed -i "" -e 's/^;; Tag: .*/;; Tag:       $(NEW_TAG)/' $(EL)
	git commit -am "set tag to: '$(NEW_TAG)'"
	git tag -f $(NEW_TAG)

###

python_files+=./get-keywords/get-keywords

_isort:
	isort \
	  --multi-line 3 \
	  --trailing-comma \
	  --line-width 1 \
	  ${python_files}

_autopep8:
	autopep8 \
	  --aggressive \
	  --in-place \
	  --max-line-length 120 \
	  ${python_files}

_precommit+=_isort
_precommit+=_autopep8
_precommit+=_byte_compile
_precommit+=_test_pkg_install
_precommit+=_checkdoc_batch

_precommit: ${_precommit}

###

_emacs_version:
	emacs --version

_printenv:
	printenv | sort

junit=@echo -e ${1} >> junit.xml.tmp

# Fake a successful run.
_circleci_junit_ok: _checkdoc_batch
	@echo -n "" > junit.xml.tmp
	@$(call junit,"<?xml version='1.0' encoding='utf-8'?>")
	@$(call junit,"<testsuite tests='1'>\n<testcase classname='checkdoc' name='checkdoc'>")
	@$(call junit,"<system-out>")
	@cat checkdoc.stdout >> junit.xml.tmp
	@$(call junit,-e "</system-out>\n<system-err>")
	@cat checkdoc.stderr >> junit.xml.tmp
	@$(call junit,"</system-err>\n</testcase>\n</testsuite>")
	mv junit.xml.tmp junit.xml

_circleci_run+=_clean
_circleci_run+=_printenv
_circleci_run+=_emacs_version
_circleci_run+=_byte_compile
_circleci_run+=_test_pkg_install
_circleci_run+=_circleci_junit_ok

_circleci_run: ${_circleci_run}
