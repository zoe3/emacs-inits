# emacs-inits

個人用 Emacs 設定ファイル

## 主な構成

| パッケージ | 用途 |
|---|---|
| vertico | 縦型補完UI |
| orderless | スペース区切りの柔軟なマッチング |
| marginalia | 補完候補への説明追加 |
| consult | 強化された検索・バッファ操作 |
| which-key | キーバインドのヒント表示 |
| migemo | 日本語インクリメンタルサーチ |
| ddskk | 日本語入力 |
| org + org-modern | Org-mode + 見た目強化 |

## 依存

- cmigemo（migemo を使う場合）: `sudo apt install cmigemo` など

## セットアップ

```sh
ln -s /path/to/emacs-inits/init.el ~/.emacs.d/init.el
```

## 主なキーバインド

| キー | コマンド |
|---|---|
| `C-x b` | consult-buffer |
| `C-x C-r` | consult-recent-file |
| `M-g g` | consult-goto-line |
| `M-s l` | consult-line |
| `C-x C-j` | skk-mode (DDSKK) |
| `C-c l` | toggle-truncate-lines |
