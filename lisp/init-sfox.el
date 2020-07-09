;; A small function to look up the current word in searchfox.

(require 'browse-url)

(defun word-at-point ()
  (thing-at-point 'word 'no-properties))

(defun sfox-at-point ()
  (interactive)
  (browse-url (concat
	       "https://searchfox.org/mozilla-central/search?path=&q="
	       (word-at-point))))

(global-set-key (kbd "C-c C-f") 'sfox-at-point)

(provide 'init-sfox)
