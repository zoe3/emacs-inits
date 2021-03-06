;;; MELPA
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

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

;; elpy
(use-package elpy
  :config
  (elpy-enable)
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt"))

;;; DDSKK
(use-package skk
  :config
  (setq skk-user-directory "~/.emacs.d/ddskk/")

  (global-set-key "\C-x\C-j" 'skk-mode)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (global-set-key "\C-xt" 'skk-tutorial))

