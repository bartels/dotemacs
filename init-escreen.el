(require-package 'escreen)
(require 'escreen)

;;; init escreen
(setq escreen-prefix-char "\C-a"
      escreen-max-screens 100)
(escreen-install)


;;;; window/screen management
(defun escreen-close-window-or-screen ()
  "Closes escreen screen if there is only one window in the screen, otherwise
deletes the current window."
  (interactive)
  (if (one-window-p)
      (escreen-kill-screen)
    (delete-window)))


;;; escreen "tabs"
; escreen provides an interface similar to gnu screen where switching between
; screens preserves your buffers and window configurations. But it does not
; provide a good interface for seeing which screens are available, and which is
; the active one.  The below code displays the active escreen screens, and shows
; which screen is currently being viewed in a "tab-like" interface in the
; message area at hte bottom of the screen.
(defun escreen-get-number-and-name (config)
  "Returns (number . buffer-name) for the escreen config"
  (cons
   (escreen-configuration-screen-number config)
   (buffer-name (car (car (car (escreen-configuration-data-map config)))))))

(defun escreen-get-active-screen-names ()
  "Returns active screen nums & names sorted by num"
  (sort
   (mapcar 'escreen-get-number-and-name escreen-configuration-alist)
   (lambda (a b) (< (car a) (car b)))))

(defun escreen-active-screen-names ()
  "Returns labels for the active screens with current screen emphasized"
  (interactive)
  (mapconcat
   (lambda (item)
     (let* ((screen-num (car item))
            (screen-name (cdr item))
            (label (format "%s: %s" screen-num screen-name)))
       (if (= escreen-current-screen-number screen-num)
           (propertize label 'face '('bold 'underline))
         (propertize label 'face '('default)))))
   (escreen-get-active-screen-names)
   " "))

(defun escreen-show-active-screen-names ()
  "Shows message \"tabbar\" containing escreen labels with active one highlighted"
  (interactive)
  (message (escreen-active-screen-names)))

(add-hook 'escreen-goto-screen-hook 'escreen-show-active-screen-names)
(define-key escreen-map "l" 'escreen-show-active-screen-names)

(provide 'init-escreen)
