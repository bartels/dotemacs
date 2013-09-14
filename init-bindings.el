(require-package 'key-chord)
(require 'key-chord)

;;; auto-indent
(global-set-key (kbd "RET") 'newline-and-indent)
;(defun set-newline-and-indent ()
;  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'css-mode-hook 'set-newline-and-indent)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "<f6>") 'toggle-theme)

;;; evil key bindings
(if (boundp 'evil-mode)
   (require 'init-evil-bindings))

(provide 'init-bindings)
