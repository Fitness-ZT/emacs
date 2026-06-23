;; =============================================================================
;; 相对行号配置
;; =============================================================================

;; 1. 设置行号类型为“相对行号” (显示当前行为绝对行号，其他行为相对行号)
(setq display-line-numbers-type 'relative)

;; 2. 全局启用行号
(global-display-line-numbers-mode t)

;; 3. 在特定的模式(Mode)中禁用行号，避免界面混乱
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                vterm-mode-hook
                eww-mode-hook
                pdf-view-mode-hook
                image-mode-hook
                treemacs-mode-hook
                help-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode -1))))


;; =============================================================================
;; 护眼主题配置 (doom-one)
;; =============================================================================

;; 确保 package.el 已初始化（如果你在 early-init.el 中禁用了它）
(require 'package)
(unless (bound-and-true-p package--initialized)
  (package-initialize))

;; 添加 Melpa 源（如果没有的话）
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; 自动安装 doom-themes
(unless (package-installed-p 'doom-themes)
  (package-refresh-contents)
  (package-install 'doom-themes))

(require 'doom-themes)

;; 载入 doom-one 主题 (柔和的浅黑色/深灰色)
(load-theme 'doom-gruvbox t)

;;：使 Mode-line (状态栏) 看起来更好看
(doom-themes-neotree-config)
(doom-themes-org-config)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
