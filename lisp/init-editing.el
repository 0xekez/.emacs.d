(require 'init-elpa)
(require 'saveplace)
(require-package 'rainbow-delimiters)
(require-package 'flycheck)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
;; I actually prefer to have these disabled because more often than I
;; want a regex search I want to search for some sort of rust or C++
;; pointer.
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)
;; (global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace

(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-c C-x") #'toggle-comment-on-line)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'init-editing)
;;; init-editing.el ends here
