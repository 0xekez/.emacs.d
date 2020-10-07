;; Load files from the lisp directory.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-exec-path)
(require 'init-ui)
(require 'splash-screen)
(require 'init-editing)
(require 'init-company-mode)
(require 'init-rust)
(require 'init-cpp)
(require 'init-sfox)
(require 'init-hack)

(provide 'init)

;; Try and make emacs faster:
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet-snippets yasnippet yasnippit company-racer lsp-ui lsp-mode racer vagrant vagrant-tramp zoom fzf rainbow-mode web-mode rebecca-theme rainbow-delimiters prettier-js golden-ratio go-mode flycheck-rust exec-path-from-shell deferred cmake-mode cargo ample-theme add-node-modules-path))
 '(safe-local-variable-values '((MODE1350 . C++)))
 '(send-mail-function 'mailclient-send-it)
 '(zoom-size '(0.412 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "VioletRed3")))))
