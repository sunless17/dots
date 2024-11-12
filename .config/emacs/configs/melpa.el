;;; package --- melpa and use-package
;;; Commentary:
;;; Code:

;; add melpa repository
(require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; critical to ensure use-package is installed
(when (not (package-installed-p 'use-package))
	(package-refresh-contents)
	(package-install 'use-package))

;; configure use-package
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; auto-compile on latest package
(use-package auto-compile
	:config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'melpa)
;;; melpa.el ends here
