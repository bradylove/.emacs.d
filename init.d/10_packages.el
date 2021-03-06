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
    ov
    projectile
    magit
    rainbow-mode
    volatile-highlights
    fill-column-indicator
    flx-ido
    smex
    ido-ubiquitous
    autopair
    smart-mode-line
    restclient
    ;; nlinum
    ;; relative-line-numbers
    linum-relative
    popwin
    guide-key
    exec-path-from-shell

    ;; Helm
    helm
    helm-projectile
    helm-ag

    ;; Snippets
    yasnippet

    ;; Auto-completion
    ;; auto-complete
    ;; go-autocomplete
    company
    company-go

    ;; Themes
    ;; smyx-theme
    ;; flatui-theme
    ;; ample-theme
    ;; darcula-theme
    ;; tangotango-theme
    ;; flatland-theme
    material-theme

    ;; Language specific packages
    feature-mode
    ruby-end
    go-mode
    haml-mode
    inf-ruby
    js2-mode
    org
    ruby-tools
    slim-mode
    yaml-mode
    markdown-mode
    rust-mode
    rinari)
  "A list of packages to ensure are installed at launch")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (p my-packages)
  (require p))
