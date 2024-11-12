;;; package --- taste
;;; Commentary:
;;; Code:

;; welcome to GNU emacs disable
(setq inhibit-startup-message t)

;; gui stuffs
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1) 

;; disable automatic backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; disable bell
(setq ring-bell-function 'ignore)

;; transparency
(set-frame-parameter nil 'alpha-background 70)
(add-to-list 'default-frame-alist '(alpha-background . 70))

;; yes and no to y | n
(defalias 'yes-or-no-p 'y-or-n-p)

;; scratch and minibuffer (hack) message
(setq initial-scratch-message "")
(defun display-startup-echo-area-message ()
	(message ""))

;; confirmation on exit
(setq confirm-kill-processes nil)

;; like lambda
(global-prettify-symbols-mode t)

;; confirmation dialog
(setq use-dialog-box nil)

;; watch all buffers and dired
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; show parent parenthesis
(show-paren-mode t)

;; normal scrolling
(setq scroll-conservatively 100)

;; disable bell
(setq ring-bell-function 'ignore)

;; fonts
(set-face-attribute 'default nil :font "Hack Nerd Font Mono")

;; org-temp for codeblocks
(require 'org-tempo)

;; more todo options
(setq org-todo-keywords
   '((sequence "TODO" "NEXT" "HORIZON" "RADIANCE" "CHORE" "|" "DONE" "CANCELLED")))

;; parenthesis
(electric-pair-mode t)

;; scratch
(setq initial-major-mode 'org-mode)

;; indentation
(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq-default electric-indent-inhibit t)
(setq-default indent-tabs-mode t)

;; terminal fix
(add-to-list 'term-file-aliases '("foot" . "xterm"))

;;; line wrap
  (add-hook 'org-mode-hook
	    '(lambda ()
	       (visual-line-mode 1)))

;;; mode line
(setq-default mode-line-format nil)

;; background fix for terminal
(set-face-background 'default "nil")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'minimal)
;;; minimal.el ends here

;; clock
;(setq display-time-24hr-format t)
;(setq display-time-format "%R %a %d %b")
;(display-time-mode 1)
;; battery
;(setq battery-update-interval 10)
;(display-battery-mode)
