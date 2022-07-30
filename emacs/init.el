(add-to-list 'load-path (expand-file-name "~/dotfiles/emacs/modules/"))

(load "system-setup")
(load "evil-setup")
(load "completion-setup")
(load "ui-setup")
(load "flycheck-setup")
(load "programming-setup")

(setq skippable-buffers '("*Messages*" "*scratch*" "*Help*" "*GNU Emacs*"))

(defun my-next-buffer ()
  "`next-buffer` that skips certain buffers."
  (interactive)
  (next-buffer)
  (while (member (buffer-name) skippable-buffers)
    (next-buffer)))
 
(defun my-prev-buffer ()
  "previous-buffer that skips certain buffers"
  (interactive)
  (previous-buffer)
  (while (member (buffer-name) skippable-buffers)
    (previous-buffer)))

(nvmap
  "M-1" '(neotree-toggle :which-key "Toggle neotree file viewer")
  "C-e" '(consult-buffer :which-key "Find buffer")
  "L" '(my-next-buffer :which-key "Goto next buffer")
  "H" '(my-prev-buffer :which-key "Goto prev buffer")
  "SPC SPC" '(project-find-file :which-key "Find file"))

(defun save-all () (interactive) (save-some-buffers t))

(winner-mode 1)
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

(nvmap :prefix "SPC p"
       "" '(nil :which-key "PACKAGES")
       "r" '(package-refresh-contents :which-key "Refresh")
       "d" '(package-delete :which-key "Delete"))

;;;buffers
(nvmap :prefix "SPC b"
       "" '(nil :which-key "BUFFERS")
       "b"   '(consult-buffer :which-key "Switch to buffer")
       "c"   '(clone-indirect-buffer-other-window :which-key "Clone indirect buffer other window")
       "k"   '(kill-current-buffer :which-key "Kill current buffer")
       "n"   '(next-buffer :which-key "Next buffer")
       "p"   '(previous-buffer :which-key "Previous buffer")
       "K"   '(kill-buffer :which-key "Kill buffer"))

;; (call-process "/usr/bin/tdrop" "-ma -y 18 --wm bspwm /usr/bin/alacritty")
(server-start)
;;;programming
;; Silence compiler warnings as they can be pretty disruptive
(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
    (setq native-comp-deferred-compilation nil))
;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(web-mode tree-sitter-langs company-prescient prescient sly-asdf lsp-ui lsp-mode helpful git-gutter-fringe hl-todo sly-macrostep tree-sitter parinfer-rust-mode consult orderless company-box flycheck gcmh doom-modeline emojify all-the-icons general which-key use-package undo-fu-session evil-collection dracula-theme async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:family "Cantarell regular" :height 0.9))))
 '(mode-line-active ((t (:family "Noto Sans" :height 0.9))))
 '(mode-line-inactive ((t (:family "Cantarell regular" :height 0.9)))))
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
