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
(setq lsp-rust-server 'rust-analyzer)
(add-hook 'rust-mode-hook 'lsp)

;; C-c C-c C-r - run
;; C-c C-c C-b - build
;; C-c C-c C-t - test
(add-hook 'rust-mode-hook 'cargo-minor-mode)
;; run this to let lsp expand snippets.
(yas-global-mode)

;; https://github.com/emacs-lsp/lsp-mode/issues/2525#issuecomment-911757059
(remove-hook 'lsp-configure-hook 'lsp-headerline-breadcrumb-mode)

(setq lsp-ui-sideline-show-hover nil)
(setq lsp-auto-configure t)
(setq lsp-headerline-breadcrumb-enable nil)
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
