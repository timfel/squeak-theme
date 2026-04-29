;;; squeak-theme.el --- Squeak/Smalltalk 6.0 color theme -*- lexical-binding: t; -*-

;; Author: M Cooper Healy <m.cooper.healy@gmail.com>
;; Maintainer: M Cooper Healy <m.cooper.healy@gmail.com>
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.1"))
;; URL: https://github.com/isomatter-labs/squeak-theme
;; Keywords: faces themes
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:
;;
;; A faithful Emacs port of the Squeak/Smalltalk 6.0 color theme.
;;
;; Squeak's Morphic UI is famous for its colorful pastel windows — each
;; tool has its own tinted title bar and background.  This theme brings
;; that aesthetic to Emacs, mapping Squeak's window types to Emacs
;; concepts:
;;
;;   Workspace (green)    → mode-line, header-line, org blocks
;;   Transcript (orange)  → eshell, shell, term, compilation output
;;   Browser (pink)       → Dired, treemacs, file navigation
;;   Inspector (blue)     → help, info, describe-* buffers
;;   Debugger (salmon)    → edebug, warnings, diff removed
;;
;; Syntax colors are derived from Squeak's Shout highlighter:
;;
;;   Black   #000000 — default text, variables, types
;;   Maroon  #800000 — keywords, constants, numbers, storage
;;   Navy    #000080 — functions, methods, operators, symbols
;;   Purple  #800080 — strings, string delimiters
;;   Teal    #008080 — comments
;;   Red     #f44747 — errors
;;
;; Colors are sourced from the SqueakTheme class in Squeak 6.0 and
;; cross-referenced with LinqLover's VS Code Squeak theme:
;; <https://github.com/LinqLover/vscode-squeak-theme>
;;
;; To use, add this directory to `custom-theme-load-path' and then:
;;
;;   M-x load-theme RET squeak RET
;;
;; Or in your init file:
;;
;;   (load-theme 'squeak t)

;;; Code:

(deftheme squeak
  "Squeak/Smalltalk 6.0 color theme — colorful pastel windows and all.")

(let ((class '((class color) (min-colors 89)))

      ;; === Shout syntax palette ===
      (sq-fg         "#000000")
      (sq-bg         "#ffffff")
      (sq-maroon     "#800000")  ; keywords, constants, numbers, storage
      (sq-navy       "#000080")  ; functions, methods, symbols, operators
      (sq-purple     "#800080")  ; strings
      (sq-teal       "#008080")  ; comments
      (sq-error      "#f44747")  ; errors/invalid

      ;; === Squeak Morphic window chrome ===
      ;; Each Squeak tool has a distinctive pastel title bar.
      ;; These are the classic SqueakTheme window colors.

      ;; Workspace — the green one (code editing)
      (sq-green        "#c3e6a1")  ; title bar active (from VS Code theme)
      (sq-green-dim    "#b2d192")  ; title bar inactive
      (sq-green-border "#82996b")  ; title bar border
      (sq-green-bg     "#f3f9ec")  ; very faint green wash for editor backgrounds

      ;; Transcript — the orange one (output, logs, REPL)
      (sq-orange       "#e6cfa1")  ; title bar
      (sq-orange-dim   "#d9c494")  ; inactive
      (sq-orange-border "#998a6b") ; border
      (sq-orange-bg    "#fdf8f0")  ; faint orange wash

      ;; Browser — the pink one (file navigation, browsing)
      (sq-pink         "#e8c5d0")  ; title bar
      (sq-pink-dim     "#d9b6c1")  ; inactive
      (sq-pink-border  "#997b86")  ; border
      (sq-pink-bg      "#fdf4f7")  ; faint pink wash

      ;; Inspector — the blue one (help, documentation, introspection)
      (sq-blue         "#c5d5e8")  ; title bar
      (sq-blue-dim     "#b6c6d9")  ; inactive
      (sq-blue-border  "#7b8b99")  ; border
      (sq-blue-bg      "#f2f6fb")  ; faint blue wash

      ;; Debugger — the salmon one (errors, debugging, warnings)
      (sq-salmon       "#e6b7b7")  ; title bar (from VS Code debugging bar)
      (sq-salmon-dim   "#d9aaaa")  ; inactive
      (sq-salmon-border "#997a7a") ; border (from VS Code debuggingBorder)
      (sq-salmon-bg    "#fdf3f3")  ; faint salmon wash

      ;; === UI chrome (from VS Code theme) ===
      (sq-selection   "#b8b8e6")  ; lavender selection
      (sq-focus       "#6680b2")  ; active list / focus ring
      (sq-focus-border "#4d8080") ; focus border (teal-ish)
      (sq-gray-light  "#e6e6e6")  ; panel backgrounds
      (sq-gray-mid    "#999999")  ; borders
      (sq-gray        "#808080")  ; inactive / dim text
      (sq-gray-subtle "#f0f0f0")  ; subtle bg for hl-line
      (sq-sidebar-hd  "#e8e8e8") ; section headers

      ;; === Popup / balloon help ===
      (sq-popup       "#ffffb8")  ; Squeak BalloonMorph pale yellow
      (sq-popup-border "#d4d4a0")) ; muted olive border for popups

  (custom-theme-set-faces
   'squeak

   ;; =====================================================================
   ;; Basic faces
   ;; =====================================================================
   `(default                          ((,class (:background ,sq-bg :foreground ,sq-fg))))
   `(cursor                           ((,class (:background ,sq-navy))))
   `(fringe                           ((,class (:background ,sq-bg))))
   `(vertical-border                  ((,class (:foreground ,sq-gray-mid))))
   `(border                           ((,class (:background ,sq-gray-mid))))
   `(shadow                           ((,class (:foreground ,sq-gray))))
   `(link                             ((,class (:foreground ,sq-navy :underline t))))
   `(link-visited                     ((,class (:foreground ,sq-purple :underline t))))
   `(escape-glyph                     ((,class (:foreground ,sq-navy))))
   `(minibuffer-prompt                ((,class (:foreground ,sq-navy :weight bold))))
   `(error                            ((,class (:foreground ,sq-error :weight bold))))
   `(warning                          ((,class (:foreground ,sq-maroon :weight bold))))
   `(success                          ((,class (:foreground ,sq-teal :weight bold))))
   `(tooltip                          ((,class (:background ,sq-popup :foreground ,sq-fg
                                                           :box (:line-width 1 :color ,sq-popup-border)))))

   ;; =====================================================================
   ;; Mode line — Workspace green (the active window's title bar)
   ;; =====================================================================
   `(mode-line                        ((,class (:background ,sq-green :foreground ,sq-fg
                                                            :box (:line-width 1 :color ,sq-green-border)))))
   `(mode-line-inactive               ((,class (:background ,sq-green-dim :foreground "#606060"
                                                            :box (:line-width 1 :color ,sq-green-border)))))
   `(mode-line-buffer-id              ((,class (:foreground ,sq-fg :weight bold))))
   `(mode-line-emphasis               ((,class (:foreground ,sq-maroon :weight bold))))

   ;; Header line — slightly different green, like a second pane title
   `(header-line                      ((,class (:background ,sq-green :foreground ,sq-fg
                                                            :box (:line-width 1 :color ,sq-green-border)))))

   ;; =====================================================================
   ;; Region / selection — Squeak's lavender selection
   ;; =====================================================================
   `(region                           ((,class (:background ,sq-selection))))
   `(highlight                        ((,class (:background ,sq-selection))))
   `(hl-line                          ((,class (:background ,sq-gray-subtle))))
   `(secondary-selection              ((,class (:background ,sq-sidebar-hd))))

   ;; =====================================================================
   ;; Search — Squeak's yellow search highlight + blue focus
   ;; =====================================================================
   `(isearch                          ((,class (:background "#ffff17" :foreground ,sq-fg :weight bold))))
   `(isearch-fail                     ((,class (:background ,sq-salmon :foreground ,sq-fg))))
   `(lazy-highlight                   ((,class (:background ,sq-selection))))
   `(match                            ((,class (:background "#ffff17" :foreground ,sq-fg))))

   ;; =====================================================================
   ;; Font-lock (Shout syntax highlighting)
   ;; =====================================================================
   `(font-lock-builtin-face           ((,class (:foreground ,sq-navy))))
   `(font-lock-comment-face           ((,class (:foreground ,sq-teal :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,sq-teal :slant italic))))
   `(font-lock-doc-face               ((,class (:foreground ,sq-teal :slant italic))))
   `(font-lock-constant-face          ((,class (:foreground ,sq-maroon))))
   `(font-lock-function-name-face     ((,class (:foreground ,sq-navy))))
   `(font-lock-keyword-face           ((,class (:foreground ,sq-maroon))))
   `(font-lock-negation-char-face     ((,class (:foreground ,sq-maroon))))
   `(font-lock-preprocessor-face      ((,class (:foreground ,sq-maroon))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,sq-navy))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,sq-navy))))
   `(font-lock-string-face            ((,class (:foreground ,sq-purple))))
   `(font-lock-type-face              ((,class (:foreground ,sq-fg))))
   `(font-lock-variable-name-face     ((,class (:foreground ,sq-fg))))
   `(font-lock-warning-face           ((,class (:foreground ,sq-error :weight bold))))

   ;; =====================================================================
   ;; Parens
   ;; =====================================================================
   `(show-paren-match                 ((,class (:background ,sq-selection :weight bold))))
   `(show-paren-mismatch              ((,class (:background ,sq-error :foreground "#ffffff" :weight bold))))

   ;; =====================================================================
   ;; Line numbers
   ;; =====================================================================
   `(line-number                      ((,class (:foreground ,sq-gray))))
   `(line-number-current-line         ((,class (:foreground ,sq-fg :weight bold))))

   ;; =====================================================================
   ;; Whitespace
   ;; =====================================================================
   `(trailing-whitespace              ((,class (:background ,sq-salmon))))
   `(whitespace-trailing              ((,class (:background ,sq-salmon))))

   ;; =====================================================================
   ;; Dired — Browser pink (file navigation)
   ;; =====================================================================
   `(dired-directory                  ((,class (:foreground ,sq-navy :weight bold))))
   `(dired-symlink                    ((,class (:foreground ,sq-teal))))
   `(dired-ignored                    ((,class (:foreground ,sq-gray))))
   `(dired-flagged                    ((,class (:foreground ,sq-error :weight bold))))
   `(dired-marked                     ((,class (:foreground ,sq-purple :weight bold))))
   `(dired-header                     ((,class (:background ,sq-pink :foreground ,sq-fg
                                                            :box (:line-width 1 :color ,sq-pink-border)
                                                            :weight bold))))

   ;; =====================================================================
   ;; Compilation / grep — Transcript orange (output)
   ;; =====================================================================
   `(compilation-error                ((,class (:foreground ,sq-error :weight bold))))
   `(compilation-warning              ((,class (:foreground ,sq-maroon))))
   `(compilation-info                 ((,class (:foreground ,sq-navy))))
   `(compilation-mode-line-exit       ((,class (:foreground ,sq-teal :weight bold))))
   `(compilation-mode-line-fail       ((,class (:foreground ,sq-error :weight bold))))
   `(compilation-mode-line-run        ((,class (:foreground ,sq-navy :weight bold))))

   ;; =====================================================================
   ;; Eshell / Shell / Term — Transcript orange tint
   ;; =====================================================================
   `(eshell-prompt                    ((,class (:foreground ,sq-navy :weight bold))))
   `(eshell-ls-directory              ((,class (:foreground ,sq-navy :weight bold))))
   `(eshell-ls-executable             ((,class (:foreground ,sq-teal))))
   `(eshell-ls-symlink                ((,class (:foreground ,sq-purple))))
   `(eshell-ls-archive                ((,class (:foreground ,sq-maroon))))
   `(eshell-ls-readonly               ((,class (:foreground ,sq-gray))))

   ;; Term/ansi-term colors — use the Squeak palette
   `(term-color-black                 ((,class (:foreground ,sq-fg :background ,sq-fg))))
   `(term-color-red                   ((,class (:foreground ,sq-maroon :background ,sq-maroon))))
   `(term-color-green                 ((,class (:foreground "#2e8b2e" :background "#2e8b2e"))))
   `(term-color-yellow                ((,class (:foreground "#8b8b00" :background "#8b8b00"))))
   `(term-color-blue                  ((,class (:foreground ,sq-navy :background ,sq-navy))))
   `(term-color-magenta               ((,class (:foreground ,sq-purple :background ,sq-purple))))
   `(term-color-cyan                  ((,class (:foreground ,sq-teal :background ,sq-teal))))
   `(term-color-white                 ((,class (:foreground ,sq-gray-light :background ,sq-gray-light))))

   ;; =====================================================================
   ;; Help / Info — Inspector blue tint
   ;; =====================================================================
   `(info-title-1                     ((,class (:foreground ,sq-navy :weight bold :height 1.3))))
   `(info-title-2                     ((,class (:foreground ,sq-navy :weight bold :height 1.2))))
   `(info-title-3                     ((,class (:foreground ,sq-navy :weight bold :height 1.1))))
   `(info-title-4                     ((,class (:foreground ,sq-navy :weight bold))))
   `(info-header-node                 ((,class (:foreground ,sq-maroon :weight bold))))
   `(info-header-xref                 ((,class (:foreground ,sq-navy :underline t))))
   `(info-menu-star                   ((,class (:foreground ,sq-maroon))))
   `(help-key-binding                 ((,class (:foreground ,sq-navy :background ,sq-blue-bg
                                                            :box (:line-width 1 :color ,sq-blue-border)))))

   ;; =====================================================================
   ;; Custom (describe-*) — Inspector blue header
   ;; =====================================================================
   `(custom-group-tag                 ((,class (:foreground ,sq-navy :weight bold :height 1.2))))
   `(custom-variable-tag              ((,class (:foreground ,sq-navy :weight bold))))
   `(custom-state                     ((,class (:foreground ,sq-teal))))
   `(custom-button                    ((,class (:background ,sq-sidebar-hd :foreground ,sq-fg
                                                            :box (:line-width 1 :color ,sq-gray-mid)))))
   `(custom-button-mouse              ((,class (:background ,sq-blue :foreground ,sq-fg
                                                            :box (:line-width 1 :color ,sq-blue-border)))))
   `(custom-button-pressed            ((,class (:background ,sq-focus :foreground "#ffffff"
                                                            :box (:line-width 1 :color ,sq-focus)))))

   ;; =====================================================================
   ;; Org-mode — uses the full window palette for visual hierarchy
   ;; =====================================================================
   `(org-document-title               ((,class (:foreground ,sq-fg :weight bold :height 1.5))))
   `(org-level-1                      ((,class (:foreground ,sq-navy :weight bold :height 1.3))))
   `(org-level-2                      ((,class (:foreground ,sq-maroon :weight bold :height 1.2))))
   `(org-level-3                      ((,class (:foreground ,sq-teal :weight bold :height 1.1))))
   `(org-level-4                      ((,class (:foreground ,sq-purple :weight bold))))
   `(org-level-5                      ((,class (:foreground ,sq-navy))))
   `(org-level-6                      ((,class (:foreground ,sq-maroon))))
   `(org-level-7                      ((,class (:foreground ,sq-teal))))
   `(org-level-8                      ((,class (:foreground ,sq-gray))))
   `(org-code                         ((,class (:foreground ,sq-purple :background ,sq-green-bg))))
   `(org-verbatim                     ((,class (:foreground ,sq-purple :background ,sq-green-bg))))
   `(org-block                        ((,class (:background ,sq-green-bg))))
   `(org-block-begin-line             ((,class (:foreground ,sq-gray :background ,sq-green-bg
                                                            :slant italic))))
   `(org-block-end-line               ((,class (:foreground ,sq-gray :background ,sq-green-bg
                                                            :slant italic))))
   `(org-quote                        ((,class (:background ,sq-blue-bg :slant italic))))
   `(org-link                         ((,class (:foreground ,sq-navy :underline t))))
   `(org-todo                         ((,class (:foreground "#ffffff" :background ,sq-maroon
                                                            :weight bold
                                                            :box (:line-width 1 :color ,sq-maroon)))))
   `(org-done                         ((,class (:foreground "#ffffff" :background ,sq-teal
                                                            :weight bold
                                                            :box (:line-width 1 :color ,sq-teal)))))
   `(org-date                         ((,class (:foreground ,sq-navy :underline t))))
   `(org-table                        ((,class (:foreground ,sq-navy))))
   `(org-formula                      ((,class (:foreground ,sq-maroon))))
   `(org-special-keyword              ((,class (:foreground ,sq-gray))))

   ;; =====================================================================
   ;; Markdown
   ;; =====================================================================
   `(markdown-header-face-1           ((,class (:foreground ,sq-fg :weight bold :height 1.3))))
   `(markdown-header-face-2           ((,class (:foreground ,sq-fg :weight bold :height 1.2))))
   `(markdown-header-face-3           ((,class (:foreground ,sq-fg :weight bold :height 1.1))))
   `(markdown-header-face-4           ((,class (:foreground ,sq-fg :weight bold))))
   `(markdown-code-face               ((,class (:foreground ,sq-purple :background ,sq-green-bg))))
   `(markdown-inline-code-face        ((,class (:foreground ,sq-purple :background ,sq-green-bg))))
   `(markdown-pre-face                ((,class (:foreground ,sq-purple :background ,sq-green-bg))))
   `(markdown-link-face               ((,class (:foreground ,sq-navy))))
   `(markdown-url-face                ((,class (:foreground ,sq-maroon))))
   `(markdown-bold-face               ((,class (:foreground ,sq-maroon :weight bold))))
   `(markdown-italic-face             ((,class (:foreground ,sq-maroon :slant italic))))
   `(markdown-blockquote-face         ((,class (:foreground ,sq-teal :background ,sq-blue-bg))))

   ;; =====================================================================
   ;; Diff — green/pink tinted backgrounds (Workspace vs Debugger)
   ;; =====================================================================
   `(diff-added                       ((,class (:background ,sq-green-bg :foreground ,sq-fg))))
   `(diff-removed                     ((,class (:background ,sq-salmon-bg :foreground ,sq-fg))))
   `(diff-changed                     ((,class (:background ,sq-orange-bg :foreground ,sq-fg))))
   `(diff-refine-added                ((,class (:background ,sq-green :foreground ,sq-fg))))
   `(diff-refine-removed              ((,class (:background ,sq-salmon :foreground ,sq-fg))))
   `(diff-refine-changed              ((,class (:background ,sq-orange :foreground ,sq-fg))))
   `(diff-header                      ((,class (:background ,sq-blue-bg :foreground ,sq-navy :weight bold))))
   `(diff-file-header                 ((,class (:background ,sq-blue :foreground ,sq-fg :weight bold))))
   `(diff-hunk-header                 ((,class (:background ,sq-blue-bg :foreground ,sq-navy))))
   `(diff-indicator-added             ((,class (:foreground ,sq-teal :weight bold))))
   `(diff-indicator-removed           ((,class (:foreground ,sq-maroon :weight bold))))
   `(diff-indicator-changed           ((,class (:foreground ,sq-navy :weight bold))))

   ;; =====================================================================
   ;; Magit — full Squeak window palette
   ;; =====================================================================
   `(magit-section-heading            ((,class (:foreground ,sq-navy :weight bold))))
   `(magit-section-highlight          ((,class (:background ,sq-gray-subtle))))
   `(magit-diff-added                 ((,class (:background ,sq-green-bg :foreground ,sq-fg))))
   `(magit-diff-added-highlight       ((,class (:background ,sq-green :foreground ,sq-fg))))
   `(magit-diff-removed               ((,class (:background ,sq-salmon-bg :foreground ,sq-fg))))
   `(magit-diff-removed-highlight     ((,class (:background ,sq-salmon :foreground ,sq-fg))))
   `(magit-diff-context               ((,class (:foreground ,sq-gray))))
   `(magit-diff-context-highlight     ((,class (:background ,sq-gray-subtle :foreground ,sq-fg))))
   `(magit-diff-hunk-heading          ((,class (:background ,sq-blue-bg :foreground ,sq-navy))))
   `(magit-diff-hunk-heading-highlight ((,class (:background ,sq-blue :foreground ,sq-fg))))
   `(magit-diff-file-heading          ((,class (:foreground ,sq-fg :weight bold))))
   `(magit-branch-local               ((,class (:foreground ,sq-navy :weight bold))))
   `(magit-branch-remote              ((,class (:foreground ,sq-teal :weight bold))))
   `(magit-tag                        ((,class (:foreground ,sq-maroon))))
   `(magit-hash                       ((,class (:foreground ,sq-gray))))
   `(magit-log-author                 ((,class (:foreground ,sq-purple))))
   `(magit-log-date                   ((,class (:foreground ,sq-gray))))
   `(magit-bisect-bad                 ((,class (:foreground ,sq-error))))
   `(magit-bisect-good                ((,class (:foreground ,sq-teal))))
   `(magit-blame-heading              ((,class (:background ,sq-orange-bg :foreground ,sq-fg))))

   ;; =====================================================================
   ;; Git gutter — soft pastels instead of harsh primaries
   ;; Uses the Squeak window tints: green=added, orange=modified, salmon=deleted
   ;; =====================================================================
   `(git-gutter:added                 ((,class (:foreground "#7ab648" :background "#7ab648"))))
   `(git-gutter:modified              ((,class (:foreground "#c4a24d" :background "#c4a24d"))))
   `(git-gutter:deleted               ((,class (:foreground "#c47a7a" :background "#c47a7a"))))
   `(git-gutter-fr:added              ((,class (:foreground "#7ab648" :background "#7ab648"))))
   `(git-gutter-fr:modified           ((,class (:foreground "#c4a24d" :background "#c4a24d"))))
   `(git-gutter-fr:deleted            ((,class (:foreground "#c47a7a" :background "#c47a7a"))))

   ;; =====================================================================
   ;; why-this (blame annotations) — gentle Squeak pastels
   ;; =====================================================================
   `(why-this-face                    ((,class (:foreground "#6b9999" :slant italic)))) ; muted teal
   `(why-this-annotate-heat-map-cold  ((,class (:background ,sq-blue-bg))))   ; Inspector blue wash
   `(why-this-annotate-heat-map-warm  ((,class (:background ,sq-orange-bg)))) ; Transcript orange wash

   ;; =====================================================================
   ;; Flycheck / Flymake — Debugger salmon for errors
   ;; =====================================================================
   `(flycheck-error                   ((,class (:underline (:style wave :color ,sq-error)))))
   `(flycheck-warning                 ((,class (:underline (:style wave :color ,sq-maroon)))))
   `(flycheck-info                    ((,class (:underline (:style wave :color ,sq-navy)))))
   `(flymake-error                    ((,class (:underline (:style wave :color ,sq-error)))))
   `(flymake-warning                  ((,class (:underline (:style wave :color ,sq-maroon)))))
   `(flymake-note                     ((,class (:underline (:style wave :color ,sq-navy)))))

   ;; =====================================================================
   ;; Company / Corfu — tooltip with Squeak button style
   ;; =====================================================================
   `(completions-common-part          ((,class (:foreground ,sq-navy))))
   `(completions-first-difference     ((,class (:foreground ,sq-maroon :weight bold))))
   `(company-tooltip                  ((,class (:background ,sq-popup :foreground ,sq-fg))))
   `(company-tooltip-selection        ((,class (:background ,sq-selection :foreground ,sq-fg))))
   `(company-tooltip-common           ((,class (:foreground ,sq-navy :weight bold))))
   `(company-tooltip-annotation       ((,class (:foreground ,sq-gray))))
   `(company-scrollbar-bg             ((,class (:background ,sq-popup))))
   `(company-scrollbar-fg             ((,class (:background ,sq-focus))))
   `(corfu-default                    ((,class (:background ,sq-popup :foreground ,sq-fg))))
   `(corfu-current                    ((,class (:background ,sq-selection :foreground ,sq-fg :weight bold))))
   `(corfu-border                     ((,class (:background ,sq-popup-border))))

   ;; =====================================================================
   ;; Eldoc-box / popups — Squeak BalloonMorph pale yellow
   ;; =====================================================================
   `(eldoc-box-body                   ((,class (:background ,sq-popup :foreground ,sq-fg))))
   `(eldoc-box-border                 ((,class (:background ,sq-popup-border))))
   `(popup-face                       ((,class (:background ,sq-popup :foreground ,sq-fg))))
   `(popup-tip-face                   ((,class (:background ,sq-popup :foreground ,sq-fg
                                                            :box (:line-width 1 :color ,sq-popup-border)))))
   `(popup-menu-face                  ((,class (:background ,sq-popup :foreground ,sq-fg))))
   `(popup-menu-selection-face        ((,class (:background ,sq-selection :foreground ,sq-fg))))
   `(child-frame-border               ((,class (:background ,sq-popup-border))))

   ;; =====================================================================
   ;; Tab bar — like Squeak's window tabs
   ;; =====================================================================
   `(tab-bar                          ((,class (:background ,sq-gray-light :foreground ,sq-fg))))
   `(tab-bar-tab                      ((,class (:background ,sq-green :foreground ,sq-fg :weight bold
                                                            :box (:line-width 1 :color ,sq-green-border)))))
   `(tab-bar-tab-inactive             ((,class (:background ,sq-gray-light :foreground ,sq-gray
                                                            :box (:line-width 1 :color ,sq-gray-mid)))))
   `(tab-bar-tab-group-current        ((,class (:background ,sq-green :foreground ,sq-fg :weight bold))))
   `(tab-bar-tab-group-inactive       ((,class (:background ,sq-gray-light :foreground ,sq-gray))))

   ;; =====================================================================
   ;; Ediff — green vs salmon (Workspace vs Debugger)
   ;; =====================================================================
   `(ediff-current-diff-A             ((,class (:background ,sq-salmon-bg))))
   `(ediff-current-diff-B             ((,class (:background ,sq-green-bg))))
   `(ediff-current-diff-C             ((,class (:background ,sq-blue-bg))))
   `(ediff-fine-diff-A                ((,class (:background ,sq-salmon))))
   `(ediff-fine-diff-B                ((,class (:background ,sq-green))))
   `(ediff-fine-diff-C                ((,class (:background ,sq-blue))))
   `(ediff-odd-diff-A                 ((,class (:background ,sq-salmon-bg))))
   `(ediff-odd-diff-B                 ((,class (:background ,sq-green-bg))))
   `(ediff-even-diff-A                ((,class (:background ,sq-salmon-bg))))
   `(ediff-even-diff-B                ((,class (:background ,sq-green-bg))))

   ;; =====================================================================
   ;; which-key
   ;; =====================================================================
   `(which-key-key-face               ((,class (:foreground ,sq-navy :weight bold))))
   `(which-key-command-description-face ((,class (:foreground ,sq-fg))))
   `(which-key-separator-face         ((,class (:foreground ,sq-teal))))
   `(which-key-group-description-face ((,class (:foreground ,sq-maroon))))

   ;; =====================================================================
   ;; Ivy / Vertico / Selectrum — Squeak list selection style
   ;; =====================================================================
   `(ivy-current-match                ((,class (:background ,sq-selection :foreground ,sq-fg :weight bold))))
   `(ivy-minibuffer-match-face-1      ((,class (:foreground ,sq-navy))))
   `(ivy-minibuffer-match-face-2      ((,class (:foreground ,sq-navy :weight bold))))
   `(ivy-minibuffer-match-face-3      ((,class (:foreground ,sq-purple))))
   `(ivy-minibuffer-match-face-4      ((,class (:foreground ,sq-maroon))))
   `(ivy-confirm-face                 ((,class (:foreground ,sq-teal))))

   ;; Vertico (inherits from basic faces, but just in case)
   `(vertico-current                  ((,class (:background ,sq-selection))))

   ;; =====================================================================
   ;; Window divider — Squeak's gray window borders
   ;; =====================================================================
   `(window-divider                   ((,class (:foreground ,sq-gray-mid))))
   `(window-divider-first-pixel       ((,class (:foreground ,sq-gray-light))))
   `(window-divider-last-pixel        ((,class (:foreground ,sq-gray))))

   ;; =====================================================================
   ;; Orderless
   ;; =====================================================================
   `(orderless-match-face-0           ((,class (:foreground ,sq-navy :weight bold))))
   `(orderless-match-face-1           ((,class (:foreground ,sq-purple :weight bold))))
   `(orderless-match-face-2           ((,class (:foreground ,sq-teal :weight bold))))
   `(orderless-match-face-3           ((,class (:foreground ,sq-maroon :weight bold))))

   ;; =====================================================================
   ;; Treemacs / neotree — Browser pink for navigation
   ;; =====================================================================
   `(treemacs-root-face               ((,class (:foreground ,sq-fg :weight bold :height 1.1
                                                            :background ,sq-pink-bg))))
   `(treemacs-directory-face          ((,class (:foreground ,sq-navy))))
   `(treemacs-file-face               ((,class (:foreground ,sq-fg))))
   `(treemacs-git-modified-face       ((,class (:foreground ,sq-maroon))))
   `(treemacs-git-added-face          ((,class (:foreground ,sq-teal))))
   `(treemacs-git-untracked-face      ((,class (:foreground ,sq-purple))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'squeak)

;;; squeak-theme.el ends here
