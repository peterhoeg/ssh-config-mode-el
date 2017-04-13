#!/bin/bash
#
# ssh-config-mode-el/Jenkinsfile.sh ---
#

make _update_keywords

ssh_git_id=$(cd get-keywords/openssh-portable ; git describe --always --dirty --long --tags)
echo "### ssh_git_id: ${ssh_git_id}"

if ! git diff --exit-code --name-only ssh-config-keywords.txt
then
  echo "### ssh-config-keywords.txt: updated to ${ssh_id}"
  git commit -m "ssh-config-keywords.txt: updated to ${ssh_git_id}"
  git tag "${ssh_git_id}"
  git push
fi
