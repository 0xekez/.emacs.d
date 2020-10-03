![screenshot.png]

My Emacs config. The goal here isn't really to make this usable by
other people and I suspect that a cold install on a new machine would
be missing some dependencies that live elsewhere on my machine. The
things in `lisp/init-ui.el` might be useful for people interested in
making their emacs look better as I quite like how mine looks.

Here's a useful elisp function that I find myself using variations of
with some frequency:

```elisp
(defun single_char_token (char token)
  (interactive "schar: \nstoken: \n")
    (save-excursion
      (insert (format "'%s' => {self.advance(); self.make_tok_at_position(TokenType::%s)}" char token))))
```

It essentially inserts some text at point with based on some
interractive arguments. I find myself using something like this often
when I'm writing tokenizers becuase there is always a tedious bit
where you've got to make all the builtin tokens get recognized.
