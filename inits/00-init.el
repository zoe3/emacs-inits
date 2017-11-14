;;; dired
;; ffap
(ffap-bindings)
;; 2
(setq dired-dwim-target t)


;; Windows
(defun uenox-dired-winstart ()
  "Type '\\[uenox-dired-winstart]': win-start the current line's file."
  (interactive)
  (if (eq major-mode 'dired-mode)
      (let ((fname (dired-get-filename)))
        (w32-shell-execute "open" fname)
        (message "win-started %s" fname))))
;;; dired のキー割り当て追加
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "z" 'uenox-dired-winstart))) ;;; 関連付け

;; dired-mode editable
(add-hook 'dired-load-hook (lambda ()
                  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))

;;;; auto-complete設定
(ac-config-default)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")

