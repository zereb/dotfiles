(nvmap
  "M-1" '(neotree-toggle :which-key "Toggle neotree file viewer")
  "C-e" '(consult-buffer :which-key "Find buffer")
  "SPC SPC" '(project-find-file :which-key "Find file")
  "L" 'centaur-tabs-forward
  "H" 'centaur-tabs-backward
  "K" 'helpful-at-point
  "C-/" 'comment-and-next-line
  "M-f" '(format-all-buffer :which-key "Format buffer")
  "M-v" '(format-all-region :which-key "Format region")
  "<f3>" '(save-buffer :which-key "Rename SYMBOL")
  "<f5>" '(projectile-compile-project :which-key "compile")
  "<f9>" '(projectile-run-project :which-key "run")
  "<f2>" '(lsp-rename :which-key "Rename SYMBOL"))

(nvmap :prefix "SPC w"
       "" '(nil :which-key "WINDOW")
       "k" '(evil-window-delete :which-key "Close window")
       "n" '(evil-window-new :which-key "New window")
       "h" '(evil-window-split :which-key "Horizontal split window")
       "v" '(evil-window-vsplit :which-key "Vertical split window")
       "<left>" '(winner-undo :which-key "Winner undo")
       "<right>" '(winner-redo :which-key "Winner redo"))

(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-n") 'ace-window)

(nvmap :prefix "SPC b"
       "" '(nil :which-key "BUFFERS")
       "b"   '(consult-buffer :which-key "Switch to buffer")
       "c"   '(clone-indirect-buffer-other-window :which-key "Clone buffer and split")
       "k"   '(kill-current-buffer :which-key "Kill current buffer")
       "n"   '(centaur-tabs-forward-group :which-key "Next buffer group")
       "p"   '(centaur-tabs-backward-group :which-key "Previous buffer group")
       "K"   '(kill-buffer :which-key "Kill buffer"))

(nvmap :prefix "SPC p"
       "" '(nil :which-key "PREFERENCES")
       "c" '(flycheck-mode :which-key "Toggle flycheck")
       "t" '(consult-theme :which-key "Theme choose")
       "f" '(format-all-mode :Which-key "Toggle Autoformat")
       "F" '(format-all-ensure-formatter :Which-key "Eshure has formatter")
       "p" '(nil :which-key "PACKAGES")
       "p r" '(package-refresh-contents :which-key "Refresh")
       "p d" '(package-delete :which-key "Delete")
       "l" '(nil :which-key "LSP")
       "l i" '(lsp-install-server :which-key "Install lsp server")
       "l X" '(lsp-disconnect :which-key "Disconnect")
       "l R" '(lsp-restart :which-key "Restart"))

(nvmap :prefix "SPC h"
       "" '(nil :which-key "HELP")
       "f"   '(helpful-callable :which-key "Describe function")
       "c"   '(helpful-command :which-key "Describe command")
       "m"   '(consult-mode-command :which-key "Modes")
       "v"   '(helpful-variable :which-key "Describe variable"))

(nvmap :prefix "SPC s"
       "" '(nil :which-key "SEARCH")
       "g" '(consult-grep :which-key "Grep in project")
       "s" '(google-this-mode-submap :which-key "Google")
       "i"   '(consult-imenu :which-key "Imenu")
       "e" '(flycheck-list-errors :which-key "Errors show")
       "h" '(sly-documentation-lookup :which-key "Hyperspec lookup")
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

;; neotree
(evil-define-key 'normal neotree-mode-map (kbd "l") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-select-up-node)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
(evil-define-key 'normal neotree-mode-map (kbd "a") 'neotree-create-node)

(define-key corfu-map (kbd "M-j") #'corfu-doc-scroll-down) 
(define-key corfu-map (kbd "M-k") #'corfu-doc-scroll-up) 
(define-key corfu-map (kbd "M-d") #'corfu-doc-toggle)

