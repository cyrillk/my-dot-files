
;; ==================================================
;; scala
;; ==================================================

;; ==================================================
;; https://github.com/ensime/ensime-server/issues/670
;; ==================================================
(setenv "PATH" (concat "/usr/local/bin/sbt/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin/scala/bin:" (getenv "PATH")))

(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))
(require 'scala-mode2)

(unless (package-installed-p 'ensime)
  (package-refresh-contents) (package-install 'ensime))
(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


