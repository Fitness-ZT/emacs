;;; early-init.el --- 早期初始化配置 -*- lexical-binding: t; -*-

;; =============================================================================
;; 1. 垃圾回收（GC）与性能优化
;; =============================================================================

;; 临时将 GC 阈值设为极大值（约 100MB），防止启动期间频繁触发 GC
(setq gc-cons-threshold 100000000)

;; 临时禁用 file-name-handler-alist，加快文件加载和 `require` 速度
(define-advice require (:around (orig-fun &rest args) speed-up)
  "在加载包时暂时禁用 file-name-handler-alist 以加速启动。"
  (let ((file-name-handler-alist nil))
    (apply orig-fun args)))

;; 启动完成后，将 GC 阈值恢复到一个合理的值（例如 16MB），并清理内存
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216) ; 16MB
            ;; 恢复正常的垃圾回收，并强制执行一次 GC
            (garbage-collect)))

;; =============================================================================
;; 2. 界面优化（防止启动时闪烁）
;; =============================================================================

;; 提前关闭不必要的 GUI 元素，避免窗口创建后再隐藏导致的闪烁
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; 禁用默认的启动画面
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; =============================================================================
;; 3. 包管理器设置
;; =============================================================================

;; 阻止 Emacs 在启动时自动初始化 package.el。
;; 如果你使用 `straight.el`、`elpaca` 或者想在 `init.el` 中手动控制 package 载入，这非常有用。
(setq package-enable-at-startup nil)

;; =============================================================================
;; 4. 其他基础优化
;; =============================================================================

;; 优化文件读写编码（统一使用 UTF-8）
(set-language-environment "UTF-8")

;; 避免由于双缓冲导致的启动闪烁（特别是在 macOS/Linux 上）
(modify-all-frames-parameters '((internal-border-width . 0)))

(provide 'early-init)
;; early-init.el 结束
