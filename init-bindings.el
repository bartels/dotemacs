(require-package 'key-chord)
(require 'key-chord)

;;; auto-indent
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'css-mode-hook 'set-newline-and-indent)
(global-set-key (kbd "RET") 'newline-and-indent)


(evil-leader/set-leader ",")
(evil-leader/set-key
  "w" 'kill-this-buffer
  "l" 'whitespace-mode
  "<SPC>" 'evil-ex-nohighlight
  "f" 'ido-find-file
  "b" 'ido-switch-buffer)

; make "kj" ESC
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(provide 'init-bindings)
