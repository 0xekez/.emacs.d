;; Visual settings
(setq-default cursor-type 'bar
              show-trailing-whitespace t
              mode-line-format '((:eval (format " %s" (buffer-name)))))

(setq create-lockfiles nil
      ring-bell-function 'ignore
      visible-bell t
      inhibit-startup-message t
      initial-scratch-message nil
      initial-major-mode 'fundamental-mode
      inhibit-startup-buffer-menu t)

(windmove-default-keybindings)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(pixel-scroll-precision-mode)
(electric-indent-mode -1)

;; Remove trailing whitespaces on save
(add-hook 'after-save-hook 'delete-trailing-whitespace)

;; Package management
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t))

(use-package lsp-mode
  :hook ((typescript-mode . lsp)
         (rust-ts-mode . lsp-mode)
         (lsp-mode . (lambda ()
                       (add-hook 'before-save-hook 'lsp-format-buffer nil t))))
  :commands lsp
  :config (setq lsp-ui-sideline-enable nil
                lsp-use-plists t
                lsp-idle-delay 0.500
                lsp-modeline-code-actions-enable nil
                lsp-auto-configure t
                lsp-keymap-prefix "s-l"
                lsp-headerline-breadcrumb-enable nil
                lsp-modeline-diagnostics-enable nil))

(use-package company
  :hook (lsp-mode . company-mode)
  :config
  (setq company-idle-delay 0.3
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t
        company-dabbrev-downcase nil))

(defun show-info-at-point ()
  (interactive)
  (let ((message (display-local-help)))
    (if (and message (not (string= message "No local help at point")))
        (lsp-ui-doc--display "help" message)
      (lsp-ui-doc-show))))

(use-package lsp-ui
  :config (setq lsp-ui-doc-enable nil
                lsp-ui-doc-position 'at-point
                lsp-ui-flymake-enable t
                flymake-fringe-indicator-position nil)
  :bind (("s-." . show-info-at-point)
         ("s-," . lsp-ui-doc-hide)))

(use-package typescript-mode
  :hook ((typescript-mode . (lambda ()
                              (add-hook 'before-save-hook 'lsp-eslint-apply-all-fixes nil t)
                              (setq-local typescript-indent-level 2
                                          indent-tabs-mode nil
                                          tab-width 2)))))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))

(add-hook 'emacs-startup-hook
          (lambda ()
            (with-current-buffer "*scratch*"
              (erase-buffer))))

(provide 'init)

(custom-set-variables
 '(package-selected-packages
   '(typescript-mode lsp-ui company)))
(custom-set-faces)
