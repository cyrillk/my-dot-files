
;; ==================================================
;; elpy - https://github.com/jorgenschaefer/elpy
;; ==================================================
(unless (package-installed-p 'elpy)
  (package-refresh-contents) (package-install 'elpy))
(require 'elpy)
(elpy-enable)

