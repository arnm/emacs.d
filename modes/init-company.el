(require-package 'company)
(require 'company)

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-tooltip-limit 20)
(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case t)

(add-hook 'prog-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends)
		 (list (list 'company-dabbrev-code 'company-yasnippet)))))

(setq company-global-modes
      '(not eshell-mode comint-mode org-mode))

(add-hook 'after-init-hook 'global-company-mode)

;; (defadvice company-complete-common (around advice-for-company-complete-common activate)
;;   (when (null (yas-expand))
;;     ad-do-it))

(provide 'init-company)
