(prefer-coding-system 'utf-8)

(when window-system
  (set-face-attribute 'default nil :family "MigMix 1M" :height 100)
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MigMix 1M"))
  (if (>= (x-display-pixel-width) 800) (setq width-gain 0.85) (setq width-gain 0.9))
  (if (>= (x-display-pixel-height) 1000) (setq height-gain 0.85) (setq height-gain 0.9))
  (set-frame-size (selected-frame)
		  (floor (/ (* (x-display-pixel-width) width-gain) (frame-char-width)))
		  (floor (/ (* (x-display-pixel-height) height-gain) (frame-char-height)))))
