;;; node.el --- Work with the Node JavaScript interpreter from emacs

;; Copyright (C) 2016 Charles Lowell

;; Author: Charles Lowell <cowboyd@frontside.io>
;; Version: 0.1.0
;; Package-Requires: ()
;; Maintainer: Charles Lowell <cowboyd@frontside.io>
;; Keywords: node nodejs javascript v8

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;; Code:

(require 'compile)


;;;###autoload
(defun node-initialize ()
  "Initialize node tools."

  (add-to-list 'compilation-error-regexp-alist 'node)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(node "at.*(\\(.+?\\):\\([[:digit:]]+\\):\\([[:digit:]]+\\)" 1 2 3)))

;;;###autoload
(node-initialize)

(provide 'node)
;;; node.el ends here
