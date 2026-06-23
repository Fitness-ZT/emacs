;; -*- lexical-binding: t; -*-

;; 1. 核心编辑设置
(setq-default indent-tabs-mode nil)     ; 使用空格代替 Tab 键
(setq-default tab-width 4)              ; Tab 宽度设为 4 个空格
(electric-pair-mode t)                  ; 开启括号、引号自动配对

;; 2. 整理垃圾临时文件（将自动备份文件统一放到 tmp 目录下，不弄脏你的项目）
(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

;; 3. 高级复制函数：若选中则复制选中区域，若未选中则直接复制当前整行
(defun my/copy-line-or-region ()
  "如果选中了区域则复制区域，否则直接复制当前整行。"
  (interactive)
  (if (use-region-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-end-position))
    (message "已复制当前行")))

(provide 'init-editor)
