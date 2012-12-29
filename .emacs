;; Emacs Configuration
;; Zhiqiang Ma, http://www.zhiqiangma.com

;; ===============common config==================

;; No start up message
(setq inhibit-startup-message t)

;; No beep warning
(setq visible-bell t)

;;to set foreground color to white
(set-foreground-color "white")

;;to set background color to black
(set-background-color "gray14")

;; No scroll bar
;; (scroll-bar-mode nil)

;; No tool bar
;; (tool-bar-mode nil)

;; No menu bar
(menu-bar-mode nil)

;; Set the frame size
(defun set-frame-size()
  (interactive)
  (if window-system
  (progn
     (setq initial-frame-alist '((width . 140) (height . 42))))))
(set-frame-size)

;; Display line and column number
(setq column-number-mode t)
(setq line-number-mode t)

;; Display the paren
(show-paren-mode t)

;; Only file name in the title bar
(setq frame-title-format (concat "%b"))

;; Replace tab with spaces
(setq-default indent-tabs-mode nil)

;; Set tab width
(setq-default tab-width 4)

;; Auto save mode
(setq auto-save-mode nil)

;; Set backup functions
(setq
  backup-by-copying t ; auto backup
  backup-directory-alist '(("."."~/.emacsbak")) ; store backup files in "~/.emacsbak"
  delete-old-versions t ; automatically delete old backup files
  kept-new-versions 6 ; keep only 6 version of backup
  kept-old-versions 2 ; keep the 2 oldest version of backup
  version-control t ; backup version control
)

;; Set default major mode to text-mode
(setq default-major-mode 'text-mode)

;; ===================end common config=============

;; =================== etags =====================
(defvar tags-cmd "etags -R ./* 2>/dev/null")

(defun regen-tags ()
  "Regenerate the tags file for the current working directory"
  (interactive)
  (let ((tag-file (concat default-directory "TAGS")))
    (shell-command tags-cmd)
    (visit-tags-table tag-file)))
;; =================== end etags =====================

;; ==================c/c++====================
(add-hook 'c-mode-hook 'linux-c-mode)

(defun linux-c-mode()
  (interactive)
  ;; Set the alias style of C
  (c-set-style "K&R")
  ;; Auto align after typed {
  (c-toggle-auto-state)
  ;; Hungry delete spaces when pressing Backspace
  (c-toggle-hungry-state)
  ;; Set width of TAB to 4
  (setq c-basic-offset 4)
  ;; Display the function name
  (which-function-mode)
  ;; Key define - compile
  (define-key c-mode-base-map [(f7)] 'compile)
  ;; Enter act same as C-j
  (define-key c-mode-map [return] 'newline-and-indent)
  ;; Code auto completion
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
)

(add-hook 'c++-mode-hook 'linux-c++-mode)

(defun linux-c++-mode()
  (interactive)
  (c-set-style "K&R")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode)
  (define-key c-mode-base-map [(f7)] 'compile)
  (define-key c++-mode-map [return] 'newline-and-indent)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
)

;; complete inside a word, otherwise indent
(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
    (hippie-expand nil)
    (indent-for-tab-command)))

(autoload 'senator-try-expand-semantic "senator")

;; hippie auto expand, use senator first
(setq hippie-expand-try-functions-list
 	  '(
		senator-try-expand-semantic
		try-expand-dabbrev
		try-expand-dabbrev-visible
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-expand-list
		try-expand-list-all-buffers
		try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)

;; define the make command
'(compile-command "make")

;; ==================end c/c++================

;; ==================tuareg===================
;; tuareg-mode set
(setq auto-mode-alist (cons '(".mlw?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;; ==================end tuareg===============
