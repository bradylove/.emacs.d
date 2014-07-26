;; Modify zap-to-char to take one less character
(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR. If
   you are deleting forward, the CHAR is replaced and the point is
   put before CHAR"
  (insert char)
  (if (< 0 arg) (forward-char -1)))
