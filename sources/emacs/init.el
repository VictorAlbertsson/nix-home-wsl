;; Generic Settings
(use-package emacs
  :init
  (defalias 'yes-or-no-p 'y-or-n-p)
  (setq enable-recursive-minibuffers t
	show-trailing-whitespace     t
	indent-tabs-mode             nil
        fill-column                  80)
  (set-charset-priority 'unicode)
  (electric-pair-mode)
  :diminish
  eldoc-mode
  visual-line-mode)

;; Built-In
(use-package eglot
  :ensure
  :bind
  (:map eglot-mode-map
	("<f5>o" . eldoc)
	("<f5>x" . eglot-rename)
	("<f5>f" . eglot-format-buffer)
	("<f5>n" . flymake-goto-next-error)
	("<f5>p" . flymake-goto-prev-error)
	("<f5>d" . xref-find-definitions)
	("<f5>r" . xref-find-references)
	("<f5>m" . xref-pop-marker-stack)))

;; Third-Party
(use-package which-key
  :ensure
  :diminish
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
	which-key-idle-delay 0.05))

;; Third-Party
(use-package envrc
  :ensure
  :init
  (envrc-global-mode)
  :bind
  ("<f15>" . envrc-reload)
  ("<f20>" . envrc-deny)
  ("<f21>" . envrc-allow))

;; Third-Party
(use-package corfu
  :ensure
  :hook
  ;; Enable completion only when paired with an LSP
  (eglot-managed-mode . corfu-mode)
  :custom ; These might have to be moved to :config
  (corfu-cycle            t)
  (corfu-auto             t)
  (corfu-auto-delay       0.05)
  (corfu-auto-prefix      2)
  (corfu-quit-at-boundary 'separator)
  :bind
  (:map corfu-map
	("M-SPC" . corfu-insert-separator)))

;; Third-Party
(use-package olivetti
  :diminish
  :ensure
  ;; :init
  ;; (define-globalized-minor-mode global-olivetti-mode olivetti-mode
  ;;   (lambda ()
  ;;     (olivetti-mode)))
  ;; (global-olivetti-mode)
  :bind
  ("<f10>" . olivetti-mode))

;; Third-Party
(use-package nix-mode
  :mode
  "\\.nix\\'")

;; Built-In
(use-package rust-ts-mode
  :mode
  "\\.rs\\'"
  :hook
  (rust-ts-mode . eglot-ensure))
