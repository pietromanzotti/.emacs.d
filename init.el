;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives
;; 	     '("melpa2" . "http://www.mirrorservice.org/sites/melpa.org/packages/"))
;; (add-to-list 'package-archives
;;	     '("melpa3" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/"))
(package-initialize)


;; Bootstrap 'use-package'

(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

(provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zerodark-theme zenburn-theme which-key wgrep-ag web-mode use-package undo-tree try tern-auto-complete tao-theme synosaurus simple-mpc shrink-path rg prodigy posframe poet-theme pcre2el org-pdfview org-bullets noflet moe-theme mingus magit keyfreq js2-refactor irony-eldoc iedit hydra hungry-delete htmlize git-timemachine git-gutter fzf flycheck faff-theme expand-region exec-path-from-shell emmet-mode easy-kill dumb-jump doom-themes dired-subtree dired-narrow dictionary deadgrep counsel company-jedi company-irony color-theme-modern beacon base16-theme auto-yasnippet atomic-chrome all-the-icons-dired alect-themes aggressive-indent ag ace-window ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
