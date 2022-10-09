(add-to-list 'load-path (expand-file-name "~/dotfiles/emacs/modules/"))

(load "system-setup")
(load "utils")
(load "evil-setup")
(load "completion-setup")
(load "ui-setup")
(load "flycheck-setup")
(load "programming-setup")
(load "dashboard")
(load "keys")

(winner-mode 1)
(server-start)

;; TODO js2 cape projectile git-gutter 

;; (call-process "/usr/bin/tdrop" "-ma -y 18 --wm bspwm /usr/bin/alacritty")
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
   '(cmake-mode glsl-mode typescript-mode js2-refactor google-this cape corfu-doc format-all web-mode tree-sitter-langs prescient sly-asdf lsp-ui lsp-mode helpful git-gutter-fringe hl-todo sly-macrostep tree-sitter parinfer-rust-mode consult orderless flycheck gcmh doom-modeline emojify all-the-icons general which-key use-package undo-fu-session evil-collection dracula-theme async)))
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
 
