(defcustom neo-window-width 30
  "*Specifies the width of the NeoTree window."
  :type 'integer
  :group 'neotree)

(use-package neotree
  :config
  (setq neo-smart-open t
        neo-window-width 30
        neo-theme (if (display-graphic-p) 'icons 'arrow)
        ;;neo-window-fixed-size nil
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


(custom-set-faces
 (set-face-attribute 'neo-button-face      nil :height 120)
 (set-face-attribute 'neo-file-link-face   nil :height 120)
 (set-face-attribute 'neo-dir-link-face    nil :height 120)
 (set-face-attribute 'neo-header-face      nil :height 120)
 (set-face-attribute 'neo-expand-btn-face  nil :height 120))


(evil-define-key 'normal neotree-mode-map (kbd "l") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-select-up-node)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
(evil-define-key 'normal neotree-mode-map (kbd "a") 'neotree-create-node)
;; show hidden files
(setq-default neo-show-hidden-files t)

