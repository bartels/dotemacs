(require-package 'evil)
(require-package 'evil-leader)
(require-package 'surround)

(setq evil-search-module 'evil-search)

(require 'evil)
(require 'evil-leader)
(require 'surround)

(global-evil-leader-mode)
(evil-mode t)
(global-surround-mode t)

(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

(provide 'init-evil)
