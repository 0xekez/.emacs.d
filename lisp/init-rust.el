;; This rust setup uses rust analyzer as a backend and is riciculously
;; powerful.

(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'rust-mode)
(require-package 'yasnippet-snippets)

;; s-l g g - goto definition
;; s-l f r - goto reference
;; s-l a a - execute code action
;; s-l r r - rename symbol at point
(add-hook 'rust-mode-hook 'lsp)
(setq lsp-rust-server 'rust-analyzer)

(setq company-minimum-prefix-length 3
      company-idle-delay 0.1) ;; default is 0.2

;; C-c C-c C-r - run
;; C-c C-c C-b - build
;; C-c C-c C-t - test
(add-hook 'rust-mode-hook 'cargo-minor-mode)
;; run this to let lsp expand snippets.
(yas-global-mode)

(setq lsp-ui-sideline-show-hover nil)
(setq lsp-auto-configure t)
;; Stop popup boxes at point
(setq lsp-ui-doc-enable nil)
(global-set-key (kbd "s-.") 'lsp-ui-doc-show)
(global-set-key (kbd "s-,") 'lsp-ui-doc-hide)
;; flycheck makes my want to kms myself
(setq lsp-diagnostic-package :none)

(add-hook 'before-save-hook (lambda () (when (eq 'rust-mode major-mode)
                                         (rust-format-buffer))))


(defface lsp-ui-sideline-code-action
  '((default :foreground "#afafff")
    (((background light)) :foreground "#afafff"))
  "Face used to highlight code action text."
  :group 'lsp-ui-sideline)

(provide 'init-rust)
