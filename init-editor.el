;;; theme
(set-face-attribute 'default nil :font "DejaVu Sans Mono-10")
(require-package 'color-theme-solarized)
(load-theme 'solarized-light t)

;(global-hl-line-mode)
(global-linum-mode t)
(setq linum-format "%3d")

;;; Store backups in a directory
(setq backup-directory-alist
      `((".*" . ,"~/.cache/emacs/backup")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.cache/emacs/auto-save" t)))

(setq savehist-additional-variables '(search-ring regexp-search-ring))
(setq savehist-file "~/.cache/emacs/savehist")
(savehist-mode 1)

;;; spaces/tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-basic-indent 4)

;;; whitespace-mode shows whitespace chars
(require 'whitespace)

(provide 'init-editor)
