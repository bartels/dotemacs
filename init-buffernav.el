
(defun my-next-buffer ()
  "next-buffer, only skip *special buffers"
  (interactive)
  (next-buffer)
  (when (string-match "^\*" (buffer-name))
      (my-next-buffer)))

(defun my-previous-buffer ()
  "previous-buffer, only skip *special buffers"
  (interactive)
  (previous-buffer)
  (when (string-match "^\*" (buffer-name))
      (my-previous-buffer)))


(provide 'init-buffernav)
