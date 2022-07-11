(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; BOOTSTRAP USE-PACKAGE
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(setq Package-native-compile t)
(eval-when-compile (require 'use-package))

;;; Runtime/startup optimizations
(setq make-backup-files nil) ; stop creating ~ files
(setq inhibit-startup-screen t) ; stop opening *GNU Emacs*
(setq auto-mode-case-fold nil)
;; Disable bidirectional text scanning for a modest performance boost. I've set
;; this to `nil' in the past, but the `bidi-display-reordering's docs say that
;; is an undefined state and suggest this to be just as good:
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)
;; Reduce rendering/line scan work for Emacs by not rendering cursors or regions
;; in non-focused windows.
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)
;; More performant rapid scrolling over unfontified regions. May cause brief
;; spells of inaccurate syntax highlighting right after scrolling, which should
;; quickly self-correct.
(setq fast-but-imprecise-scrolling t)
;; Don't ping things that look like domain names.
(setq ffap-machine-p-known 'reject)
;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we halve startup times, particularly when we use
;; fonts that are larger than the system default (which would resize the frame).
(setq frame-inhibit-implied-resize t)
;; Emacs "updates" its ui more often than it needs to, so slow it down slightly
(setq idle-update-delay 1.0)  ; default is 0.5
;; Font compacting can be terribly expensive, especially for rendering icon
;; fonts on Windows. Whether disabling it has a notable affect on Linux and Mac
;; hasn't been determined, but do it anyway, just in case. This increases memory
;; usage, however!
(setq inhibit-compacting-font-caches t)
;; Increase how much is read from processes in a single chunk (default is 4kb).
;; This is further increased elsewhere, where needed (like our LSP module).
(setq read-process-output-max (* 64 1024))  ; 64kb
;; Introduced in Emacs HEAD (b2f8c9f), this inhibits fontification while
;; receiving input, which should help a little with scrolling performance.
(setq redisplay-skip-fontification-on-input t)
;;
(setq command-line-x-option-alist nil)
;; Shave seconds off startup time by starting the scratch buffer in
;; `fundamental-mode', rather than, say, `org-mode' or `text-mode', which pull
;; in a ton of packages. `doom/open-scratch-buffer' provides a better scratch
;; buffer anyway.
(setq initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

;; Using garbage magic hack.
(use-package gcmh
 :config
  (gcmh-mode 1))

;; Setting garbage collection threshold
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))


;;; Reasonable, global defaults
(set-language-environment "UTF-8")
(global-auto-revert-mode 1)
;; Favor vertical splits over horizontal ones, since monitors are trending
(setq split-width-threshold 160
      split-height-threshold nil)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode))

;;; General Keybindings
(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer my-leader-key
   :keymaps '(normal insert visual emacs)
   :prefix "SPC"
   :global-prefix "C-SPC"))

  
  


