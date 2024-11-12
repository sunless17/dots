;;; package --- loaded buffers
;;; Commentary:
;;; Code:

;; gentoo
(defun gentoo-visit ()
  (interactive)
  ;; all configs
	(find-file "/sudo:root@gentoo:/etc/portage/make.conf")
  (find-file "/sudo:root@gentoo:/etc/portage/package.use"))

;; config
(defun config-visit ()
  (interactive)
  ;; all configs
	(find-file "~/.config/emacs/configs/packages.el")
 	(find-file "~/.config/emacs/configs/startup.el")
  (find-file "~/.config/emacs/configs/minimal.el")
	(find-file "~/.config/emacs/configs/melpa.el")
	(find-file "~/.config/emacs/configs/bindings.el")
  (find-file "~/.config/emacs/init.el"))

;; notes
(defun notes-visit ()
  (interactive)
  ;; insanity
  (find-file "~/insanity/insanity.org")
  (find-file "~/insanity/pure.org")
  (find-file "~/insanity/soul.org")
  (find-file "~/insanity/stats.org")
  (find-file "~/insanity/back.org")
	(find-file "~/insanity/scholar.org")
  (find-file "~/insanity/front.org")
  (find-file "~/insanity/coder.org")
  (find-file "~/insanity/archive.org")
  (find-file "~/insanity/container.org")
  (find-file "~/insanity/lunix.org")
  (find-file "~/insanity/church.org")
  (find-file "~/insanity/hat.org")
  (find-file "~/insanity/programmer.org"))

;; always open
(find-file "~/.config/emacs/diary")
(find-file "~/insanity/hell.org")

;; org agenda
(load-library "find-lisp")
(setq org-agenda-files
			(find-lisp-find-files "~/insanity/" "\.org$"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'startup)
;;; startup.el ends here
