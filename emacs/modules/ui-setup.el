(menu-bar-mode -1) ;remove menu bar
(tool-bar-mode -1) ;remove tool-bar
(scroll-bar-mode -1) ;remove scroll bar
;; (global-visual-line-mode t) 
(setq visible-bell t)
(global-hl-line-mode 1) ;highlight current line
;; (setq-default display-line-numbers-width 3)
;; (setq-default display-line-numbers-widen t)
(setq use-dialog-box nil)
(defalias 'yes-or-no-p 'y-or-n-p) 

;;line numbers

(defun call-tdrop ()
  (interactive)
  (call-process "tdrop" nil 0 nil "-ma" "-y" "18" "--wm" "bspwm" "kitty"))

(defun call-ranger ()
  (interactive)
  (call-process "kitty" nil 0 nil "-e" "ranger"))

(defun my/linum-off ()
  (linum-mode -1))

(add-hook 'helpful-mode-hook #'my/linum-off)
(add-hook 'prog-mode-hook #'linum-mode)
(setq linum-format "%4d ")

;;;mouse scroll
(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; how many lines at a time
(setq mouse-wheel-progressive-speed nil) ;; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

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
	centaur-tabs-modified-marker "*"
	)
  :config
  (centaur-tabs-mode t))



(defcustom neo-window-width 35
  "*Specifies the width of the NeoTree window."
  :type 'integer
  :group 'neotree)

(use-package neotree
  :config
  (setq neo-smart-open t
        neo-window-width 35
        neo-theme (if (display-graphic-p) 'classic 'arrow)
        ;;neo-window-fixed-size nil
	neo-show-hidden-files t
        inhibit-compacting-font-caches t
        projectile-switch-project-action 'neotree-projectile-action) 
        ;; truncate long file names in neotree
  (add-hook 'neo-after-create-hook
     #'(lambda (_)
         (with-current-buffer (get-buffer neo-buffer-name)
           (setq truncate-lines t)
           (setq word-wrap nil)
           (make-local-variable 'auto-hscroll-mode)
           (setq auto-hscroll-mode nil)))))



(use-package all-the-icons
  :if (display-graphic-p))

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


(defun my-set-fonts (family size)
  (set-face-attribute 'default nil :family family)
  (set-face-attribute 'default nil :height size))

(defun my-set-neotree-fonts (family size)
  (custom-set-faces
   (set-face-attribute 'neo-button-face      nil :height size)
   (set-face-attribute 'neo-file-link-face   nil :height size :family family)
   (set-face-attribute 'neo-dir-link-face    nil :height size :family family)
   (set-face-attribute 'neo-header-face      nil :height size)
   (set-face-attribute 'neo-expand-btn-face  nil :height size)))

(if (string= system-name "PC")
    (progn (my-set-fonts "Hack" 102)
	   (my-set-neotree-fonts "Noto Sans" 80))
    (progn (my-set-fonts "Hack" 130)
	   (my-set-neotree-fonts "Noto Sans" 100)))

(nvmap "K" 'helpful-at-point)

(defun grep-current-word ()
  (interactive)
  (consult-grep "" (current-word)))

(nvmap :prefix "SPC s"
       "" '(nil :which-key "SEARCH")
       "f"   '(helpful-callable :which-key "Describe function")
       "c"   '(helpful-command :which-key "Describe command")
       "m"   '(consult-mode-command :which-key "Modes")
       "v"   '(helpful-variable :which-key "Describe variable")
       "g"   '(grep-current-word :which-key "Search in project")
       "i"   '(consult-imenu :which-key "Imenu")
       "r"   '(projectile-replace :which-key "Replace in project"))

(nvmap :prefix "SPC f"
       "" '(nil :which-key "FILES")
       "o" '(dired :which-key "Open directory in dired")
       "d" '(dired-jump :which-key "Dired jump")
       "p" '(projectile-switch-project :which-key "Switch to project")
       "a" '(projectile-add-known-project :which-key "Add project")
       "s" '(save-all :which-key "Save all")
       "r" '(call-ranger :which-key "Ranger")
       "t" '(call-tdrop :which-key "Tdrop"))

(nvmap :prefix "SPC d"
       "" '(nil :which-key "CALL EXTERNAL")
       "r" '(call-ranger :which-key "Ranger")
       "t" '(call-tdrop :which-key "Tdrop"))

(evil-define-key 'normal neotree-mode-map (kbd "l") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-select-up-node)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
(evil-define-key 'normal neotree-mode-map (kbd "a") 'neotree-create-node)

