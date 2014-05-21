;; path setup
(setenv "PATH" (getenv "PATH"))
(setq exec-path '("/usr/local/bin" "/usr/bin"))
(setq default-directory (concat (getenv "HOME") "/"))

;; Add external project to load path
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Configure load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'setup-package)

;; Install packages if they're missing
(defun init-install-packages ()
  (packages-install
   '(color-theme-sanityinc-tomorrow
     nyan-mode
     evil
     evil-leader
     projectile
     multiple-cursors
     paredit
     autopair
     yasnippet
     magit
     flycheck
     emacs-eclim
     python-environment
     jedi
     emmet-mode
     js2-mode
     js2-refactor
     clojure-mode
     cider
     rust-mode)))

(condition-case nil
    (init-install-packages)
  (error
   (package-refresh-contents)
   (init-install-packages)))

(require 'appearance)

;; System setup
(require 'setup-projectile-mode)
(require 'setup-nyan-mode)
(require 'setup-evil-mode)
(require 'setup-ido-mode)
(require 'setup-paredit)
(require 'setup-autopair-mode)
(require 'setup-multiple-cursors)
(require 'setup-auto-complete-mode)
(eval-after-load 'magit '(require 'setup-magit))

;; Language specific setups
(require 'setup-js2-mode)
(require 'setup-emmet-mode)
(require 'setup-python-mode)
(require 'setup-clojure-mode)
(require 'setup-rust-mode)
