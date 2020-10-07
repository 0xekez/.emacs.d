(require 'init-elpa)

;; Make sure that emacs gets run from the propper enviroment so that
;; commands like Make work properly.

(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Set the source dir for emacs code
(setq source-directory "~/.emacs.d/emacs/")

(provide 'init-exec-path)
