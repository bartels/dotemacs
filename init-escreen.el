(require-package 'escreen)
(require 'escreen)

;;; set escreen key prefix
(setq escreen-prefix-char "\C-a"
      escreen-max-screens 100)
(escreen-install)

;;; escreen screens "tabbar"
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
            (label (format " %s: %s " screen-num screen-name)))
       (if (= escreen-current-screen-number screen-num)
           (propertize label 'face '('bold 'underline))
         (propertize label 'face '('default)))))
   (escreen-get-active-screen-names)
   ""))

(defun escreen-show-active-screen-names ()
  "Shows message tabbar containing escreen labels with active one highlighted"
  (interactive)
  (message (escreen-active-screen-names)))

(add-hook 'escreen-goto-screen-hook 'escreen-show-active-screen-names)
(define-key escreen-map "l" 'escreen-show-active-screen-names)

(provide 'init-escreen)
