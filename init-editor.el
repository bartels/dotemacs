;(global-hl-line-mode)
(global-linum-mode t)
(setq linum-format "%4d")

;;; Store backups in a directory
(setq backup-directory-alist
      `(("." . ,(concat user-cachedir "backups"))))

(setq auto-save-file-name-transforms
      `((".*" ,(concat user-cachedir "auto-save") t)))

(setq savehist-additional-variables '(search-ring regexp-search-ring))
(setq savehist-file (concat user-cachedir "savehist"))
(savehist-mode 1)

;;; spaces/tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-basic-indent 4)

;;; whitespace-mode shows whitespace chars
(require 'whitespace)

(require-package 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)

(require-package 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq-default undo-tree-history-directory-alist
      `(("." . ,(concat user-cachedir "undo" ))))

;;; saner ediff defaults
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(provide 'init-editor)
