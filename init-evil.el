(require-package 'evil)
(require-package 'evil-leader)
(require-package 'surround)

(setq evil-search-module 'evil-search
      evil-move-cursor-back nil
      evil-cross-lines t
      evil-default-cursor t)

(require 'evil)
(require 'evil-leader)
(require 'surround)

(global-evil-leader-mode)
(evil-mode t)
(global-surround-mode t)

;(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
;(setq evil-emacs-state-modes nil)

(evil-define-command evil-tabedit (file &optional bang)
  "Open FILE in a new escreen tab"
  :repeat nil
  (interactive "<f><!>")
  (progn (escreen-create-screen)
         (if file
              (evil-edit file))))

(provide 'init-evil)
