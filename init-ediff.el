;;; saner ediff defaults
;(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; Helpful command line switch "-diff" to diff two files
(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
        (ediff file1 file2)))

(add-to-list 'command-switch-alist '("diff" . command-line-diff))
;; Usage: emacs -diff file1 file2

;;; diff visible windows
(defun ediff-visible-windows ()
  "Opens ediff mode for the current window & the next"
  (interactive)
  (ediff-windows-linewise 't))

(provide 'init-ediff)
