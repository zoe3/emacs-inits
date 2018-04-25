;;(setq python-shell-completion-navtive-enable nil)

;; Elpyを有効化
(elpy-enable)

;; REPL環境にIPythonを使う
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; 自動保管のバックエンドとしてRopeかJediを選択
(setq elpy-rpc-backend "jedi")

