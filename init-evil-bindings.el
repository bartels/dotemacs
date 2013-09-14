(evil-leader/set-leader ",")
(setq evil-leader/in-all-states t)
(evil-leader/set-key
  "w" 'kill-this-buffer
  "l" 'whitespace-mode
  "v" 'split-window-horizontally
  "s" 'split-window-vertically
  "h" 'help
  "<SPC>" 'evil-ex-nohighlight
  "f" 'projectile-find-file
  "b" 'ido-switch-buffer)

; "kj" ESC
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-insert-state-map (kbd "C-<return>") 'evil-open-below)
(define-key evil-insert-state-map (kbd "C-S-<return>") 'evil-open-above)


(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)

(provide 'init-evil-bindings)
