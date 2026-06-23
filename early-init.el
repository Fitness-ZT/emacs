;; -*- lexical-binding: t; -*-

;; 1. 提升启动性能：垃圾回收阈值设为最大
(setq gc-cons-threshold most-positive-fixnum)

;; 2. 提前关闭图形界面组件（防止启动闪烁）
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; 3. 彻底禁用不需要的各种启动栏
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
