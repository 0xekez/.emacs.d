(require 'init-elpa)
(require-package 'rebecca-theme)
(require-package 'zoom)
;; (require-package 'golden-ratio)

;; (require 'golden-ratio)
(require 'zoom)
(zoom-mode t)

(custom-set-variables
 ;; two thirds of golden ratio and golden ratio.
 '(zoom-size '(0.412 . 0.618)))

(setq inhibit-startup-message nil)
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)
(xterm-mouse-mode 1)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'solo-jazz t)
(load-theme 'rebecca t)

;; Set to 0 to disable blinking. I like blinking because it draws more
;; attention to the cursor.
(blink-cursor-mode t)
(setq-default cursor-type 'bar)
(setq ring-bell-function 'ignore)

(line-number-mode 1)
(column-number-mode 1)

; Customze the mode line. This is taken from Gwern's emacs:
; https://en.wikipedia.org/wiki/User%3AGwern%2F.emacs
(setq mode-line-format
      '("-"
        mode-line-mule-info
        mode-line-modified
        mode-line-frame-identification
        mode-line-buffer-identification
        "  "
        global-mode-string
        "   %[(" mode-name mode-line-process minor-mode-alist "%n"
        ")%]--"
        (line-number-mode "L%l--")
        (column-number-mode "C%c--")
        (-3 . "%p")
        "-%-"))

(current-column)
(line-number-at-pos)

(provide 'init-ui)


