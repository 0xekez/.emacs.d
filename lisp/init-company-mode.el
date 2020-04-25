(require 'init-elpa)
(require-package 'company)
(require 'company)

(setq company-tooltip-align-annotations t)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company-mode)
