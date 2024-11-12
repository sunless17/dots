;;; package --- others
;;; Commentary:
;;; Code:

;; theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-vibrant t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; magit
(use-package magit
  :ensure t
  :defer t)

;; sudoku
(use-package sudoku
  :ensure t
  :defer t)

;; sudoku
(use-package speed-type
  :ensure t
  :defer t)

;; chess
(use-package chess
  :ensure t
  :defer t
	:config
	(customize-set-variable 'chess-default-display '(chess-ics1)))

;; parenthesis
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; auctex
(use-package tex
	:ensure auctex
  :config
  (with-eval-after-load 'tex
    (add-to-list 'TeX-view-program-selection
                 '(output-pdf "Zathura"))
	 	
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)))

;; css and other colors
(use-package rainbow-mode
  :ensure t
  :init
    (add-hook 'prog-mode-hook 'rainbow-mode))

;; treemacs
(use-package treemacs
  :ensure t
	:config
	(setq treemacs-default-visit-action 'treemacs-visit-node-close-treemacs)
	(setq treemacs-is-never-other-window t))

(use-package treemacs-evil
	:after (treemacs evil)
  :ensure t)

;; list suggestion
(use-package counsel
  :ensure t
  :after ivy
  :config
    (counsel-mode))

(use-package ivy
  :ensure t
  :config
    (ivy-mode))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init
    (ivy-rich-mode 1))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;; lsp
(use-package lsp-mode
  :ensure t
  :hook ((c-mode . lsp)
	 (c++-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-keymap-prefix "C-c l")
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (setq lsp-file-watch-threshold 15000))

(use-package lsp-ui
  :ensure t
  :commands (lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-delay 0.5)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  )

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

;; company
(use-package company
  :ensure t
  :bind ("M-/" . company-complete-common-or-cycle) ;; overwritten by flyspell
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-show-numbers            t
	company-minimum-prefix-length   1
	company-idle-delay              0.5
	company-backends
	'((company-files          ; files & directory
	   company-keywords       ; keywords
	   company-capf           ; what is this?
	   company-yasnippet)
	  (company-abbrev company-dabbrev))))

(use-package company-box
  :ensure t
  :after company
  :hook (company-mode . company-box-mode))

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-display-errors-function
	#'flycheck-display-error-messages-unless-error-list)

  (setq flycheck-indication-mode nil))

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (flycheck-pos-tip-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'packages)
;;; packages.el ends here
