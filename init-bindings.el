(require-package 'key-chord)
(require 'key-chord)

;;; auto-indent on RET
(global-set-key (kbd "RET") 'newline-and-indent)
;(defun set-newline-and-indent ()
;  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'css-mode-hook 'set-newline-and-indent)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "<f6>") 'toggle-theme)
(global-set-key (kbd "<f12>") 'magit-status)

(global-set-key (kbd "<C-tab>") 'escreen-goto-next-screen)
(global-set-key (kbd "<C-prior>") 'escreen-goto-prev-screen)
(global-set-key (kbd "<C-next>") 'escreen-goto-prev-screen)
(global-set-key (kbd "M-J") 'escreen-goto-next-screen)
(global-set-key (kbd "M-K") 'escreen-goto-prev-screen)

;;; load evil key bindings
(if (boundp 'evil-mode)
   (require 'init-evil-bindings))

(provide 'init-bindings)
