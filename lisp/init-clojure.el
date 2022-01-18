(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'lsp-mode)

(add-hook 'clojure-mode-hook 'lsp)

(defun lsp-clojure-install-save-hooks ()
  (add-hook 'before-save-hook 'lsp-format-buffer t t))
(add-hook 'clojure-mode-hook 'lsp-clojure-install-save-hooks)

(provide 'init-clojure)
