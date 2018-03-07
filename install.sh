#!/bin/bash -x


neededLines='
(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(load (expand-file-name "portableEmacs/init.el" init-dir))'
initFile="$HOME/.emacs.d/init.el"

if [ ! -f $initFile ]; then
    printf "$neededLines" > $initFile
else
    if [[ $(grep -f  $initFile ./loadLinesForInit.el) = "" ]]; then
	printf "$neededLines" >> $initFile
    fi
fi
