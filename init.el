
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/") 
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(require 'init-packages)
(require 'init-ui)
(require 'init-keybinding)
(require 'init-org)
(require 'init-better-default)
(require 'my-python)
;; (require 'my-golang)
;; set key "<f2>" to open "~/.emacs.d/init.el"


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; (setenv "GOPATH" "/home/yb/.gvm/pkgsets/go1.8/global")

(load-file custom-file)
