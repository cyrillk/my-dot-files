(require 'package)

(setq package-archieves '()) ;; empty list of packages
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

(package-initialize)

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

(defun load-user-file (file)
  (interactive "f")
  "Load an 'init' file"
  (load-file (concat "~/.emacs.d/" file)))

(defun format-xml ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)))

;; ==================================================
;; settings
;; ==================================================

;; start maximized
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(initial-frame-alist (quote ((fullscreen . maximized))))
  '(magit-use-overlays nil)
  '(paradox-github-token t))

;; quit emacs confirmation
(global-set-key (kbd "C-x C-c")
                (lambda () (interactive)
                  (if (y-or-n-p "Quit Emacs? ")
                    (save-buffers-kill-emacs))))

;; prevents the creation of backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; substitute ‘y-or-n-p’ for ‘yes-or-no-p’
(defalias 'yes-or-no-p 'y-or-n-p)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; gets visual indication of an exception
(setq visible-bell 1)

;; turns off alarms completely
(setq ring-bell-function 'ignore)

;; hides startup screen
(setq inhibit-startup-screen t)

(menu-bar-mode -1)
;; (unless (display-graphic-p) (scroll-bar-mode -1))
(tool-bar-mode -1)
;; (unless (display-graphic-p) (menu-bar-mode -1))

;; Show line number in the mode line.
(line-number-mode 1)

;; Show column number in the mode line.
(column-number-mode 1)

(setq-default default-tab-width 2)

;; allows to refer to a file by a symlink
(setq-default find-file-visit-truename nil)

;; requires newline at the end of files
(setq require-final-newline t)

(setq split-height-threshold nil)
(setq split-width-threshold 180)

(whitespace-mode t)

;; Don't use TABS for indentations.
(setq-default indent-tabs-mode nil)

;; Set the number to the number of columns to use.
;; (setq-default fill-column 100)

;; Add Autofill mode to mode hooks.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Enable syntax highlighting
(global-font-lock-mode 1)

;; ==================================================
;; packages
;; ==================================================

;; *========== elasticsearch
(require-package 'es-mode)
(autoload 'es-mode "es-mode.el"
          "Major mode for editing Elasticsearch queries" t)
(add-to-list 'auto-mode-alist '("\\.es$" . es-mode))

;; *========== python
(require-package 'elpy)
(elpy-enable)

;; https://github.com/ensime/ensime-server/issues/670
(setenv "PATH" (concat "/usr/local/bin/sbt/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin/scala/bin:" (getenv "PATH")))

;; *========== scala
(require-package 'scala-mode2)
(require-package 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; *========== ace-jump-mode
(require-package 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c M-SPC") 'ace-jump-line-mode)

;; *========== paradox
(require-package 'paradox)
(setq paradox-execute-asynchronously nil)

;; *========== exec-path-from-shell
(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; *========== monokai-theme
(require-package 'monokai-theme)

;; *========== undo-tree
(require-package 'undo-tree)
(global-undo-tree-mode t)

;; *========== smartparens
(require-package 'smartparens)
(smartparens-global-mode t)

;; *========== magit
(require-package 'magit)
(global-set-key (kbd "<f9> <f9>") 'magit-status)

;; *========== rainbow-delimiters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; *========== helm
(require-package 'helm)

;; must set before helm-config, otherwise helm use default
;; prefix "C-x c", which is inconvenient because you can
;; accidentially pressed "C-x C-c"
(setq helm-command-prefix-key "C-c h")

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)

(helm-mode t)

;; *========== helm-aws
(require-package 'helm-aws)

;; *========== projectile
(require-package 'projectile)
(projectile-global-mode t)

;; *========== helm-projectile
(require-package 'helm-projectile)
(global-set-key (kbd "C-c h") 'helm-projectile)

;; *========== neotree
(require-package 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; *========== evil
(require-package 'evil)
;; (evil-mode)
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; *========== powerline
(require-package 'powerline)
(require-package 'powerline-evil)
(powerline-default-theme)
;;(powerline-evil-vim-color-theme)
(display-time-mode t)

;; *========== diminish
(require-package 'diminish)
(diminish 'visual-line-mode)
(diminish 'projectile-mode "Proj")
(diminish 'undo-tree-mode "Undo")
(diminish 'magit-auto-revert-mode)
;;(eval-after-load 'helm-mode (diminish 'helm-mode))
;;(after 'undo-tree (diminish 'undo-tree-mode))
;;(after 'projectile (diminish 'projectile-mode))
;;(after 'smartparens (diminish 'smartparens-mode))
;;(after 'magit (diminish 'magit-auto-revert-mode))








(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
