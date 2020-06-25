(require-package 'company)

(require 'company)

;; https://iqss.github.io/IQSS.emacs/init.html#auto-complete_configuration

(setq company-require-match nil
      company-async-timeout 6
      company-idle-delay 5
      company-minimum-prefix-length 5
      company-global-modes '(not term-mode))
