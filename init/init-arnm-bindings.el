
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'eval-last-sexp
  "w" '(lambda ()
         (interactive)
         (arnm/util/indent-buffer)
         (save-buffer))
  "d" '(lambda ()
         (interactive)
         (kill-this-buffer)
         (delete-window))
  "c" 'delete-window
  "v" (kbd "C-w v C-w l")
  "s" (kbd "C-w s C-w j")
  "h" help-map)

;; ace-jump-mode bindings
(define-key evil-normal-state-map (kbd "SPC w") 'evil-ace-jump-word-mode)
(define-key evil-normal-state-map (kbd "SPC s") 'evil-ace-jump-char-mode)

;; projectile bindings
(cond ((executable-find "ag")
       (evil-leader/set-key "f" 'projectile-ag))
      ((executable-find "ack")
       (evil-leader/set-key "f" 'projectile-ack))
      (t
       (evil-leader/set-key "f" 'projectile-grep)))

;; magit bindings
(evil-leader/set-key
  "g s" 'magit-status
  "g b" 'magit-blame-popup
  "g l" 'magit-log-popup
  "g d" 'magit-diff-popup
  "g z" 'magit-stash-popup
  "g c" 'magit-commit-popup)

(evil-leader/set-key "p" 'helm-projectile-switch-project)
(evil-leader/set-key "b" 'helm-projectile-switch-to-buffer)
(evil-leader/set-key "a" 'helm-projectile)

(define-key evil-motion-state-map  ";" 'evil-forward-char)
(define-key evil-motion-state-map  "j" 'evil-backward-char)
(define-key evil-motion-state-map  "k" 'evil-next-line)
(define-key evil-motion-state-map  "l" 'evil-previous-line)

;; Insert State
(define-key evil-insert-state-map (kbd "C-a") 'evil-insert-line)
(define-key evil-insert-state-map (kbd "C-e") 'evil-append-line)

;; State Change Keys
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)

;; Insert Movement Keys
(define-key evil-insert-state-map (kbd "C-;") 'evil-forward-char)
(define-key evil-insert-state-map (kbd "C-j") 'evil-backward-char)
(define-key evil-insert-state-map (kbd "C-k") 'evil-next-line)
(define-key evil-insert-state-map (kbd "C-l") 'evil-previous-line)
(define-key evil-insert-state-map (kbd "C-o") 'evil-open-below)
;; terminal hack - rxvt
(define-key evil-insert-state-map (kbd "<right>") 'evil-forward-char)

;; Window Movement Keys
(define-key evil-normal-state-map (kbd "C-;") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-up)
;; terminal hack -rxvt
(define-key evil-normal-state-map (kbd "<right>") 'evil-window-right)

(define-key evil-normal-state-map (kbd "C-s") 'shrink-window)
(define-key evil-normal-state-map (kbd "C-v") 'shrink-window-horizontally)

;; Visual State
(define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)
