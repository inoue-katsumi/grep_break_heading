grephb() {
    from=1
    command grep $* | tee /tmp/__$$__.grep |
    cut -d ':' -f1 | uniq -c |
    while read lines filename
    do
	#echo -e "\n= = = = = = = =\n$filename"
        #  33 == yellow. 32 == green. 34 == dark blue
        echo -e "\\e[33m$filename\\e[0m"
        sed -n "$from,$((from+lines-1))s/^[^:]*://p" /tmp/__$$__.grep
        echo
        from=$((from+lines))
    done
}
# It is possible to copy the function above in .bash_profile.
# In that case, line below can be commented out.
grephb $*
