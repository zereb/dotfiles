
;;; in minibuffer completion
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult)

(use-package vertico
  :init
  (vertico-mode)
  :config
  (setq vertico-count 24
	vertico-cycle t
	vertico-resize nil)
  :bind (:map vertico-map
	     ("C-j" . vertico-next)
	     ("C-k" . vertico-previous)
	     ("ESC" . vertico-exit)))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;;; in buffer completion
(use-package company
  :config
  (setq company-tooltip-align-annotations t
	company-tooltip-minimum 4
	company-minimum-prefix-length 2
	company-tooltip-limit 24
	company-search-words-in-any-order-regexp t)
  (global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

;;;describe
