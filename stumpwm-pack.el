;;; stumpwm-pack.el --- Stumpwm

;;; Commentary:

;;; Code:

(require 'install-packages-pack)
(install-packages-pack/install-packs '(stumpwm-mode
                                       smartscan))

(require 'stumpwm-mode)
(add-to-list 'auto-mode-alist '("\\.stumpwmrc$" . stumpwm-mode))

(require 'smartscan)
(require 'rainbow-delimiters)

(defun stumpwm-pack/find-user-init-file! ()
  "Find the default user's stumpwmrc file."
  (interactive)
  (find-file-other-window "~/.stumpwmrc"))

(global-set-key (kbd "C-c C-w") 'stumpwm-pack/find-user-init-file!)

(setq stumpwm-mode-hook)
(add-hook 'stumpwm-mode-hook
          (lambda ()
            (setq major-mode 'lisp-mode)
            (lisp-mode-variables t t)
            (paredit-mode 1)
            (rainbow-delimiters-mode 1)
            (eldoc-mode 1)
            (smartscan-mode)
            (define-key stumpwm-mode-map (kbd "C-c m r") 'stumpwm-eval-region)
            (define-key stumpwm-mode-map (kbd "C-c m b") 'stumpwm-pack/eval-buffer)))

(defun stumpwm-pack/eval-buffer ()
  "Eval the current buffer."
  (interactive)
  (stumpwm-eval-region (point-min) (point-max)))

(provide 'stumpwm-pack)
;;; stumpwm-pack.el ends here
