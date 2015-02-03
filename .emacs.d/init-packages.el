
(require-package 'better-defaults)

(require-package 'ace-jump-mode)

;; ==================================================
;; powerline
;; ==================================================
(require-package 'powerline)
(require-package 'powerline-evil)
(powerline-default-theme)
;;(powerline-evil-vim-color-theme)
(display-time-mode t)

;; ==================================================
;; smooth-scrolling
;; ==================================================
(require-package 'smooth-scrolling)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; ==================================================
;; linum-relative
;; ==================================================
(require-package 'linum-relative)

;; ==================================================
;; paradox
;; ==================================================
(require-package 'paradox)
(setq paradox-execute-asynchronously nil)

;; ==================================================
;; exec-path-from-shell
;; ==================================================
(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; ==================================================
;; monokai-theme
;; ==================================================
(require-package 'monokai-theme)

;; ==================================================
;; undo-tree
;; ==================================================
(require-package 'undo-tree)
(global-undo-tree-mode t)

;; ==================================================
;; smartparens
;; ==================================================
(require-package 'smartparens)
(smartparens-global-mode t)

;; ==================================================
;; magit
;; ==================================================
(require-package 'magit)
(global-set-key (kbd "<f9> <f9>") 'magit-status)

;; ==================================================
;; projectile
;; ==================================================
(require-package 'projectile)
(projectile-global-mode t)

;; ==================================================
;; neotree
;; ==================================================
(require-package 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; ==================================================
;; helm
;; ==================================================
(require-package 'helm)

;; must set before helm-config, otherwise helm use default
;; prefix "C-x c", which is inconvenient because you can
;; accidentially pressed "C-x C-c"
(setq helm-command-prefix-key "C-c h")

(require-package 'helm-aws)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)

(helm-mode t)

;; ==================================================
;; helm-projectile
;; ==================================================
(require-package 'helm-projectile)
(global-set-key (kbd "C-c h") 'helm-projectile)

;; ==================================================
;; rainbow-delimiters
;; ==================================================
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ==================================================
;; eshell-prompt-extras
;; ==================================================
(require-package 'eshell-prompt-extras)
(setq eshell-highlight-prompt nil
      eshell-prompt-function 'epe-theme-lambda)

;; ==================================================
;; evil
;; ==================================================
(require-package 'evil)
;; (evil-mode t)
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; ==================================================
;; diminish
;; ==================================================
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

