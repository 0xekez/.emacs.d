;; Load files from the lisp directory.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-exec-path)
(require 'init-ui)
(require 'splash-screen)
(require 'init-hack)
(require 'init-ido)
(require 'init-editing)
(require 'init-company-mode)

(require 'init-rust)
(require 'init-go)
(require 'init-cpp)
(require 'init-sfox)
(require 'init-python)
(require 'init-java)

(provide 'init)

;; Try and make emacs faster:
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(rebecca))
 '(custom-safe-themes
   '("21aaea84643951836dbe2c5aec92130bbd034f5d3ab2f116fe782dfb99d886a5" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "67113d2df72009223d28d093754f613fcdeaa4b469041118972b841309da1d6f" "f633d825e380caaaefca46483f7243ae9a663f6df66c5fad66d4cab91f731c86" default))
 '(fci-rule-color "#778ca3")
 '(nrepl-message-colors
   '("#00afef" "#778ca3" "#009c9f" "#778ca3" "#005cc5" "#fa1090" "#009c9f" "#778ca3"))
 '(package-selected-packages
   '(company-ctags websocket magit lsp-javacomp lsp-pyls lsp-python-ms lsp-java company-go use-package yasnippet-snippets yasnippet yasnippit company-racer lsp-ui lsp-mode racer vagrant vagrant-tramp zoom fzf rainbow-mode web-mode rebecca-theme rainbow-delimiters prettier-js golden-ratio go-mode flycheck-rust exec-path-from-shell deferred cmake-mode cargo ample-theme add-node-modules-path))
 '(pdf-view-midnight-colors '("#778ca3" . "#eaeafa"))
 '(safe-local-variable-values '((MODE1350 . C++)))
 '(send-mail-function 'mailclient-send-it)
 '(vc-annotate-background "#04c4c7")
 '(vc-annotate-color-map
   '((20 . "#778ca3")
     (40 . "#00afef")
     (60 . "#778ca3")
     (80 . "#778ca3")
     (100 . "#778ca3")
     (120 . "#009c9f")
     (140 . "#778ca3")
     (160 . "#778ca3")
     (180 . "#778ca3")
     (200 . "#778ca3")
     (220 . "#009c9f")
     (240 . "#005cc5")
     (260 . "#fa1090")
     (280 . "#778ca3")
     (300 . "#005cc5")
     (320 . "#778ca3")
     (340 . "#009c9f")
     (360 . "#778ca3")))
 '(vc-annotate-very-old-color "#778ca3")
 '(zoom-size '(0.412 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "VioletRed3")))))
