(require-package 'auto-complete)
(require 'auto-complete-config)

(setq ac-comphist-file (concat user-cachedir "ac-comphist.dat"))
(global-auto-complete-mode t)

(provide 'init-auto-complete)
