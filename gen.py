#File list
import pexpect, re
from sys import argv

emacs_d = '~/.emacs.d/'
files = ['loader.org', 'init.el']
cmd = None

if len(argv) == 1 or argv[1] == "emacs.d":
    cmd = lambda f: 'cp ' + f + ' ' + emacs_d + f
elif argv[1] == "github":
    cmd = lambda f: 'cp ' + emacs_d + f + ' ' + f
else:
    print(argv[1] + " is not defined.")
    return


for f in files:
    print(cmd(f))
    res = pexpect.run('/bin/bash -c "%s"'%cmd(f))
    if len(res): print(res)
