;; ELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  (unless (package-installed-p 'init-loader)
    (package-refresh-contents)
    (package-install 'init-loader))
  (require 'init-loader)
  (init-loader-load))

(when (equal system-type 'windows-nt)
  (load-file "~/.emacs.d/init-windows-nt.el"))

(when (equal system-type 'gnu/linux)
  (load-file "~/.emacs.d/init-linux.el"))


