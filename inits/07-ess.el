;; ESS
(require 'ess-r-mode)
;(setq inferior-R-program-name "C:\Program Files\R\R-3.4.1\bin\x64\Rterm.exe")

;(executable-find "Rterm.exe")
(add-hook 'ess-mode-hook
	  (lambda ()
	    (local-set-key (kbd "RET") 'newline)))

(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

