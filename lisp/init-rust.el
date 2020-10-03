;; (require 'init-elpa)
;; (require 'subr-x)
;; (require-package 'company)
;; (require-package 'racer)
;; (require-package 'rust-mode)
;; (require-package 'flycheck-rust)

;; (require 'company)
;; (require 'racer)
;; (require 'rust-mode)

;; (add-hook 'rust-mode-hook 'racer-mode)
;; (add-hook 'racer-mode-hook 'eldoc-mode)
;; (add-hook 'racer-mode-hook 'company-mode)

;; (require 'rust-mode)
;; (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;; (setq company-tooltip-align-annotations t)


;; ;; Use spaces instead of tabs and prevent company from trying to
;; ;; autocomplete in the background. For large rust projects this
;; ;; autocompletion will cause emacs to become unresponsive. Company
;; ;; will still autocomplete when you press tab.
;; (add-hook 'rust-mode-hook
;;           (lambda () (setq indent-tabs-mode nil
;; 			   company-idle-delay nil)))
;; ;; C-c C-c C-r - run
;; ;; C-c C-c C-b - build
;; ;; C-c C-c C-t - test
;; (add-hook 'rust-mode-hook 'cargo-minor-mode)

;; (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

;; ;; Format buffer on save
;; ;; (add-hook 'rust-mode-hook
;; ;;           (lambda ()
;; ;;             (add-hook 'before-save-hook  'rust-format-buffer)))

;; Rust settings
;; (require 'rust-mode)
;; (with-eval-after-load 'rust-mode
;; ;; Rust Formatter. Run rustfmt before saving rust buffers
;; (setq rust-format-on-save t))

;; (require 'lsp-mode) ;; language server protocol
;; (with-eval-after-load 'lsp-mode
;; (add-hook 'rust-mode-hook #'lsp))
;; ;; (add-hook 'rust-mode-hook #'flycheck-mode))

;; ;; Excessive UI feedback for light reading between coding
;; (require 'lsp-ui)
;; (with-eval-after-load 'lsp-ui
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; ;; autocompletions for lsp (available with melpa enabled)
;; (require 'company-lsp)
;; (push 'company-lsp company-backends)

;; ;; tell company to complete on tabs instead of sitting there like a moron
;; (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)

(add-hook 'rust-mode-hook 'racer-mode)
(add-hook 'racer-mode-hook 'eldoc-mode)
(add-hook 'racer-mode-hook 'company-mode)
(setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") 'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
(setq rust-format-on-save t)

;; C-c C-c C-r - run
;; C-c C-c C-b - build
;; C-c C-c C-t - test
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; Flycheck isn't working for me with more complex rust setups
;; (i.e. blog_os)
;; (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)
;; (add-hook 'rust-mode-hook 'flycheck-mode)

(provide 'init-rust)
