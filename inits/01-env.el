;;; 環境
(setq inhibit-startup-message t)
(set-locale-environment nil)
(set-language-environment 'Japanese)
;; (prefer-coding-system 'utf-8)
(prefer-coding-system 'cp932)

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

;; 文字コードを設定
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :family "MigMix 1M" :height 100)
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MigMix 1M")))

;; 画面の解像度によりフレームサイズを変化させる
(when window-system
  (if (>= (x-display-pixel-width) 800) (setq width-gain 0.85) (setq width-gain 0.9))
  (if (>= (x-display-pixel-height) 1000) (setq height-gain 0.85) (setq height-gain 0.9))
  (set-frame-size (selected-frame)
		  (floor (/ (* (x-display-pixel-width) width-gain) (frame-char-width)))
		  (floor (/ (* (x-display-pixel-height) height-gain) (frame-char-height)))))

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


