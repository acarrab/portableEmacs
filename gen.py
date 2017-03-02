#File list
import pexpect, re
from sys import argv

emacs_d = '~/.emacs.d/'
excludeFiles = set(['README.org', 'gen.py', 'Makefile'])
files = pexpect.run('ls').split()
cmd = None
if len(argv) == 1 or argv[1] == "emacs.d":
    cmd = lambda f: 'cp ' + f + ' ' + emacs_d + f
elif argv[1] == "github":
    cmd = lambda f: 'cp ' + emacs_d + f + ' ' + f



for f in files:
    if f in excludeFiles: continue
    if re.match(r'.*~',f): continue
    print(cmd(f))
    res = pexpect.run('/bin/bash -c "%s"'%cmd(f))
    if len(res): print(res)
