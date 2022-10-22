(defvar +lookup-provider-url-alist
  '(("Google"            "https://google.com/search?q=%s")
    ("Google images"     "https://www.google.com/images?q=%s")
    ("DevDocs.io"        "https://devdocs.io/#q=%s")
    ("StackOverflow"     "https://stackoverflow.com/search?q=%s")
    ("Github"            "https://github.com/search?ref=simplesearch&q=%s")
    ("Youtube"           "https://youtube.com/results?aq=f&oq=&search_query=%s")
    ("Wolfram alpha"     "https://wolframalpha.com/input/?i=%s")
    ("Wikipedia"         "https://wikipedia.org/search-redirect.php?language=en&go=Go&search=%s")
    ("Rust Docs" "https://doc.rust-lang.org/edition-guide/?search=%s")))

(defvar +lookup-open-url-fn #'browse-url
  "Function to use to open search urls.")

(defvar +lookup-definition-functions
  '(+lookup-xref-definitions-backend-fn
    +lookup-dumb-jump-backend-fn
    +lookup-project-search-backend-fn
    +lookup-evil-goto-definition-backend-fn))

(defvar +lookup-references-functions
  '(+lookup-xref-references-backend-fn
    +lookup-project-search-backend-fn))

(defvar +lookup-documentation-functions
  '(+lookup-online-backend-fn))

(defvar +lookup-dictionary-enable-online t)

(use-package dumb-jump
  :commands dumb-jump-result-follow
  :config
  (setq dumb-jump-aggressive nil))
  ;; (add-hook 'dumb-jump-after-jump-hook #'better-jumper-set-jump))

;; (nvmap :prefix "g"
  ;; "" '(nil :which-key "goto")
  ;; "d" '(dumb-jump-go :which-key "Defenition")
  ;; "r" '(lsp-find-referknces :which-key "References"))
