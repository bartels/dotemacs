(set-face-attribute 'default nil :font "DejaVu Sans Mono-10")

(require-package 'solarized-theme)
(require-package 'monokai-theme)

(setq solarized-distinct-fringe-background t)
(setq solarized-high-contrast-mode-line t)

(defvar current-theme 'solarized-light)
(load-theme current-theme t)

(defun toggle-theme ()
  "Toggle between a light and dark theme."
  (interactive)
  (disable-theme current-theme)
  (if (eq current-theme 'monokai)
      (setq current-theme 'solarized-light)
    (setq current-theme 'monokai))
  (load-theme current-theme t))

(provide 'init-theme)
