;;; init.el

;;; パッケージ管理
(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;;; 基本設定
(setq inhibit-startup-message t)
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq confirm-kill-emacs 'y-or-n-p)
(setq initial-scratch-message "")

;; バックアップ・オートセーブを無効化
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 表示
(column-number-mode t)
(size-indication-mode t)
(show-paren-mode t)
(blink-cursor-mode 0)
(global-hl-line-mode t)
(setq-default truncate-partial-width-windows t)
(setq eval-expression-print-length nil)

;; 履歴を保存
(savehist-mode t)
(recentf-mode t)
(setq recentf-max-saved-items 200)

;; カーソル位置のファイル/URLを開く
(ffap-bindings)

;; キーバインド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;;; Vertico - 縦型補完UI
(use-package vertico
  :init
  (vertico-mode))

;;; Orderless - スペース区切りの柔軟なマッチング
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;;; Marginalia - 補完候補に説明を追加
(use-package marginalia
  :init
  (marginalia-mode))

;;; Consult - 強化された検索・バッファ操作
(use-package consult
  :bind
  (("C-x b"   . consult-buffer)
   ("C-x C-r" . consult-recent-file)
   ("M-g g"   . consult-goto-line)
   ("M-s l"   . consult-line)))

;;; which-key - キーバインドのヒント表示
(use-package which-key
  :config
  (which-key-mode))

;;; migemo - 日本語インクリメンタルサーチ (cmigemo が必要)
(use-package migemo
  :if (executable-find "cmigemo")
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (migemo-init))

;;; DDSKK - 日本語入力
(use-package ddskk
  :bind ("C-x C-j" . skk-mode)
  :custom
  (skk-user-directory "~/.emacs.d/ddskk/")
  (skk-use-viper nil))

;;; Org-mode
(use-package org
  :ensure nil
  :hook (org-mode . visual-line-mode)
  :custom
  (org-startup-indented t)
  (org-hide-leading-stars t)
  (org-src-fontify-natively t)
  (org-return-follows-link t))

;;; org-modern - Orgの見た目を強化
(use-package org-modern
  :hook
  (org-mode . org-modern-mode))

;;; dired
(setq dired-dwim-target t)
(add-hook 'dired-load-hook
          (lambda ()
            (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-modern ddskk migemo which-key consult marginalia orderless vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
