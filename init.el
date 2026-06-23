





;; 1. 将 lisp/ 目录加入到加载路径中
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 2. 启动后，将垃圾回收阈值恢复为合理的 50MB
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 50 1024 1024))))

;; 3. 将 Emacs 自动生成的 custom 配置隔离到 custom.el，保证 init.el 干净
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; 4. 依次加载子模块（注意顺序，package 最先，keybindings 最后）
(require 'init-const)
(require 'init-package)      ; 包管理器与主题
(require 'init-ui)           ; UI、相对行号
(require 'init-editor)       ; 编辑行为与复制增强
(require 'init-prog)         ; 编程语法高亮
(require 'init-org)          ; Org 模式基础
(require 'init-keybindings)  ; 快捷键绑定
(put 'upcase-region 'disabled nil)
