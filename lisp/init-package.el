;; -*- lexical-binding: t; -*-
(require 'package)

;; 1. 配置国内清华大学 Elpa 镜像源（下载快且极度稳定）
(setq package-archives
      '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; 2. 初始化包系统
(unless (bound-and-true-p package--initialized)
  (package-initialize))

;; 3. 自动下载并设置 use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; 让 use-package 默认自动安装缺失的插件包
(setq use-package-always-ensure t)

;; 4. 自动下载并启用经典的 Gruber Darker 主题
(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t))

(provide 'init-package)
