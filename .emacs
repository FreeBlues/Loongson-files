;; 用于 loongson-2 8089D 笔记本下 Emacs + slime + CLisp 的配置文件
;(require 'cl)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Chinese-GBK")
 '(safe-local-variable-values (quote ((Package . CCL))))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Add the Package Archive
;; m-x package-list-packages
(require 'package)
(add-to-list 'package-archives'("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives'("elpa" . "http://tromey.com/elpa/") t)
(package-initialize)


;; Set background color
(setq *DEFAULT-EXTERNAL-FORMAT* :utf-8)

(set-cursor-color "white")
(set-mouse-color "blue")
(set-foreground-color "green")
(set-background-color "gray30")
(set-border-color "lightgreen")
(set-face-foreground 'highlight "red")
(set-face-background 'highlight "lightblue")
(set-face-foreground 'region "darkcyan")
(set-face-background 'region "lightblue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")


;; set font

(create-fontset-from-fontset-spec 
"-*-Courier New-normal-r-*-*-14-*-*-*-c-*-fontset-most, 
chinese-gbk:-*-simsun-normal-r-*-*-16-*-*-*-*-*-gbk*-*, 
chinese-gb2316:-*-simsun-normal-r-*-*-16-*-*-*-*-*-gb2316*-*, 
chinese-cns11643-5:-*-simsun-medium-r-*-*-16-*-*-*-*-*-gbk*-*, 
chinese-cns11643-6:-*-simsun-medium-r-*-*-16-*-*-*-*-*-gbk*-*, 
chinese-cns11643-7:-*-simsun-medium-r-*-*-16-*-*-*-*-*-gbk*-*, 
korean-ksc5601:-*-Batang-normal-r-*-*-16-*-*-*-c-*-ksc5601.1987*-*, 
chinese-big5-1:-*-simsun-normal-r-*-*-16-*-*-*-*-*-big5*-*, 
chinese-big5-2:-*-simsun-normal-r-*-*-16-*-*-*-*-*-big5*-*, 
japanese-jisx0208:-*-MS UI Gothic-medium-r-*-*-16-*-*-*-*-*-jisx0208*-*" t) 

;;; =========

;(setenv "CCL_DEFAULT_DIRECTORY" "~/LispBox-0.9/ccl-1.8-darwinx86")

(current-buffer)
(require 'syntax)
(eval-when-compile (require 'cl))

;(defgroup 'font-lock '((jit-lock custom-group))
;  "Font Lock mode text highlighting package."
;  :link '(custom-manual :tag "Emacs Manual" "(emacs)Font Lock")
;  :link '(custom-manual :tag "Elisp Manual" "(elisp)Font Lock Mode")
;  :group 'face)

;((jit-lock custom-group))

;;; =========

;(atom +)

;(setq default-directory "/Users/admin/ECode/CLISP/")

(setq temporary-file-directory "~/LispBox-0.93/tmp/")

;; Chinese character support
(setq sentence-end
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")


(add-to-list 'load-path "~/LispBox-0.93/quicklisp/")

(add-to-list 'load-path "~/LispBox-0.93/ccl-1.8-darwinx86/")
(add-to-list 'load-path "~/LispBox-0.93/sbcl-1.0.55/")
(add-to-list 'load-path "~/LispBox-0.93/CLISP-2.49/")

;; 20140119 最新的 slime
(add-to-list 'load-path "/LispBox-0.93/slime-20140119/")
;(setq load-path (cons "~/LispBox-0.93/slime-20140119/" load-path))

;; 用于和 swank 配套 clojure 的 slime，来自 technomancy / swank-clojure
;(add-to-list 'load-path "~/Github/slime-new/")
;(setq load-path (cons "~/Github/slime-new/" load-path))
;(require 'slime)

;(add-to-list 'load-path "~/LispBox-0.93/slime-2013-12-18/")
;(setq load-path (cons "~/LispBox-0.93/slime-2013-12-18/" load-path))

;(add-to-list 'load-path "~/LispBox-0.93/slime-2013-04-05/")
;(setq load-path (cons "~/LispBox-0.93/slime-2013-04-05/" load-path))

;(add-to-list 'load-path "~/.emacs.d/elpa/slime-20131116.2359/")
;(setq load-path (cons "~/.emacs.d/elpa/slime-20131116.2359/" load-path))


;(add-to-list 'load-path "~/ecode/clisp/")

;(add-to-list 'load-path "~/.emacs.d/slime-2012-11-13/")
;(setq load-path (cons "~/.emacs.d/slime-2012-11-13/" load-path))

;; 用于在缓冲区间快速切换 C-c s
;; r 当前Slime连接的REPL缓冲区， l 最近访问的Lisp源代码缓冲区，d 当前连接最近使用的SLDB缓冲区
;; ? 列出所有缓冲区，s slime-scratch缓冲区，c Slime连接缓冲区，t Slime线程缓冲区
(global-set-key "\C-c s" 'slime-selector)

(global-font-lock-mode t)

(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'lisp-mode-hook 'turn-on-font-lock)
(add-hook 'lisp-interactive-mode-hook 'turn-on-font-lock)

(font-lock-add-keywords 'lisp-mode '("[(]" "[)]"))
(font-lock-add-keywords 'emacs-lisp-mode '("[(]" "[)]"))
(font-lock-add-keywords 'lisp-interaction-mode '("[(]" "[)]"))

(font-lock-add-keywords 'lisp-mode '("定义函数"))

(font-lock-add-keywords 'lisp-mode '("[\,]" "[\`]" "[\']" "[\"]"))
(font-lock-add-keywords 'emacs-lisp-mode '("[\,]" "[\`]" "[\']" "[\"]"))
(font-lock-add-keywords 'lisp-interaction-mode '("[\,]" "[\`]" "[\']" "[\"]"))

;(font-lock-add-keywords 'lisp-mode '("\\'"))




;; markdown-mode
(add-to-list 'load-path "~/ECode/emacslisp/")
(autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
(setq auto-mode-alist
    (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; parenface.el 保存于 ~/Ecode/emacslisp/
(require 'parenface)
(set-face-foreground 'paren-face "DimGray")

;; linum 行号
(add-to-list 'load-path "~/LispBox-0.93/Emacs/Contents/Resources/lisp/")
(require 'linum)
(setq linum-format "%3d ")
(add-hook 'find-file-hooks (lambda () (linum-mode 1))) 

;; auto-complete 自动补全 C-c a
(add-to-list 'load-path "~/LispBox-0.93/auto-complete-1.3.1/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/LispBox-0.93/auto-complete-1.3.1/ac-dict")
(ac-config-default)
(add-hook 'lisp-mode-hook
  '(lambda ()
      (define-key lisp-mode-map "\C-ca" 'auto-complete-mode)))

(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'lisp-mode-hook 'turn-on-font-lock)

;; 防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
(setq scroll-margin 3  scroll-conservatively 10000)  

(add-to-list 'default-frame-alist '(width . 198))
(add-to-list 'default-frame-alist '(height . 54))


(set-language-environment "utf-8")
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8) 


(setq ansi-color-for-comint-mode t)
(setq-default pathname-coding-system 'utf-8)  
(setq default-process-coding-system '(utf-8 . utf-8))  
(setq locale-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)  
(setq slime-net-coding-system 'utf-8-unix)

(modify-coding-system-alist 'process "*" 'utf-8)  
(prefer-coding-system 'utf-8)

;Clojure-mode
;(add-to-list 'load-path "/Users/admin/Github/clojure-mode/")
;(require 'clojure-mode)

;; Cider
;(unless (package-installed-p 'cider)
;  (package-install 'cider))
(add-to-list 'load-path "~/Github/cider")
(require 'cider)

;(add-to-list 'load-path "~/Clojure/")
;(add-to-list 'load-path "~/Clojure/clojure-mode/")
;-----------
;(require 'clojure-mode)
;(require 'clojure-test-mode)


;(add-to-list 'load-path "~/ECode/CLISP/")
;(require 'cnlisp.el)

;(add-hook 'lisp-mode-hook
;  '(lambda ()
;      (define-key lisp-mode-map "\C-c \C-l" '(slime-load-file :external-format :utf-8))))
     ; (define-key lisp-mode-map "\C-ca" 'auto-complete-mode)
      ;(define-key lisp-mode-map "\C-ca" 'auto-complete-mode)
      ;(define-key lisp-mode-map "\C-ca" 'auto-complete-mode)))
;;; =========

;;; Note that if you save a heap image, the character
;;; encoding specified on the command line will be preserved,
;;; and you won't have to specify the -K utf-8 any more.
;;; (setq inferior-lisp-program "/usr/local/bin/ccl64 -K utf-8")

;; M-x run-lisp
;; inferior 方式
;(setq inferior-lisp-program "dx86cl64 -K utf-8")
;(setq inferior-lisp-program "sbcl -K utf-8")
;(setq inferior-lisp-program "clisp -K utf-8")

;(setq inferior-lisp-program "lein repl -K utf-8")
;(setq inferior-lisp-program "lein repl")
;(setq inferior-lisp-program "mvn clojure:repl")
;; Lein 所在的目录
(add-to-list 'exec-path "/opt/local/bin")
;(setq ns-command-modifier 'meta)

;; M-- M-x slime
;; slime 方式
(setq slime-lisp-implementations
      '((ccl ("~/LispBox-0.93/ccl-1.8-darwinx86/dx86cl64") :coding-system utf-8-unix)
	(sbcl ("~/LispBox-0.93/sbcl-1.0.55/sbcl") :coding-system utf-8-unix)
	(clisp ("~/LispBox-0.93/CLISP-2.49/clisp") :coding-system utf-8-unix)
	(clojure ("lein repl") :coding-system utf-8-unix)))

(require 'slime-autoloads)
;(require 'slime)

(global-set-key "\C-cs" 'slime-selector)

(slime-setup '(slime-fancy slime-asdf slime-banner slime-mrepl))
;(slime-setup '(slime-fancy slime-banner slime-mrepl))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
