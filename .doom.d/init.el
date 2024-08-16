;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a "Module Index" link where you'll find
;;      a comprehensive list of Doom's modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :completion
       company           ; code completion
       ivy               ; search and replace w/ ripgrep

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       modeline          ; snazzy, Atom-inspired modeline, plus API
       ophints           ; highlight the region an operation acts on
       (popup +defaults) ; tame sudden yet inevitable temporary windows
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB


       :editor
       (evil +everywhere); evil (vim-like) mode
       fold              ; code folding
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired +icons)    ; file browsing
       electric          ; smarter, keyword-based electric-indent
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm             ; the best terminal emulation in Emacs

       :tools
       (eval +overlay)   ; run code, run (also, repls)
       macos             ; MacOS-specific commands
       magit               ; a git porcelain for Emacs

       :lang
       cc                ; C/C++/Obj-C madness
       data              ; config/data formats
       emacs-lisp        ; drown in parentheses
       json              ; At least it ain't XML
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       markdown          ; writing docs for people to ignore
       org               ; organize your plain life in plain text
       rest              ; Emacs as a REST client
       ruby              ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       swift             ; who asked for emoji variables?
       web               ; the tubes
       yaml              ; JSON, but readable

       :app
       everywhere

       :config
       (default +bindings +smartparens))
