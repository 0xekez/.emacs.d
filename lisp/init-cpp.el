;; This file handles setting up rtags and its keybindings. An astute
;; observer might notice that you'll need to have rtags installed and
;; running / setup on your dir for this to work. They'd be
;; right. You'll need to do that :)

(require 'init-elpa)

;; (require-package 'rtags)
;; (require-package 'company-rtags)

;; (require 'rtags)
;; (require 'company-rtags)

;; Indents C switch statments in a sane manner.
(c-set-offset 'case-label '+)
(c-set-offset 'inlambda 0)

;; (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
;; (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

;;(setq rtags-completions-enabled t
;;      rtags-path "~/.emacs.d/lisp/rtags/src/rtags.el"
;;      rtags-rc-binary-name "~/.emacs.d/lisp/rtags/bin/rc"
;;      rtags-rdm-binary-name "~/.emacs.d/lisp/rtags/bin/rdm")

;; only run this if rtags is installed
;; (when (require 'rtags nil :noerror)
;;   ;; make sure you have company-mode installed
;;   (require 'company)
;;   (define-key c-mode-base-map (kbd "M-.")
;;     (function rtags-find-symbol-at-point))
;;   (define-key c-mode-base-map (kbd "M-,")
;;     (function rtags-find-references-at-point))
;;   ;; install standard rtags keybindings. Do M-. on the symbol below to
;;   ;; jump to definition and see the keybindings.
;;   (rtags-enable-standard-keybindings)
;;   ;; company completion setup
;;   (setq rtags-autostart-diagnostics t)
;;   (rtags-diagnostics)
;;   (setq rtags-completions-enabled t)
;;   (push 'company-rtags company-backends)
;;   (global-company-mode)
;;   (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete)))

(provide 'init-cpp)
