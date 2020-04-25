(require 'init-elpa)

;; Make sure that emacs gets run from the propper enviroment so that
;; commands like Make work properly.

(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
