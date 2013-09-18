;; https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-func.el

;;; feature loading
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;;; keymap helpers
(defun fill-keymap (keymap &rest mappings)
  "Fill `KEYMAP' with `MAPPINGS'.
See `pour-mappings-to'."
  (declare (indent defun))
  (pour-mappings-to keymap mappings))

(defun pour-mappings-to (map mappings)
  "Calls `set-key' with `map' on every key-fun pair in `MAPPINGS'.
`MAPPINGS' is a list of string-fun pairs, with a `READ-KBD-MACRO'-readable string and a interactive-fun."
  (dolist (mapping (group mappings 2))
    (set-key map (car mapping) (cadr mapping)))
  map)

(defun group (lst n)
  "Group `LST' into portions of `N'."
  (let (groups)
    (while lst
      (push (take n lst) groups)
      (setq lst (nthcdr n lst)))
    (nreverse groups)))

(defun take (n lst)
  "Return atmost the first `N' items of `LST'."
  (let (acc '())
    (while (and lst (> n 0))
      (cl-decf n)
      (push (car lst) acc)
      (setq lst (cdr lst)))
    (nreverse acc)))

(defun set-key (map spec cmd)
  "Set in `map' `spec' to `cmd'.

`Map' may be `'global' `'local' or a keymap.
A `spec' can be a `read-kbd-macro'-readable string or a vector."
  (let ((setter-fun (cl-case map
                      (global #'global-set-key)
                      (local #'local-set-key)
                      (t (lambda (key def) (define-key map key def)))))
        (key (cl-typecase spec
               (vector spec)
               (string (read-kbd-macro spec))
               (t (error "wrong argument")))))
    (funcall setter-fun key cmd)))


;;; eval helper
(defun eval-buffer-or-region ()
  "If there is an active region, call eval-region, otherwise eval-buffer"
  (interactive)
  (if (region-active-p)
      (eval-region (region-beginning) (region-end))
    (eval-buffer)))


(provide 'init-utils)
