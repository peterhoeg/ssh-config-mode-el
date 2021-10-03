ssh-config-mode-el/README
==================================================

.. image:: https://melpa.org/packages/ssh-config-mode-badge.svg
   :target: https://melpa.org/#/ssh-config-mode

.. image:: https://circleci.com/gh/jhgorrell/ssh-config-mode-el.svg?style=svg
   :target: https://circleci.com/gh/jhgorrell/ssh-config-mode-el

A mode to edit SSH config files.

It does the following:

- Fontifys the SSH config keywords.
- Keys for skipping from host section to host section.
- Indentation of configuration found in the following locations:

::

    .ssh/config
    sshd?_config
    known_hosts
    authorized_keys2?

If you have a SSH config file that you'd like to use this
mode on automatically, add this line as the first one in the file:

::

    # -*- mode: ssh-config -*-

Or add somthing like this to your init file:

::

    (add-to-list 'auto-mode-alist '("/path-to-your-ssh/config\\'" . ssh-config-mode))

Links
----------------------------------------

- https://github.com/jhgorrell/ssh-config-mode-el
- https://github.com/openssh/openssh-portable


License
----------------------------------------

``ssh-config-mode-el`` is distributed under the
`GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>`_
(or any later version.)

Contributors
--------------------------------------------------

- Harley Gorrell
- John Mastro
- Masahiro Hayashi
- Matthew Weaver
- Sharif Nassar
- Ted Carnahan
- USAMI Kenta
- Wieland Hoffmann
- iory
- Александар Симић
- Andrew Schwartzmeyer
- Eder Elorriaga
- Ville Skyttä
