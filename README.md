# lisp-miniweb
### Running the prebuilt Mac OS X binary
In the top-level directory of this repo, on Mac OS X\*: `./mini-web` Then at the "?" Lisp prompt either `(mini-web 8080)` or some other port or just `go` if you are OK with port 8080.
> \* This is a Mac OS X project, but should port easily to other platforms. The ease with which you will be able to build a standalone application will vary. Note that even the included binary just brings up a Lisp session. I built a truly standalone version that started the web server, but then it exited to the OS immediately. WIP.

### Prerequisites for development
 * The Emacs set-up of your choice. I happen to be using Spacemacs.
 * SLIME, to run/test Lisp under Emacs. This is CL's CIDER. I think I installed from within Emacs: `M-x package-install RET slime RET`
 * A Common Lisp environment. Many use SBCL, I happen to be using ClozureCL. Allegro CL is commercial but the best, and there are also LispWorks, Armed Bear CL (a Java-based CL), CLisp and ECL (translates to C for compilation, IIUC). Maybe more.
 * Once your Lisp is in place, install QuickLisp, your future source for O/S libraries: https://www.quicklisp.org/beta/
 
 And now some relevant lines from `.emacs.d/init.el`:
 ```elisp
 (load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "~/ccl/dx86cl64")
(setq slime-contribs '(slime-fancy))

(add-hook 'slime-mode-hook
          (lambda ()
            (unless (slime-connected-p)
              (save-excursion (slime)))))
```
Be aware that the above starts a Lisp as soon as you edit a `.lisp` or `.cl` file. Speaking of which, yes, it takes just a second or two to start a Lisp, so do not be alarmed if you are accustomed to Clojure. If you do not like the autostart, starting manually just takes `M-x slime`.

> Pro tip: And since Lisp (sessions) never forget and sometimes we need that, to restart Lisp from within Emacs, in the `*slime-repl* at the prompt type a comma and then, when prompted, `restart-inferior-lisp`.
