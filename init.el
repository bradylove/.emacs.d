(setq bkl-emacs-init-file (or load-file-name buffer-file-name))
(setq bkl-emacs-config-dir
      (file-name-directory bkl-emacs-init-file))
(setq user-emacs-directory bkl-emacs-config-dir)
(setq bkl-elisp-dir (expand-file-name "elisp" bkl-emacs-config-dir))
(setq bkl-elisp-external-dir
      (expand-file-name "external" bkl-elisp-dir))
(setq bkl-init-dir
      (expand-file-name "init.d" bkl-emacs-config-dir))

;; Load all elisp files in ./init.d
(if (file-exists-p bkl-init-dir)
    (dolist (file (directory-files bkl-init-dir t "\\.el$"))
      (load file)))

;; Set up 'custom' system
(setq custom-file (expand-file-name "customizations.el" bkl-emacs-config-dir))
(load custom-file)
(put 'narrow-to-region 'disabled nil)

(if (file-exists-p "~/.emacs_local.el")
    (load "~/.emacs_local.el"))
