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
;; (use-package company
  ;; :config
  ;; (setq company-tooltip-align-annotations t
	;; company-tooltip-minimum 4
	;; company-minimum-prefix-length 2
	;; company-tooltip-limit 24
	;; company-search-words-in-any-order-regexp t)
  ;; (global-company-mode))
;; 
;; (use-package company-box
  ;; :hook (company-mode . company-box-mode))
;; 
;; (use-package prescient
  ;; :after company)
;; 
;; (use-package company-prescient
  ;; :after prescient)

(use-package corfu
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-history-mode t)
  (add-to-list 'savehist-additional-variables 'corfu-history)
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-excluded-modes'.
  :init
  (global-corfu-mode)
  :bind
  ( :map corfu-map ("SPC" . corfu-insert-separator)))


(use-package corfu-doc
  :init
  (add-hook 'corfu-mode-hook #'corfu-doc-mode))

(use-package cape
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p t" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p f" . cape-file)
         ("C-c p k" . cape-keyword))
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword))


