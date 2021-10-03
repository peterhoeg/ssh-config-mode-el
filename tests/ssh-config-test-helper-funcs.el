;;
;; ssh-config-mode-el/tests/ssh-config-test-helper-funcs.el ---
;;
;; (load-file "ssh-config-test-helper-funcs.el")

(defun ssh-known-hosts-mode-reload ()
  "A helper for testing ssh-known-hosts-mode in a buffer.
Reeval the ssh-config mode and reenable it."
  (interactive)
  ;; in case we crash
  (save-some-buffers)
  ;; clean out old values
  (dolist
      (x
       '(
         ssh-known-hosts-font-lock-keywords
         ssh-known-hosts-regex-hashed
         ssh-known-hosts-regex-host
         ssh-known-hosts-regex-hostname
         ssh-known-hosts-regex-ip
         ssh-known-hosts-regex-ipv4
         ssh-known-hosts-regex-ipv6
         ssh-known-hosts-regex-port))
      (makunbound x))
  ;; reload the code.
  (let ((buf (get-buffer "ssh-config-mode.el")))
    (eval-buffer buf))
  ;; reenable the mode.
  (fundamental-mode)
  (font-lock-mode 0)
  (ssh-known-hosts-mode)
  (font-lock-fontify-buffer))
