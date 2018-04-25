;;; dired
;; ffap
(ffap-bindings)
;; 2
(setq dired-dwim-target t)

;; dired-mode editable
(add-hook 'dired-load-hook (lambda ()
                  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))
