(setq inhibit-splash-screen 1)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq default-frame-alist '((width . 160) (height . 56)))

(add-to-list 'load-path user-emacs-directory)
(defvar user-cachedir
  (concat user-emacs-directory ".cache/")
  "Top-level of directory to use for any cache files.")


(setq custom-file "~/.emacs/custom.el")
(unless (not (file-exists-p custom-file))
  (load custom-file))

(require 'init-utils)
(require 'init-packages)
(require 'init-theme)
(require 'init-editor)
(require 'init-escreen)
(require 'init-buffernav)
(require 'init-evil)
(require 'init-ediff)
(require 'init-auto-complete)
(require 'init-projectile)
(require 'init-ido)
(require 'init-git)
(require 'init-bindings)
