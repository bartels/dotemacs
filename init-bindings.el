(require-package 'key-chord)
(require 'key-chord)

;;; auto-indent
(global-set-key (kbd "RET") 'newline-and-indent)
;(defun set-newline-and-indent ()
;  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'css-mode-hook 'set-newline-and-indent)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "<f6>") 'toggle-theme)
(global-set-key (kbd "<f12>") 'magit-status)

(global-set-key (kbd "<C-tab>") 'my-next-buffer)
(global-set-key (kbd "<C-prior>") 'my-previous-buffer)
(global-set-key (kbd "<C-next>") 'my-next-buffer)

;;; evil key bindings
(if (boundp 'evil-mode)
   (require 'init-evil-bindings))

(provide 'init-bindings)
