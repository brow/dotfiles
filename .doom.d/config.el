;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tom Brow"
      user-mail-address "tom@tombrow.com")

;; GitHub access token for Magit/Forge/Ghub is stored in internet passwords
;; https://github.com/magit/ghub/issues/101#issue-518154838
;;
;; Ghub docs recommend making auth-sources more specific than the default:
;; https://magit.vc/manual/ghub.html#Storing-a-Token
(setq auth-sources '(macos-keychain-internet))

;; Magit
(after! magit
  (setq magit-copy-revision-abbreviated t)

  ;; Performance improvements for large repos
  ;; https://magit.vc/manual/magit/Performance.html
  (setq magit-revision-insert-related-refs nil)
  (remove-hook 'magit-refs-sections-hook 'magit-insert-tags)
  (remove-hook 'magit-refs-sections-hook 'magit-insert-remote-branches)
  (remove-hook 'magit-status-sections-hook 'magit-insert-tags-header)
  ;; Some additional ones from @emish
  ;; https://square.slack.com/archives/C02R18K7D/p1674684566557969?thread_ts=1669905070.619959&cid=C02R18K7D
  ;;
  ;; Don't show graph in log view, speeds up significantly.
  (setq magit-log-arguments
      '("-n256" "--decorate"))
  ;; Don't calculate the diff when I want to commit. I've usually reviewed my stage before initiating the commit.
  (remove-hook 'server-switch-hook 'magit-commit-diff)
  ;; Don't use other VC systems, we use Git and Magit. Helps performance.
  (setq vc-handled-backends nil)
  ;; Don't refresh the status buffer if it is not the current buffer (improves perf)
  (setq magit-refresh-status-buffer nil)
  ;; Make Squinter work better with magit
  (setq magit-git-environment
        (append magit-git-environment
                (list
                 "PRE_COMMIT_HOOK_AUTO_RESOLVE_ERRORS_AND_COMMIT=1"
                 )))

  ;; Automatically display process buffer after a git error
  ;; https://emacs.stackexchange.com/a/55946
  (defun auto-display-magit-process-buffer (&rest args)
    "Automatically display the process buffer when it is updated."
    (let ((magit-display-buffer-noselect t))
      (magit-process-buffer)))
  (advice-add 'magit-process-set-mode-line-error-status :before
    #'auto-display-magit-process-buffer)
  )

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; Auomatically load light or dark theme as system appearance changes
(let ((dark-theme 'doom-tomorrow-night)
        ;; Also good:
        ;; 'doom-gruvbox
        ;; 'doom-Iosvkem
        ;; 'doom-molokai
        ;; 'doom-monokai-spectrum
        ;; 'doom-xcode
      (light-theme 'doom-one-light))
        ;; Also good:
        ;; 'doom-flatwhite
        ;; 'doom-tomorrow-day
  (add-hook 'ns-system-appearance-change-functions
            (lambda (appearance)
              (mapc #'disable-theme custom-enabled-themes)
              (pcase appearance
                ('light (load-theme light-theme))
                ('dark (load-theme dark-theme)))))

  ;; Toggle manually
  (defun brow-toggle-theme ()
    "Switch between light and dark theme."
    (interactive)
    (let ((light-theme 'doom-one-light))
      (load-theme (if (eq doom-theme light-theme) dark-theme light-theme)))
    (redraw-display)))

;; Override Doom's default of treating the right Option key as Option (i.e.,
;; typing special characters) rather than Meta.
;; https://github.com/hlissner/doom-emacs/issues/4178
(setq ns-right-option-modifier 'meta)

;; By default, doom-{increase,decrease}-font-size goes in steps of 2. Too fast.
(setq doom-font-increment 1)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Automatically reload file when it changes on disk. Useful because I keep my
;; org files in a cloud-synced directory.
;; http://pragmaticemacs.com/emacs/automatically-revert-buffers/
(global-auto-revert-mode 1)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Less delay before which-key buffer appears
(setq which-key-idle-delay 0.3)

;; Don't prompt for confirmation when I try to quit (unless unsaved buffers)
(setq confirm-kill-emacs nil)

(map! :leader
      (:prefix "h" "T" 'brow-toggle-theme))

(map! :localleader
      :map org-mode-map
      "l f" 'org-mac-safari-insert-frontmost-url)

;; Configure vterm to use emacs state in evil-mode
(after! vterm
  ;; Set vterm to start in emacs state (not insert state)
  (evil-set-initial-state 'vterm-mode 'emacs)
  
  ;; Ensure we switch to emacs state when entering vterm
  (add-hook 'vterm-mode-hook
            (lambda ()
              (evil-emacs-state))))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#00212B" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   (quote
    ("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "0cb1b0ea66b145ad9b9e34c850ea8e842c4c4c83abe04e37455a1ef4cc5b8791" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c6b")
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 120 :width normal)))))
