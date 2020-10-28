;; prog-man.el --- Programming Language Manual File  -*- lexical-binding: t; -*-

;; Copyright (c) 2020 Marc-Antoine Loignon

;; Author: Marc-Antoine Loignon <developer@lognoz.org>
;; Homepage: https://github.com/lognoz/lang-man
;; Keywords: programming language manual
;; Package-Version: 0.1
;; Package-Requires: ((emacs "24.5"))

;; This file is not part of GNU Emacs.

;;; License: GNU General Public License v3.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

;;;###autoload
(defun prog-man ()
  "Launch manual by `major-mode'."
  (interactive)
  (if (derived-mode-p 'emacs-lisp-mode)
      (find-function-read)
    (let* ((mode (symbol-name major-mode))
           (manual (intern (concat "prog-man-" mode))))
      (if (fboundp manual)
          (funcall-interactively manual)
        (message "No manual found for '%s'" mode)))))

(provide 'prog-man)

;;; prog-man.el ends here
