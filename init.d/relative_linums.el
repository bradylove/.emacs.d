(global-linum-mode t)
(setq linum-last-pos 0)

(eval-after-load "linum"
  '(defun linum-update (buffer)
     "Update line numbers for all windows displaying BUFFER."
     ;; this is only change but couldn't find better way to do it, tried
     ;; linum-before-update-hook but it runs in an excursion so I couldn't get
     ;; current line number
     (setq linum-last-pos (line-number-at-pos))
     (with-current-buffer buffer
       (when linum-mode
         (setq linum-available linum-overlays)
         (setq linum-overlays nil)
         (save-excursion
           (mapc #'linum-update-window
                 (get-buffer-window-list buffer nil 'visible)))
         (mapc #'delete-overlay linum-available)
         (setq linum-available nil)))))

(defface linum-zero
  '((t :inherit linum :foreground "white" :background "#FF0000" :weight bold))
  "Face for displaying line number 0"
  :group 'linum)

(defface linum-top
  '((t :inherit linum :foreground "grey80" :background "grey40" :weight bold))
  "Face for displaying top line number"
  :group 'linum)

(defface linum-line
  '((t :inherit linum :foreground "grey60" :background "grey30" :weight normal))
  "Face for displaying absolute line number"
  :group 'linum)

(defun linum-relativenumber-format (line-number)
  (let ((diff (abs (- line-number linum-last-pos))))
    (concat (propertize (format "%3d" line-number)
                        'face 'linum-line)
            (propertize (format "%3d" diff)
                        'face (cond ((zerop diff) 'linum-zero)
                                    ((eq 1 line-number) 'linum-top)
                                    (t 'linum))))))

;; (setq linum-format 'dynamic)
(setq linum-format 'linum-relativenumber-format)
(setq linum-mode t)
