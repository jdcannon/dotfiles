(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(setq-default indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-alh")
 '(file-coding-system-alist
   (quote
    (("\\.dz\\'" no-conversion . no-conversion)
     ("\\.txz\\'" no-conversion . no-conversion)
     ("\\.xz\\'" no-conversion . no-conversion)
     ("\\.lzma\\'" no-conversion . no-conversion)
     ("\\.lz\\'" no-conversion . no-conversion)
     ("\\.g?z\\'" no-conversion . no-conversion)
     ("\\.\\(?:tgz\\|svgz\\|sifz\\)\\'" no-conversion . no-conversion)
     ("\\.tbz2?\\'" no-conversion . no-conversion)
     ("\\.bz2\\'" no-conversion . no-conversion)
     ("\\.Z\\'" no-conversion . no-conversion)
     ("\\.elc\\'" . utf-8-emacs)
     ("\\.el\\'" . prefer-utf-8)
     ("\\.utf\\(-8\\)?\\'" . utf-8)
     ("\\.xml\\'" . xml-find-file-coding-system)
     ("\\(\\`\\|/\\)loaddefs.el\\'" raw-text . raw-text-unix)
     ("\\.tar\\'" no-conversion . no-conversion)
     ("\\.po[tx]?\\'\\|\\.po\\." . po-find-file-coding-system)
     ("\\.\\(tex\\|ltx\\|dtx\\|drv\\)\\'" . latexenc-find-file-coding-system)
     ("" . utf-8))))
 '(fill-column 85)
 '(global-visual-fill-column-mode t)
 '(global-visual-line-mode t)
 '(initial-buffer-choice "~/")
 '(org-agenda-files (quote ("~/org/.tasks.org" "~/org/testtodo.org")))
 '(package-selected-packages
   (quote
    (visual-fill-column dired+ auctex vue-mode emmet-mode scss-mode telephone-line powerline-evil powerline key-chord evil-indent-textobject evil-surround evil-jumper evil-leader use-package magit helm evil slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq exec-path (append exec-path '("D:/texlive/2016/bin/win32/")))
(setq org-capture-templates '(("t" "Task" entry (file+headline "~/org/.tasks.org" "Tasks")
                              "* TODO %?\n %f %i\n %U\n %l")
                             ("j" "Journal" entry (file+datetree "~/org/.journal.org")
                              "* %?\nEntered on %U\n %i\n %a")))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "gs" 'magit-stage-modified
      "gf" 'magit-stage-file
      "gc" 'magit-commit
      "gp" 'magit-push-to-remote
      "u" 'insert-char
      "a" 'org-agenda
      "t" 'org-todo-list
      "e" 'find-file
      "k" 'kill-buffer
      "w" 'save-buffer
      "b" 'helm-buffers-list
      "x" 'helm-M-x)
    (global-evil-leader-mode))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (use-package evil-indent-textobject
    :ensure t))

(use-package telephone-line
  :ensure t
  :config
  (set-face-attribute 'mode-line nil
		    :box nil)
  (setq telephone-line-lhs
	'((evil   . (telephone-line-evil-tag-segment))
	  (accent . (telephone-line-vc-segment
		     telephone-line-erc-modified-channels-segment
		     telephone-line-process-segment))
	  (nil    . (telephone-line-minor-mode-segment
		     telephone-line-buffer-segment))))
  (setq telephone-line-rhs
	'((nil    . (telephone-line-misc-info-segment))
	  (accent . (telephone-line-major-mode-segment))
	  (evil   . (telephone-line-airline-position-segment))))
  (telephone-line-mode 1))

(use-package key-chord
  :ensure t
  :config
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl.exe")
  (setq slime-contribs '(slime-fancy)))

(use-package scss-mode
  :ensure t)
(use-package emmet-mode
  :ensure t)
(use-package web-mode
  :ensure t
  :config
  (defun cust-web-mode-hook ()
    "Hooks for web-mode"
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-enable-css-colorization t)
    (emmet-mode 1))
  (add-hook 'web-mode-hook 'cust-web-mode-hook)
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode)))
(use-package dired+
  :ensure t)
(use-package visual-fill-column
  :ensure t
  :config
  (defun cust-vfc-mode-hook ()
    "Hooks for visual-line-mode"
    (visual-fill-column-mode))
  (add-hook 'prog-mode-hook 'cust-vfc-mode-hook)
  (add-hook 'text-mode-hook 'cust-vfc-mode-hook))

(defun open-journal-file ()
  "Open the Journal File"
  (interactive)
  (find-file "~/org/.journal.org"))
(defun open-emacs-file ()
  "Open the emacs File"
  (interactive)
  (find-file "~/.emacs"))

(global-set-key (kbd "C-; g s") 'magit-stage-modified) 
(global-set-key (kbd "C-; g f") 'magit-stage-file) 
(global-set-key (kbd "C-; g c") 'magit-commit) 
(global-set-key (kbd "C-; g p") 'magit-push-to-remote) 
(global-set-key (kbd "C-; u") 'insert-char) 
(global-set-key (kbd "C-; f j") 'open-journal-file) 
(global-set-key (kbd "C-; f e") 'open-emacs-file) 
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c a") 'org-agenda) 
(global-set-key (kbd "C-c c") 'org-capture)

