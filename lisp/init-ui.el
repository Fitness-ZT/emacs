;; -*- lexical-binding: t; -*-

;; 1. 关闭无用 UI 元素
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 2. 移除/美化标题栏
;; (如果你想要彻底隐藏窗口最上面的标题栏/外框，可解除下面这行的注释)
;; (add-to-list 'default-frame-alist '(undecorated . t))

;; 如果是 macOS 系统，可以让标题栏和暗黑主题完美融合
(when (memq window-system '(mac ns))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

;; 3. 全局显示相对行号（Relative Line Numbers）
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; 4. 基础 UI 润色
(setq inhibit-startup-screen t)        ; 关闭启动画面
(setq ring-bell-function 'ignore)       ; 关闭恼人的警告滴滴声
;;(global-hl-line-mode t)                 ; 高亮当前光标所在行




;; 极简精致版 Tux 欢迎页
(setq initial-scratch-message
"
     .--.
    |o_o |
    |:_/ |
   //   \\ \\
  (|     | )
 /'\\_   _/`\\
 \\___)=(___/

  \"We are all in the gutter,
   but some of us are looking at the stars.\"
                                -- Oscar Wilde

")


(provide 'init-ui)
