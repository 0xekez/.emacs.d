
(if (file-exists-p "/usr/local/bin/python3")
    (setq python-shell-interpreter "/usr/local/bin/python3")
  (setq python-shell-interpreter "/usr/bin/python3"))

(provide 'init-python)
