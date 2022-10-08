;;; in minibuffer completion
;https://github.com/oantolin/orderless
;This package provides an orderless completion style that divides the pattern into space-separated components, and matches candidates that match all of the components in any order. Each component can match in any one of several ways: literally, as a regexp, as an initialism, in the flex style, or as multiple word prefixes. By default, regexp and literal matches are enabled.
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;many consult commands
(use-package consult)

;https://github.com/minad/vertico
;minibuffer completion [bottom one]
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

;save minibuffer history
(use-package savehist
  :init
  (savehist-mode))

;better minibufer description
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

(use-package prescient
  :after company)

(use-package company-prescient
  :after prescient)
