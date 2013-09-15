(require-package 'projectile)
(require 'projectile)

(setq projectile-indexing-method 'alien)
(setq projectile-git-command "find . type f -print0")
(setq projectile-require-project-root nil)
(setq projectile-enable-caching t)
(setq projectile-cache-file (concat user-cachedir "projectile.cache" ))
(setq projectile-known-projects-file (concat user-cachedir "projectile-bookmarks.eld" ))

(setq projectile-globally-ignored-directories
      (append projectile-globally-ignored-directories
              '("tmp")))

(after-load 'projectile
    (diminish 'projectile-mode))

(projectile-global-mode)

(provide 'init-projectile)
