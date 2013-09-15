(require-package 'magit)

(setq-default
 magit-save-some-buffers nil
 magit-diff-refine-hunk t
 magit-completing-read-function 'magit-ido-completing-read)

(eval-after-load 'magit
  '(progn
    ;; Don't let magit-status mess up window configurations
    ;; http://whattheemacsd.com/setup-magit.el-01.html
    (defadvice magit-status (around magit-fullscreen activate)
      (window-configuration-to-register :magit-fullscreen)
      ad-do-it
      (delete-other-windows))

    (defun magit-quit-session ()
      "Restores the previous window configuration and kills the magit buffer"
      (interactive)
      (kill-buffer)
      (when (get-register :magit-fullscreen)
        (ignore-errors
          (jump-to-register :magit-fullscreen))))

    (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)))

(provide 'init-git)
