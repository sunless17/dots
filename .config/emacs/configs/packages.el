;;; package --- others
;;; Commentary:
;;; Code:

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

;; css and other colors
(use-package rainbow-mode
  :ensure t
  :init
    (add-hook 'prog-mode-hook 'rainbow-mode))

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

(use-package which-key
  :ensure
  :init
  (which-key-mode))

(use-package projectile
  :ensure)

(use-package golden-ratio
  :ensure
  :init
  (golden-ratio-mode))

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

;; list suggestion
(use-package ivy
  :ensure
	:init
	(ivy-mode)
  :bind (("M-x" . counsel-M-x)
				 ("<f1> f" . counsel-describe-function)
         ("\C-s" . swiper)))

; explanation
(use-package ivy-rich
  :after ivy
  :ensure
  :init
    (ivy-rich-mode 1))
(use-package counsel
  :ensure
  :after ivy
  :config
    (counsel-mode))

;; programming
(use-package eldoc
  :init
  (global-eldoc-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; lsp
(use-package lsp-mode
	:ensure
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c-mode . lsp)
         (js-mode . lsp)
         (sh-mode . lsp)
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; enable / disable the hints as you prefer:
  (lsp-inlay-hint-enable t)
  ;; These are optional configurations. See https://emacs-lsp.github.io/lsp-mode/page/lsp-rust-analyzer/#lsp-rust-analyzer-display-chaining-hints for a full list
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; optionally
(use-package lsp-ui
	:ensure
	:custom
		(lsp-ui-peek-always-show t)
		(lsp-ui-sideline-show-hover t)
		(lsp-ui-doc-enable nil)
	:commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy
	:commands lsp-ivy-workspace-symbol)

;; auto-completion
(use-package company
	:ensure
  :bind
	(:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous))
  :init
  (global-company-mode))

(use-package flycheck
	:ensure
	:init
	(global-flycheck-mode))

(use-package yasnippet
  :ensure
	:init
	(yas-global-mode)
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))
(use-package yasnippet-snippets
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rust-mode
	:ensure
	:config
	;; identation
	(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
	;; formatting 
	(setq rust-format-on-save t)
	;; lsp
	(add-hook 'rust-mode-hook #'lsp))

(use-package rustic
  :ensure t
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))

	(remove-hook 'rustic-mode-hook 'flycheck-mode)
		;; format on save
		(setq rustic-format-on-save nil)
		;; save before compilation
		(defun rustic-mode-auto-save-hook ()
		"Enable auto-saving in rustic-mode buffers."
		(when buffer-file-name
				(setq-local compilation-ask-about-save nil)))
		(add-hook 'rustic-mode-hook 'rustic-mode-auto-save-hook)
		;; set rust analyzer
		(setq rustic-analyzer-command '("~/.cargo/bin/rust-analyzer"))
  :custom
  (rustic-cargo-use-last-stored-arguments t)
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer")))

(use-package cargo
	:ensure
	:init
	(add-hook 'rust-mode-hook 'cargo-minor-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'packages)
;;; packages.el ends here
