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

    ;; Utils
    ag
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
    feature-mode
    go-mode
    haml-mode
    inf-ruby
    js2-mode
    org
    ruby-tools
    slim-mode
    yaml-mode
    markdown-mode
    rinari
    )

  "A list of packages to ensure are installed at launch")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (p my-packages)
  (require p))
