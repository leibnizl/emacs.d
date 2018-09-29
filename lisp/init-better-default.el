;; close ring bell
;; (setq ring-bell-function 'ignore)
(global-linum-mode t)
(global-auto-revert-mode t)

;; forbidden file backup, namely forbidden the file end with "~" in its filename
(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(")(funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

;; (delete-selection-mode t)

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Inent buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-debbrev
					 try-expand-debbrev-all-buffers
					 try-expand-debbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)

(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

(provide 'init-better-default)

(setq-default c-basic-offset 2)
(setq c-default-style "linux"
      c-basic-offset 2)

;; config to enable copy or paste outside
(setq x-select-enable-clipboard t)
