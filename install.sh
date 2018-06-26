#!/bin/bash -x

init="$HOME/.emacs.d/init.el"
line='(load "'$(dirname $(realpath $0))'/init.el")'

if [[ ! -f $init ]]; then touch $init; fi

if [[ "$(grep "$line" <$init)" = ""  ]]; then echo "$line" >> $init; fi
