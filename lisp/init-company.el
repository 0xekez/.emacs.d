(require-package 'company)

(require 'company)

;; https://iqss.github.io/IQSS.emacs/init.html#auto-complete_configuration

(setq company-require-match nil
      company-async-timeout 6
      company-idle-delay 0.2
      company-minimum-prefix-length 5
      company-global-modes '(not term-mode))

;; Add `company-elisp' backend for elisp.
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (require 'company-elisp)
             (push 'company-elisp company-backends)))
