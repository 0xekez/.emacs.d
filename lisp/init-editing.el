(require 'init-elpa)
(require 'saveplace)
(require 'hi-lock)
(require 'desktop)

(require-package 'rainbow-delimiters)
(require-package 'flycheck)
(require-package 'fzf)

;; Save the desktop state on Emacs death.

;; !!WARNING!! I like having the behavior that when emacs is launched
;; it does not by default open it last saved session so I have
;; modified the desktop-save-mode definition to prevent that by
;; removing desktop-load from the after-init-hook. This will not
;; happen by default if you are using this file.
(desktop-save-mode 1)

;; Highlights matching parenthesis
(show-paren-mode t)
(setq-default show-trailing-whitespace t)
;; Show trailing whitespace eveywhere except in shell mode where the
;; shell will occasionally show garbage we don't care about.
(add-hook 'shell-mode-hook (lambda ()
			     show-trailing-whitespace nil))
(electric-pair-mode 1)

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

;; M-s h . - highlights the symbol at the cursor.
;; M-s h , - removes highlight from symbol at the cursor.
(defun unhighlight-symbol-at-point ()
  "Remove highlight of symbol at point."
  (interactive)
  (unhighlight-regexp (concat "\\_<" (thing-at-point 'symbol) "\\_>")))
(define-key search-map "h," 'unhighlight-symbol-at-point)

;; Shows the current function in the modeline.
(which-func-mode)

;; TODO(zeke): move this into an org file if we start making more
;; customizations. C-c C-l pastes links in the org file.
(global-set-key (kbd "C-c l") 'org-store-link)

;; These match the mozilla defaults.
(setq tab-width 8
      indent-tabs-mode nil
      c-basic-offset 2)

;; Better colors for diff mode because imho the default ones are a
;; little hard to look at.
(defun update-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute 'diff-added nil
                      :foreground "white" :background "#47611A")
  (set-face-attribute 'diff-removed nil
                      :foreground "white" :background "#9C0D38")
  (set-face-attribute 'diff-changed nil
                      :foreground "white" :background "#E89005"))
(eval-after-load "diff-mode"
  '(update-diff-colors))

;; From <https://emacs.stackexchange.com/questions/24459/revert-all-open-buffers-and-ignore-errors>
(defun zeke/revert-all-file-buffers ()
  "Refresh all open file buffers without confirmation.
Buffers in modified (not yet saved) state in emacs will not be reverted. They
will be reverted though if they were modified outside emacs.
Buffers visiting files which do not exist any more or are no longer readable
will be killed."
  (interactive)
  (dolist (buf (buffer-list))
    (let ((filename (buffer-file-name buf)))
      ;; Revert only buffers containing files, which are not modified;
      ;; do not try to revert non-file buffers like *Messages*.
      (when (and filename
                 (not (buffer-modified-p buf)))
        (if (file-readable-p filename)
            ;; If the file exists and is readable, revert the buffer.
            (with-current-buffer buf
              (revert-buffer :ignore-auto :noconfirm :preserve-modes))
          ;; Otherwise, kill the buffer.
          (let (kill-buffer-query-functions) ; No query done when killing buffer
            (kill-buffer buf)
            (message "Killed non-existing/unreadable file buffer: %s" filename))))))
  (message "Finished reverting buffers containing unmodified files."))
(zeke/revert-all-file-buffers)

;; move between visible buffers with S-<up>/<down>/<left>/<right>
(windmove-default-keybindings)

(autoload 'jflex-mode "jflex-mode" nil t)
(setq auto-mode-alist (cons '("\\(\\.flex\\|\\.jflex\\)\\'" . jflex-mode) auto-mode-alist))

(autoload 'cup-mode "cup-mode" nil t)
(setq auto-mode-alist (cons '("\\(\\.cup\\)\\'" . cup-mode) auto-mode-alist))


(provide 'init-editing)
;;; init-editing.el ends here
