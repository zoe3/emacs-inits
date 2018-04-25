;;; 環境
(setq inhibit-startup-message t)
(set-locale-environment nil)
(set-language-environment 'Japanese)

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
