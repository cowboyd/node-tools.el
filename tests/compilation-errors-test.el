(require 'compile)
(require 'shut-up)


(describe "running a node process that explodes with an exception"
  :var (js-buffer)

  (before-each
    ;; kill any open buffers to make sure we start with a clean test
    (dolist (buffer (buffer-list) (kill-buffer buffer)))

    ;; when navigating to next error with no regexp it tries to prompt you
    ;; for the file to open. fake this call and throw an exception because it
    ;; means our error parsing failed.
    (spy-on 'read-file-name :and-call-fake
            (lambda (&rest args)
              (error "shouldn't try to prompt for file name")))

    ;; run the compilation
    (let ((default-directory dummy-node-project-dir))
      (shut-up
       (compile "node dummy-node-project/explode.js")
       (sleep-for 0.1)))

    ;; navigate to the next error and capture the js buffer;
    (next-error)
    (setq js-buffer (get-buffer "explode.js")))

  (it "opens the javascript buffer"
    (expect js-buffer :not :to-be nil))

  (describe "the javascript buffer itself"
    :var (current-line-string)
    (before-each
      (switch-to-buffer js-buffer)
      (setq current-line-string
            (buffer-substring (line-beginning-position) (line-end-position))))

    (it "has its point at the place where the exception occured"
      (expect current-line-string :to-equal "  throw new Error('boom!');"))))
