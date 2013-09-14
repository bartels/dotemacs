(setq inhibit-splash-screen 1)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(add-to-list 'load-path user-emacs-directory)

(setq custom-file "~/.emacs/custom.el")
(unless (not (file-exists-p custom-file))
  (load custom-file))

(require 'init-packages)
(require 'init-theme)
(require 'init-editor)
(require 'init-evil)
(require 'init-projectile)
(require 'init-ido)
(require 'init-git)
(require 'init-bindings)
