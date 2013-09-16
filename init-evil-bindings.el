(evil-leader/set-leader ",")
(setq evil-leader/in-all-states t)

(defun eval-buffer-or-region ()
  "If there is an active region, call eval-region, otherwise eval-buffer"
  (interactive)
  (if (region-active-p)
      (eval-region (region-beginning) (region-end))
    (eval-buffer)))

;;; leader keys
(evil-leader/set-key
  "l" 'whitespace-mode
  "w" 'delete-window
  "v" 'split-window-horizontally
  "s" 'split-window-vertically
  "e" 'eval-buffer-or-region
  "h" 'help
  "t" 'escreen-create-screen
  "<SPC>" 'evil-ex-nohighlight
  "f" 'projectile-find-file
  "b" 'ido-switch-buffer)

;;; "kj" ESC
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

;;; evil normal state maps
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "gt") 'escreen-goto-next-screen)
(define-key evil-normal-state-map (kbd "gT") 'escreen-goto-prev-screen)

;;; evil insert state maps
(define-key evil-insert-state-map (kbd "C-<return>") 'evil-open-below)
(define-key evil-insert-state-map (kbd "C-S-<return>") 'evil-open-above)

;;; hjkl bindings for magit modes
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)

(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)

(provide 'init-evil-bindings)
