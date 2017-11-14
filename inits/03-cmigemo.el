;;; cmigemo
(add-to-list 'exec-path' "~/.emacs.d/bin/cmigemo-default-win64")

(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-directory "c:/msys64/home/dstrain/.emacs.d/bin/cmigemo-default-win64/dict/cp932/migemo-dict")
(setq migemo-user-directory nil)
(setq migemo-regex-directory nil)
(setq migemo-coding-system 'cp932-dos)
(load-library "migemo")
(migemo-init)

;;(executable-find "cmigemo")
