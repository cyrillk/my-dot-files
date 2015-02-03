
;; ==================================================
;; custom functions
;; ==================================================

(defun load-package (pack)
    (unless (package-installed-p pack)
            (package-refresh-contents) 
            (package-install pack)))

(defun require-package (pack)
    (load-package pack)
    (require pack))

(defun xml-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)))

