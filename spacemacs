;; -*- mode: dotspacemacs -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration"
  (setq-default
   dotspacemacs-distribution 'spacemacs

   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t

   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(auto-completion
     better-defaults
     colors
     emacs-lisp
     git
     github
     helm
     html
     javascript
     markdown
     org
     rust
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell)
     shell-scripts
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     version-control)

   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil

   dotspacemacs-editing-style 'vim

   dotspacemacs-verbose-loading t

   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode

   dotspacemacs-themes '(base16-tomorrow-night
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Monospace"
                               :size 12
                               :weight medium
                               :width normal
                               :powerline-scale 1.1)

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-large-file-size 2
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5

   dotspacemacs-helm-resize t
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom

   dotspacemacs-loading-progress-bar t
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 95
   dotspacemacs-inactive-transparency 95

   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t

   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing))

(defun dotspacemacs/user-init ()
  "Initialization function for user code."

  (setq-default
   vc-follow-symlinks t
   require-final-newline t))

(defun dotspacemacs/user-config ()
  "Configuration function for user code."
    (setq powerline-default-separator 'bar)

    (add-hook 'css-mode-hook 'turn-on-rainbow-mode)
    (defun turn-on-rainbow-mode ()
       (rainbow-mode t))

    (setq
     js2-basic-offset 4
     js2-strict-trailing-comma-warning nil

     css-indent-offset 4

     web-mode-markup-indent-offset 4
     web-mode-css-indent-offset 4
     web-mode-code-indent-offset 4
     web-mode-attr-indent-offset 4

     tab-width 4
     indent-tabs-mode nil)

    (spacemacs/toggle-transparency))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
