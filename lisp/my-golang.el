;; (setq gofmt-command "goimports")


(require 'go-mode)

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )

(add-hook 'before-save-hook 'gofmt-before-save)
;; (add-hook 'go-mode-hook '(lambda ()
;;                            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
;; (add-hook 'go-mode-hook '(lambda ()
;;                            (local-set-key (kbd "C-c C-g") 'go-goto-imports)))

;; (add-hook 'go-mode-hook '(lambda ()
;;                            (local-set-key (kbd "C-c C-f") 'gofmt)))
;; (add-hook 'go-mode-hook '(lambda ()
;;                            (local-set-key (kbd "C-c C-k") 'godoc)))


(add-to-list 'load-path "/home/yb/.gvm/pkgsets/go1.8/global/src/github.com/dougm/goflymake")
(require 'go-flymake)


(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))


(provide 'my-golang)
