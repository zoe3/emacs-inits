;;; helm
(setq dired-bind-jump nil)
(require 'helm-config)
(helm-mode 1)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(helm-migemo-mode 1)

(define-key global-map (kbd "C-;") 'helm-mini)

(setq helm-for-files-preferrend-list
      '(helm-source-buffers-list
;;	helm-source-recentf
;;	helm-source-bookmarks
	helm-source-files-in-current-dir
;;	helm-source-bookmark-set
	helm-source-file-cache))
