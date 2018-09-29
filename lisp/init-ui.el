;; day one
;; turn off tool-bar
(tool-bar-mode -1)
;; turn off scroll-bar
(scroll-bar-mode -1)
;; open global-linum
(global-linum-mode t)
;; turn off splash-screen
(setq inhibit-splash-screen t)

;; close menu-bar
(menu-bar-mode -1)

;; make mouse shape bar globally

(setq-default cursor-type 'bar)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)

(provide 'init-ui)
