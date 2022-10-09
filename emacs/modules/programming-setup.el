(use-package tree-sitter
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (global-tree-sitter-mode)
  ;; This makes every node a link to a section of code
  (setq tree-sitter-debug-jump-buttons t
        ;; and this highlights the entire sub tree in your code
        tree-sitter-debug-highlight-jump-region t))

(use-package tree-sitter-langs)

(use-package evil-nerd-commenter)

(defun comment-and-next-line ()
  (interactive)
  (evilnc-comment-or-uncomment-lines 1)
  (evil-next-line))

;; lisp
(use-package sly
  :init
  (setq inferior-lisp-program "sbcl"))

(use-package sly-quicklisp)

(use-package sly-macrostep)

(use-package sly-asdf)

;; (use-package parinfer-rust-mode
;;  :hook ((emacs-lisp-mode
;;          clojure-mode
;;          scheme-mode
;;          lisp-mode
;;          racket-mode
;;          hy-mode) . parinfer-rust-mode)
;;    :init
;;    (setq parinfer-rust-auto-download t))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((sh-mode . lsp)
   (web-mod . lsp)
   (js-mode . lsp))
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-java
  :after lsp-mode)

;; (use-package vue-mode)

(use-package web-mode
  :mode "\\.[px]?html?\\'"
  :mode "\\.\\(?:tpl\\|blade\\)\\(?:\\.php\\)?\\'"
  :mode "\\.erb\\'"
  :mode "\\.[lh]?eex\\'"
  :mode "\\.sface\\'"
  :mode "\\.jsp\\'"
  :mode "\\.as[cp]x\\'"
  :mode "\\.ejs\\'"
  :mode "\\.hbs\\'"
  :mode "\\.mustache\\'"
  :mode "\\.svelte\\'"
  :mode "\\.twig\\'"
  :mode "\\.jinja2?\\'"
  :mode "\\.eco\\'"
  :mode "wp-content/themes/.+/.+\\.php\\'"
  :mode "templates/.+\\.php\\'"
  :mode "\\.vue\\'")

(add-hook 'web-mode 'lsp)
(add-hook 'js-mode 'lsp)

;; SQL
(add-hook 'sql-mode-hook 'lsp)
(setq lsp-sqls-workspace-config-path nil)
(setq lsp-sqls-connections
      '(((driver . "mysql") (dataSourceName . "yyoncho:local@tcp(localhost:3306)/foo"))
	((driver . "mssql") (dataSourceName . "Server=localhost;Database=sammy;User Id=yyoncho;Password=hunter2;"))))

(use-package format-all)

(defun my-mode-wrapper (mode run-then run-else)
  (if (eq major-mode mode)
      (call-interactively run-then)
    (call-interactively run-else)))

(defun my-eval-buffer ()
  (interactive)
  (my-mode-wrapper 'emacs-lisp-mode 'eval-buffer 'sly-eval-buffer))

(defun my-eval-defun ()
  (interactive)
  (my-mode-wrapper 'emacs-lisp-mode 'eval-defun 'sly-eval-defun))

(defun my-eval-region ()
  (interactive)
  (my-mode-wrapper 'emacs-lisp-mode 'eval-region 'sly-eval-region))

(defun my-eval-expression ()
  (interactive)
  (my-mode-wrapper 'emacs-lisp-mode 'eval-expression 'sly-eval-last-expression))

(defun my-format-region ()
  (interactive)
  (lsp-format-region))

(defun my-format-buffer ()
  (interactive)
  (lsp-format-buffer))

(nvmap :prefix "SPC e"
  "" '(nil :which-key "EVAL")
  "b" '(my-eval-buffer :which-key "Eval buffer")
  "e" '(my-eval-defun :which-key "Eval expression")
  "v" '(my-eval-region :which-key "Eval region")
  "i" '(my-eval-expression :which-key "Eval interactive")
  "u" '(sly-undefine-function :which-key "Undefine fynctions [sly]")
  "m" '(macrostep-expand :which-key "Expand macro")
  "c" '(sly-compile-and-load-file :which-key "Compile and load file"))


(nvmap :prefix "SPC e C"
  "" '(nil :which-key "COMPILE")
  "e" '(sly-compile-defun :which-key "Compile defun")
  "C" '(sly-compile-and-load-file :which-key "Compile and load file")
  "v" '(sly-compile-region :which-key "Compile region")
  "c" '(sly-compile-file :which-key "Compile but don't load")
  "l" '(sly-load-file :which-key "Load file"))

(nvmap :prefix "SPC g"
  "" '(nil :which-key "SLY goto")
  "d" '(sly-edit-definition :which-key "Defenition")
  "r" '(sly-edit-uses :which-key "References")
  "c" '(sly-who-calls :which-key "Who calls")
  "s" '(sly-who-sets :which-key "Who sets global variables"))

(nvmap
  "Fd" '(lsp-find-definition :which-key "Find definition")
  "FD" '(lsp-find-declaration :which-key "Find declaration")
  "Fi" '(lsp-find-implementation :which-key "Find implementation")
  "Ft" '(lsp-find-type-definition :which-key "Find type definition")
  "Fr" '(lsp-find-references :which-key "Find references"))

(use-package typescript-mode)

(use-package js2-refactor
  :hook ((js2-mode rjsx-mode) . js2-refactor-mode))

(nvmap :prefix "SPC r"
  "" '(nil :which-key "REFACTOR")
  "r" '(js2r-rename-var :which-key "rename")
  "e" '(js2r-extract-function :which-key "extract function"))

(use-package glsl-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
  (add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
  (add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
  (add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode)))

(use-package cmake-mode)
