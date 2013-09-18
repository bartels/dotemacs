(require 'ido)
(ido-mode t)
(setq ido-everywhere t
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-max-window-height 0.5
      ido-max-prospects 40)

(setq ido-ignore-buffers
    '("\\` " "^\*"))

(require-package 'ido-ubiquitous)
(ido-ubiquitous-mode t)

(require-package 'flx-ido)
(flx-ido-mode t)

(require-package 'ido-vertical-mode)
(ido-vertical-mode)

(require-package 'smex)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse
      uniquify-separator "|"
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

(provide 'init-ido)
