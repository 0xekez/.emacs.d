(require 'init-elpa)
(require-package 'company)
(require 'company)

;; Add `company-elisp' backend for elisp.
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (require 'company-elisp)
             (push 'company-elisp company-backends)))


(setq company-tooltip-align-annotations t)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company-mode)
