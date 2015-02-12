
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-stop-list (number-sequence 2 200 2))

;; Config for OSX:
(when (eq window-system 'ns)
  (set-fontset-font "fontset-default" 'symbol "Monaco")
  ;; (set-default-font "Fantasque Sans Mono")
  ;; (set-default-font "Monaco")
  ;; (set-default-font "Anonymous Pro")
  (set-default-font "Inconsolata")
  ;; (set-default-font "Andale Mono")
  ;; (set-default-font "CosmicSansNeueMono")
  ;; (set-default-font "Fira Mono")
  ;; (set-default-font "Luculent")
  ;; (set-default-font "Menlo")
  ;; (set-default-font "Source Code Pro")
  ;; (set-default-font "Mensch")
  (set-face-attribute 'default nil :height 120)
  (set-face-attribute 'fixed-pitch nil :height 120))

;; Anti-aliasing
(setq mac-allow-anti-aliasing t)

;; Config for Linux/X11 systems:
(when (eq window-system 'x)
  ;; Font family
  (set-fontset-font "fontset-default" 'symbol "Bitstream Vera Sans Mono")
  (set-default-font "Bitstream Vera Sans Mono")
  ;; Font size
  (set-face-attribute 'default nil :height 90))

;; ==================================================
;; start maximized
;; ==================================================
(custom-set-variables
  '(initial-frame-alist (quote ((fullscreen . maximized)))))  

;; ==================================================
;; TODO updates the list of packages
;; ==================================================
;; (when (not package-archive-contents)
;;   (package-refresh-contents))

;; ==================================================
;; quit emacs confirmation
;; ==================================================
(global-set-key
  (kbd "C-x C-c")
  (lambda ()
    (interactive)
    (if (y-or-n-p "Quit Emacs? ")
      (save-buffers-kill-emacs))))

;; prevents the creation of backup files
;; (setq make-backup-files nil) 
;; (setq auto-save-default nil)

;; substitute ‘y-or-n-p’ for ‘yes-or-no-p’
(defalias 'yes-or-no-p 'y-or-n-p)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; backspace fix
(global-set-key "\C-h" 'backward-delete-char)

;; allows hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; gets visual indication of an exception
(setq visible-bell 1)

;; turns off alarms completely
(setq ring-bell-function 'ignore)

;;(set-keyboard-coding-system nil)
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)

(setq inhibit-startup-screen t)

;; (menu-bar-mode -1)
;; (scroll-bar-mode -1)
;; (tool-bar-mode -1)
(unless (display-graphic-p) (menu-bar-mode -1))


