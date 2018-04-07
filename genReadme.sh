#!/bin/bash
dir=$(dirname $0)


initText=$(cat "$dir/init.el")p
# relying on storing in variable to invalidate new lines...
bootOrder=$(echo $initText |
		sed 's/^.*(setq  *portable-emacs-load-order[^(]*(\([^)]*\)).*$/\1/g' |
		sed 's/"//g')
fout="$dir/README.org"

cat $dir/src/readme.org > $fout

function is_start { echo $1 | grep -e '^;;; Code:.*$'; }
function is_end {  echo $1 | grep -e '^(provide'; }
function is_empty { if [[ $1 == '' ]]; then echo 1; fi; }

function is_title { echo $1 | grep -e '^;; [^;]*;;;*$'; }
function get_title { echo $1 | sed 's/^;*\([^;]*\);*$/\1/'; }

function append {
    echo "$@" >> $fout
}

function elipseToOrg {
    inCode=""
    inBlock=""

    blockOpen='#+BEGIN_SRC emacs-lisp'
    blockClose='#+END_SRC'

    wasEmpty=1
    i=1
    IFS=''

    append
    append "* $1"
    append



    cat "$1" | while read line; do
	if [[ $(is_end "$line") ]]; then
	    if [[ inBlock ]]; then append "$blockClose"; fi
	    return;
	fi

	if [[ $inCode ]]; then

	    if [[ ! $(is_empty "$line") ]]; then
		if [[ $(is_title $line) ]]; then
		    if [[ $inBlock ]]; then
			append $blockClose
			inBlock=''
		    fi
		    append
		    append "**$(get_title "$line")"
		    append
		else
		    if [[ ! $inBlock ]]; then
			append "$blockOpen"
			inBlock=1
			append "$line"
		    else
			if [[ $wasEmpty ]]; then append; fi
			append "$line"
		    fi


		fi
	    fi
	    wasEmpty=$(is_empty "$line")
	fi
	if [[ $inCode || $(is_start "$line") ]]; then inCode=1; fi


	i=$(( $i + 1 ))
    done
}

function append_keybindings {
    cat $1 |
	grep -e '"[CM]-[^"]*" *\. *[^)]*)' |
	grep -o '("[CM][^"]*"[^)]*)' |
	sed 's/("\([^"]*\)" *\. *\([^)]*\))/- ~\1~   \2/g' >> $fout

    cat $1 |
	grep -e '(kbd "[CM][^)]*) [^)]*)' |
	grep -o '(kbd "\([CM][^"]*\)" *)[^)]*)' |
	sed "s/(kbd \"\([^)]*\)\" *) *'\([^)]*\))/- ~\1~   \2/g" >> $fout
}



echo "generating key-bindings.."

append
append '* Added keybindings'
append
for filename in $bootOrder; do
    echo $filename
    append_keybindings $filename
done

echo
echo "finishing readme..."

for filename in $bootOrder; do
    echo $filename
    elipseToOrg $filename
done
