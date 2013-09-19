;;; "kj" ESC
(key-chord-mode 1)
(setq key-chord-one-key-delay 0.3)
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

;;; leader keys
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states t)

(evil-leader/set-key
  "l" 'whitespace-mode
  "w" 'escreen-close-window-or-screen
  "k" 'evil-delete-buffer
  "v" 'split-window-horizontally
  "s" 'split-window-vertically
  "e" 'eval-buffer-or-region
  "h" 'help
  "t" 'escreen-create-screen
  "<SPC>" 'evil-ex-nohighlight
  "f" 'projectile-find-file
  "b" 'ido-switch-buffer
  "d" 'find-function-at-point)

;;; evil motion state
(fill-keymap evil-motion-state-map
  "C-h" 'evil-window-left
  "C-j" 'evil-window-down
  "C-k" 'evil-window-up
  "C-l" 'evil-window-right)

(add-hook 'ediff-keymap-setup-hook
          '(lambda ()
             (fill-keymap ediff-mode-map
               "C-h" 'evil-window-left
               "C-j" 'evil-window-down
               "C-k" 'evil-window-up
               "C-l" 'evil-window-right)))

;;; evil normal state
(fill-keymap evil-normal-state-map
  "gt" 'escreen-goto-next-screen
  "gT" 'escreen-goto-prev-screen)

;;; evil insert state
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

;;; custom ex bindings
(evil-ex-define-cmd "tabe[dit]" 'evil-tabedit)
(evil-ex-define-cmd "diffthis" 'ediff-visible-windows)
(evil-ex-define-cmd "diffwin[dows]" 'ediff-visible-windows)

(provide 'init-evil-bindings)
