(require-package 'projectile)
(require 'projectile)

(setq projectile-indexing-method 'alien
      projectile-require-project-root nil
      projectile-enable-caching t
      projectile-cache-file (concat user-cachedir "projectile.cache" )
      projectile-known-projects-file (concat user-cachedir "projectile-bookmarks.eld"))

(setq projectile-globally-ignored-directories
      (append projectile-globally-ignored-directories
              '("tmp"
                ".cache")))

;;; projectile doesn't give a way to specify global patterns to ignore, so we
;;; build the arguments to the file command here with the patterns we want to
;;; ignore
(setq projectile-ignore-patterns
      '("*.elc"
        "*.pyc"
        "*.pyo"
        "*.o"
        "*~"))

(setq projectile-generic-command
      (format "find . -type f \\( %s \\) -print0"
              (mapconcat (lambda (pattern) (format "! -name %s" pattern))
                         projectile-ignore-patterns " ")))


(after-load 'projectile
    (diminish 'projectile-mode))

(require 'projectile)

;; don't use vcs specific files (we want projectile to work on all files in the
;; project directory)
(defun projectile-project-vcs ()
  "Determine the VCS used by the project if any."
  'none)

(projectile-global-mode)

(provide 'init-projectile)
