#!/bin/bash
#
# ssh-config-mode-el/Jenkinsfile.sh ---
#

# Regenerates "ssh-config-keywords.txt" from the checked out openssh.

if ! make _update_keywords
then
  echo "### update keywords failed."
  exit 1
fi

if [[ ! -d get-keywords/openssh-portable ]]
then
  echo "### update_keywords failed."
  exit 1
fi

# 
openssh_git_id=$(cd get-keywords/openssh-portable ; \
             git describe --always --dirty --long --tags)
echo "### openssh_git_id: ${openssh_git_id}"

if [[ "${openssh_git_id}" = "" ]]
then
  echo "### openssh_git_id failed."
  exit 1
fi
  
if git diff --exit-code --name-only ssh-config-keywords.txt
then
  echo "### no changes to 'ssh-config-keywords.txt'"
else
  echo "### ssh-config-keywords.txt: updating to ${openssh_git_id}"
  git commit -a -m "ssh-config-keywords.txt: updated to ${openssh_git_id}"
  git tag "${openssh_git_id}"
  git push
  echo "### update complete..."
fi
