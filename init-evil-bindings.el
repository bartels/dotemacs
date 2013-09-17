;;; "kj" ESC
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

(defun eval-buffer-or-region ()
  "If there is an active region, call eval-region, otherwise eval-buffer"
  (interactive)
  (if (region-active-p)
      (eval-region (region-beginning) (region-end))
    (eval-buffer)))

;;; leader keys
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states t)

(evil-leader/set-key
  "l" 'whitespace-mode
  "w" 'escreen-close-window-or-screen
  "v" 'split-window-horizontally
  "s" 'split-window-vertically
  "e" 'eval-buffer-or-region
  "h" 'help
  "t" 'escreen-create-screen
  "<SPC>" 'evil-ex-nohighlight
  "f" 'projectile-find-file
  "b" 'ido-switch-buffer)

;;; evil normal state maps
(fill-keymap evil-normal-state-map
  "C-h" 'evil-window-left
  "C-j" 'evil-window-down
  "C-k" 'evil-window-up
  "C-l" 'evil-window-right
  "gt" 'escreen-goto-next-screen
  "gT" 'escreen-goto-prev-screen)

;;; evil insert state maps
(fill-keymap evil-insert-state-map
  "C-<return>" 'evil-open-below
  "C-S-<return>" 'evil-open-above)

;;; hjkl bindings for magit modes
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)

(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)

(provide 'init-evil-bindings)
