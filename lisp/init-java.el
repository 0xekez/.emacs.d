(require-package 'lsp-java)

(add-hook 'java-mode-hook 'lsp)
;; (add-hook 'java-mode-hook (lambda () (add-hook 'after-save-hook 'lsp-format-buffer)))
(remove-hook 'after-save-hook 'lsp-format-buffer)

(provide 'init-java)
