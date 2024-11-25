;;; package --- others
;;; Commentary:
;;; Code:

;; evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
	(evil-set-leader 'normal (kbd "SPC"))
	;; bindings
	(evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)
	(evil-define-key 'normal 'global
		(kbd "<leader>a") 'org-agenda
		(kbd "<leader>n") 'next-buffer
		(kbd "<leader>p") 'previous-buffer
		(kbd "<leader>k") 'kill-buffer
		(kbd "<leader>i") 'config-visit
		(kbd "<leader>o") 'notes-visit
		(kbd "<leader>u") 'gentoo-visit
		(kbd "<leader>f") 'find-file
		(kbd "<leader>s") 'save-some-buffers
		(kbd "z f") 'vimish-fold
		(kbd "z o") 'vimish-fold-unfold
		(kbd "z d") 'vimish-fold-delete-all
		(kbd "<leader>l") 'switch-to-buffer)
  (evil-mode))

(use-package vimish-fold
  :ensure
  :after evil)
(use-package evil-vimish-fold
  :ensure
  :after vimish-fold
  :hook ((prog-mode conf-mode text-mode) . evil-vimish-fold-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-tutor
	:ensure t)

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'bindings)
;;; bindings.el ends here
