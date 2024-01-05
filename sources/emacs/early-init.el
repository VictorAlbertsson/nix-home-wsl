(setq gc-cons-threshold  63000000
      gc-cons-percentage 0.6)

;; WARNING: Emacs will only use Nix-provided packages!
(setq package-archives        nil
      visible-bell            t
      inhibit-startup-screen  t
      initial-scratch-message ""
      make-backup-files       nil
      create-lockfiles        nil)

(push '(font                 . "Fira Code-14") default-frame-alist)
(push '(menu-bar-lines       . nil)            default-frame-alist)
(push '(tool-bar-lines       . nil)            default-frame-alist)
(push '(vertical-scroll-bars . nil)            default-frame-alist)

;; Windows fuckery ruining my keymaps :(
(define-key key-translation-map (kbd "<Launch6>")        (kbd "<f15>"))
(define-key key-translation-map (kbd "<AudioMicMute>")   (kbd "<f20>"))
(define-key key-translation-map (kbd "<TouchpadToggle>") (kbd "<f21>"))

(load-theme 'modus-vivendi t)
