;;
;; ssh-config-mode-el/tests/pkg-install/test-init.el ---
;;

(require 'package)

;; When you run this you are testing the pubished version,
;; not the one in this directory.
;;(add-to-list
;; 'package-archives
;; '("melpa" . "https://melpa.org/packages/") t)

;; Add this directory as the only archive.
(setq
 package-archives
 (list
  (cons "bogus" (getenv "PWD"))))

(setq
 package-unsigned-archives
 (list "bogus"))

(package-initialize)
(package-refresh-contents)

(setq debug-on-error t)

(package-install 'ssh-config-mode)

;;(package-list-packages)
