;; config for melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
  (require 'cl)
  ;; add whatever packages you want here
  (defvar yb/packages '(
			company
			monokai-theme
			spacemacs-theme
			hungry-delete
			swiper
			counsel
			smartparens
			js2-mode
			nodejs-repl
			popwin
			elpy
			flycheck
			py-autopep8
			;; go-mode
			;; go-autocomplete
            web-mode
			js2-refactor
            expand-region
            iedit
            neotree
            all-the-icons
            autopair
			) "Default packages")
(setq package-selected-packages yb/packages)
  (defun yb/packages-installed-p ()
    (loop for pkg in yb/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))
  (unless (yb/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg yb/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))


;; open global-company
(global-company-mode t)

(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for smartparens

;; (require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;; (smartparens-global-mode t)
;; (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;; config for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))
(require 'nodejs-repl)

(ivy-mode 1)
(setq ivy-use-virtual-buffer t)


(require 'popwin)
(popwin-mode t)

(load-theme 'spacemacs-dark t)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; config for occur
(defun occur-dwim()
  "Call `occur` with a same default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; config for neotree
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; config for all-the-icons
(require 'all-the-icons)

;; config for autopair
(require 'autopair)
(autopair-global-mode)

(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
	;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
	(imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
				   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
          (lambda ()
		(setq imenu-create-index-function 'js2-imenu-make-index)))



(provide 'init-packages)
