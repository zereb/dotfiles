(use-package flycheck
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq flycheck-display-errors-delay 0.25)
  (setq flycheck-idle-change-delay 1.0)
  (delq 'new-line flycheck-check-syntax-automatically))

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.33)))

(provide 'flycheck-setup)
