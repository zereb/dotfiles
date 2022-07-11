(provide 'evil-setup)

(use-package evil
  :demand t
  :init 
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-keybinding nil)
  (setq package-native-compile t)
  (setq evil-undo-system 'undo-redo)
  (evil-mode))

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

