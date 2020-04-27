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


;; Frame Size and fonts
(when window-system
  (set-face-attribute 'default nil :family "M+ 1mn" :height 120)
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MigMix 1M"))
  (if (>= (x-display-pixel-width) 800) (setq width-gain 0.85) (setq width-gain 0.9))
  (if (>= (x-display-pixel-height) 1000) (setq height-gain 0.85) (setq height-gain 0.9))
  (set-frame-size (selected-frame)
		  (floor (/ (* (x-display-pixel-width) width-gain) (frame-char-width)))
		  (floor (/ (* (x-display-pixel-height) height-gain) (frame-char-height)))))

;; ELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize))

;;; 環境
(setq inhibit-startup-message t)
(set-locale-environment nil)
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; Emacs停止確認
(setq confirm-kill-emacs 'y-or-n-p)

;; temporary-file-directory
(setq temporary-file-directory (directory-file-name "~/.emacs.d/temp"))

;; scratch
(setq initial-scratch-message "")

;;; GUI
;; メニューバーを消す
(menu-bar-mode -1)
;; ツールバーを消す
(tool-bar-mode -1)

;;; 表示
;; ウィンドウを左右に分割したとき用の設定
(setq-default truncate-partial-width-windows t)
;; 改行の文字
(setq-default fill-column 95)
(setq auto-fill-mode nil)

;; カーソルの位置を表示する
(column-number-mode t)
(line-number-mode t)
;; ファイルサイズを表示
(size-indication-mode t)
;; 時刻表示
(display-time-mode t)

;;; ハイライト
;; 括弧の中身をハイライト
(show-paren-mode t)
;; カーソルの点滅を止める
(blink-cursor-mode 0)

;;  evalした結果を全部表示
(setq eval-expression-print-length nil)
;; 現在の行を目立たせる
(global-hl-line-mode)

;;; バックアップとオートセーブ
;; バックアップファイルを作らない
(setq backup-inhibited t)
;; 終了時にオートセーブファイルを消す
(setq delte-auto-save-files t)

;;;; auto-complete設定
(ac-config-default)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")

;;; dired
;; ffap
(ffap-bindings)
;; 2
(setq dired-dwim-target t)

;; dired-mode editable
(add-hook 'dired-load-hook (lambda ()
                  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))

;;; キーバインドの設定
;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)


;;; cmigemo
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)

;;; SKK
(global-set-key "\C-x\C-j" 'skk-mode)

;;; helm
(require 'helm-config)
(helm-mode 1)
