(require 'package)


(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))


(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(;; Helper Packages
    dash
    s

    ;; Misc Tools
    ;; ag
    ;; auto-complete
    ;; autopair
    ;; fill-column-indicator
    ;; grizzl
    ;; ido-ubiquitous
    ;; magit
    ;; projectile
    ;; rainbow-mode
    ;; smartparens

    ;; Utils
    anzu
    browse-kill-ring
    discover-my-major
    diminish
    grizzl
    guru-mode
    ov
    projectile
    magit
    rainbow-mode
    smartparens
    volatile-highlights
    ;; autopair
    fill-column-indicator
    flx-ido
    smex
    ido-ubiquitous

    ;; Snippets
    yasnippet

    ;; Auto-completion
    company

    ;; Themes
    moe-theme

    ;; Language specific packages
    enh-ruby-mode
    haml-mode
    js2-mode
    org
    ruby-end

    ;; coffee-mode
    ;; feature-mode
    ;; go-mode
    ;; go-autocomplete
    ;; inf-ruby
    ;; markdown-mode
    ;; multi-web-mode
    ;; rinari
    ;; rspec-mode
    ;; ruby-end
    ;; ruby-tools
    ;; yaml-mode
    ;; ruby-mode
    )

  "A list of packages to ensure are installed at launch")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (p my-packages)
  (require p))
