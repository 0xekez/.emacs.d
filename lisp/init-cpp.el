;; This file handles setting up rtags and its keybindings. An astute
;; observer might notice that you'll need to have rtags installed and
;; running / setup on your dir for this to work. They'd be
;; right. You'll need to do that :)

(require 'init-elpa)

;; Indents C switch statments in a sane manner.
(c-set-offset 'case-label '+)
(c-set-offset 'inlambda 0)
(add-hook 'c-mode-common-hook
          (lambda () (define-key c-mode-base-map (kbd "C-c l") 'compile)))

(setq company-backends (delete 'company-clang company-backends))

(require-package 'company-ctags)

(with-eval-after-load 'company
  (company-ctags-auto-setup))

(provide 'init-cpp)
