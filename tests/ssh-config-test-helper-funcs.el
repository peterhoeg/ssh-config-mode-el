;;
;; ssh-config-mode-el/tests/ssh-config-test-helper-funcs.el ---
;;

(defun ssh-known-hosts-mode-reload ()
  "A helper for testing ssh-known-hosts-mode in a buffer.
Reeval the ssh-config mode and reenable it."
  (interactive)
  ;; in case we crash
  (save-some-buffers)
  ;; reload the code.
  (makunbound 'ssh-known-hosts-font-lock-keywords)
  (let ((buf (get-buffer "ssh-config-mode.el")))
    (when buf
      (eval-buffer buf)))
  ;; reenable the mode.
  (fundamental-mode)
  (font-lock-mode 0)
  (ssh-known-hosts-mode)
  (font-lock-fontify-buffer))
