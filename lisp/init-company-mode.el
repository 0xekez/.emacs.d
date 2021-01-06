(require 'init-elpa)
(require-package 'company)
(require 'company)

(setq company-tooltip-align-annotations t)
(add-hook 'after-init-hook 'global-company-mode)

;; Add `company-elisp' backend for elisp.
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (require 'company-elisp)
             (push 'company-elisp company-backends)))

;; In a remote shell company can be painfully slow so we disable it.
(defun disable-company-if-remote ()
  (when (and (fboundp 'company-mode)
             (file-remote-p default-directory))
    (company-mode -1)))
(add-hook 'shell-mode-hook 'disable-company-if-remote)

(provide 'init-company-mode)
