# lisp-miniweb
[If you have any problems with the following let me know and I will fix it.]

The mission was to create something in Common Lisp that would (a) run standalone, (b) respond to an http GET with a bit of text, and (c) set a response header slot or two, for the purposes of a language comparison/benchmark.
### Running the prebuilt Mac OS X binary
In the top-level directory of this repo, on Mac OS X\*: `./mini-web` Then at the "?" Lisp prompt either `(mini-web 8080)` or some other port or just `go` if you are OK with port 8080.
> \* This is a Mac OS X project, but should port easily to other platforms. The ease with which you will be able to build a standalone application will vary. Note that even the included binary just brings up a Lisp session. I built a truly standalone version that started the web server, but then it exited to the OS immediately. WIP.

### Prerequisites for development
 * The Emacs set-up of your choice. I happen to be using Spacemacs.
 * SLIME, to run/test Lisp under Emacs. This is CL's CIDER. I think I installed from within Emacs: `M-x package-install RET slime RET`
 * A Common Lisp environment. Many use SBCL, I happen to be using ClozureCL because it comes with multi-processing off the shelf (unlike SBCL). Allegro CL is commercial but the best, and there are also LispWorks, Armed Bear CL (a Java-based CL), CLisp and ECL (translates to C for compilation, IIUC). Maybe more.
 * Once your Lisp is in place, install QuickLisp, your future source for O/S libraries: https://www.quicklisp.org/beta/
 
 
 And now some relevant lines from `.emacs.d/init.el` (the line setting the location of your chosen Lisp binary will have to be adjusted):
 ```elisp
 (load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "~/ccl/dx86cl64")
(setq slime-contribs '(slime-fancy))

(add-hook 'slime-mode-hook
          (lambda ()
            (unless (slime-connected-p)
              (save-excursion (slime)))))
```
Be aware that the last bit arranges for a Lisp session to start under Emacs as soon as you edit a `.lisp` or `.cl` file. Speaking of which, yes, it takes just a second or two to start a Lisp, so do not be alarmed if you are accustomed to Clojure. If you do not like the autostart, starting manually just takes `M-x slime`.

> Pro tip: And since Lisp (sessions) never forget and sometimes we need that, to restart Lisp from within Emacs, in the `*slime-repl* at the prompt type a comma and then, when prompted, `restart-inferior-lisp`.

### The Beef
Open `mini-web.lisp` and follow the directions there, which are a bit clumsy for this one-off exercise: the quicklisp command to load Hunchentoot is commented out and must be evaluated separately before compiling the whole file. That is so the built binary does not try (and generally fail) to execute quicklisp commands. Note that if you do end up restarting the Emacs Lisp session you will have to work thru the instructions to load Hunchentoot et al again. A longer term solution would be a quick bit of code to build the system and optionally save a new application. Left as an exercise.
