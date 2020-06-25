(require 'init-elpa)
(require-package 'company)
(require-package 'racer)
(require-package 'rust-mode)

(require 'company)
(require 'racer)
(require 'rust-mode)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; Use spaces instead of tabs.
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
;; C-c C-c C-r - run
;; C-c C-c C-b - build
;; C-c C-c C-t - test
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(eval-after-load 'cargo 
  '(define-key cargo-minor-mode-map (kbd "C-c C-c C-s") 'cargo-process-clippy))

;; Format buffer on save
(add-hook 'rust-mode-hook
          (lambda ()
            (add-hook 'before-save-hook  'rust-format-buffer)))

(provide 'init-rust)
