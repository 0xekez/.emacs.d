(require 'init-elpa)
(require-package 'go-mode)
(require-package 'company-go)

(require 'go-mode)
(require 'company-go)

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(provide 'init-go)
