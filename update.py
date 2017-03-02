#File list
import pexpect, re
from sys import argv

emacs_d = '~/.emacs.d/'
excludeFiles = set(['README.org', 'update.py'])
files = pexpect.run('ls').split()
cmd = None
if len(argv) == 1 or argv[1] == "populate":
    cmd = lambda f: 'cp ' + f + ' ' + emacs_d + f
else:
    cmd = lambda f: 'cp ' + emacs_d + f + ' ' + f



for f in files:
    if f in excludeFiles: continue
    if re.match(r'.*~',f): continue
    print(cmd(f))
    res = pexpect.run('/bin/bash -c "%s"'%cmd(f))
    if len(res): print(res)
