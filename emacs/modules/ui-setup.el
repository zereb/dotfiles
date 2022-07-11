(menu-bar-mode -1) ;remove menu bar
(tool-bar-mode -1) ;remove tool-bar
(scroll-bar-mode -1) ;remove scroll bar
;; (global-visual-line-mode t) 
(setq visible-bell t)
(global-hl-line-mode 1) ;highlight current line
(setq-default display-line-numbers-width 3)
(setq-default display-line-numbers-widen t)
(setq use-dialog-box nil)
(defalias 'yes-or-no-p 'y-or-n-p) 

;;line numbers

(defun my/linum-off ()
  (linum-mode -1))

(add-hook 'helpful-mode-hook #'my/linum-off)
(add-hook 'prog-mode-hook #'linum-mode)
(setq linum-format "%4d | ")

;;;mouse scroll
(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; how many lines at a time
(setq mouse-wheel-progressive-speed nil) ;; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(set-face-attribute 'default nil :family "Hack")
(set-face-attribute 'default nil :height (* 14 10))

(use-package dracula-theme
  :config
  (load-theme 'dracula t))

(use-package which-key
  :init
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns 4
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.3
        which-key-max-description-length 40
        which-key-allow-imprecise-window-fit t
        which-key-separator " → ")
  (which-key-setup-minibuffer))
(which-key-mode)

(use-package centaur-tabs
  :demand t
  :init
  (setq centaur-tabs-style "bar"
	centaur-tabs-height 14
	centaur-tabs-set-bar 'left
	centaur-tabs-set-icons t
	centaur-tabs-set-modified-marker t
	)
  :config
  (centaur-tabs-mode t))

(use-package all-the-icons)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package doom-modeline
  :config
  (doom-modeline-mode 1)
  (setq doom-modeline-height 12
	doom-modeline-buffer-file-name-style 'file-name
	doom-modeline-buffer-modification-icon nil
	doom-modeline-minor-modes nil
	doom-modeline-indent-info nil
	doom-modeline-lsp t
	doom-modeline-modal-icon nil
	doom-modeline-modal-icon nil
	doom-modeline-enable-word-count nil
	doom-modeline-buffer-state-icon nil))

(custom-set-faces
  '(mode-line ((t (:family "Cantarell regular" :height 0.9))))
  '(mode-line-active ((t (:family "Noto Sans" :height 0.9)))) ; For 29+
  '(mode-line-inactive ((t (:family "Cantarell regular" :height 0.9)))))

(use-package hl-todo
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        '(
          ("TODO" warning bold)
          ("FIXME" error bold)
          ("HACK" font-lock-constant-face bold)
          ("REVIEW" font-lock-keyword-face bold)
          ("DEPRECATED" font-lock-doc-face bold)
          ("NOTE" success bold)
          ("BUG" error bold)
          ("XXX" font-lock-constant-face bold))))

(use-package git-gutter-fringe
  :init
  (setq-default left-fringe-width  2
		 right-fringe-width 2)
  :config (git-gutter))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :init (rainbow-delimiters-mode))

(use-package helpful
  :config (setq counsel-describe-function-function #'helpful-callable
		counsel-describe-variable-function #'helpful-variable))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file)
  (setq dired-listing-switches "-agho --group-directories-first --dired"))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(nvmap "K" 'helpful-at-point)

(nvmap :prefix "SPC s"
       "" '(nil :which-key "SEARCH")
       "f"   '(helpful-callable :which-key "Describe function")
       "c"   '(helpful-command :which-key "Describe command")
       "m"   '(consult-mode-command :which-key "Modes")
       "v"   '(helpful-variable :which-key "Describe variable")
       "g"   '(consult-grep :which-key "Search in project")
       "i"   '(consult-imenu :which-key "Imenu")
       "r"   '(projectile-replace :which-key "Search in project"))


(nvmap :prefix "SPC f"
       "" '(nil :which-key "FILES")
       "o" '(dired :which-key "Open directory in dired")
       "d" '(dired-jump :which-key "Open directory in dired")
       "s" '(save-all :which-key "Save all"))

