(require-package 'flycheck)
(require-package 'web-mode)
(require-package 'prettier)

(require 'web-mode)
(require 'flycheck)
(require 'prettier)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (prettier-mode)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'web-mode-hook (lambda ()
				  (setq indent-tabs-mode nil)
				  (setq tab-width 2)
				  (setq web-mode-enable-auto-quoting nil)
				  (setq web-mode-markup-indent-offset 2)))

(eval-after-load "tide"
  '(local-set-key (kbd "s-l r r") 'tide-rename-symbol))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(provide 'init-tide)
