(require-package 'key-chord)
(require 'key-chord)

;(defun set-newline-and-indent ()
;  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'css-mode-hook 'set-newline-and-indent)

(fill-keymap global-map
  "RET" 'newline-and-indent
  "M-x" 'smex
  "<f5>" 'undo-tree-visualize
  "<f6>" 'toggle-theme
  "<f12>" 'magit-status
  "<C-tab>" 'escreen-goto-next-screen
  "<C-prior>" 'escreen-goto-prev-screen
  "<C-next>" 'escreen-goto-prev-screen
  "M-j" 'escreen-goto-next-screen
  "M-k" 'escreen-goto-prev-screen)

;;; load evil key bindings
(if (boundp 'evil-mode)
   (require 'init-evil-bindings))

(provide 'init-bindings)
