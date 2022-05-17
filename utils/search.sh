function search() {
    FILES2=$(ls -A $1)
    for g in $FILES2
    do
        if [ -d $1$g ];
        then
            echo "$1$g is a directory"
            search $1$g/
        else 
            echo "$1$g is a file"
            if [ $g != "md5" ]; then
                md5sum < $1$g >> $1md5
            else
                echo "  md5 file, ignoring..."
            fi
        fi
    done
}

function check() {
    echo "Check $1"
    FILES2=$(ls -A $1)
    if [ -f "$1/md5" ];
    then
        echo "   md5: https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1md5"
        curl -H 'Cache-Control: no-cache, no-store' -s https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1md5 --output /tmp/out
        DIFF=$(diff $1/md5 /tmp/out) 
        if [ "$DIFF" != "" ] 
        then
            echo " Differences detected!"
            for g in $FILES2
            do
                if [ "$g" != "md5" ]; then
                    if [ -f $1$g ];
                    then
                        echo "++Redownload $1$g..."
                        if [ -f "$1$g" ]; then
                            #Read the 2nd line and see if it has a special directory.
                            CHECKLINE=$(sed -n '2{p;q;}' $1$g)
                            if [ "${CHECKLINE:0:1}" = "#" ]; then
                                #This could be a different diff, try that one.
                                echo "   md5: https://raw.githubusercontent.com/sigonasr2/SigScript/main/${CHECKLINE:1}/$1md5"
                                curl -H 'Cache-Control: no-cache, no-store' -s https://raw.githubusercontent.com/sigonasr2/SigScript/main/${CHECKLINE:1}/$1md5 --output /tmp/out
                                DIFF=$(diff $1/md5 /tmp/out) 
                                if [ "$DIFF" != "" ] 
                                then
                                    echo " Differences detected here too."
                                    curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/sigonasr2/SigScript/main/${CHECKLINE:1}/$1$g --output $1$g
                                fi
                            else
                                curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1$g --output $1$g
                            fi
                        else
                            echo "===Could not find directory, assuming regular scripts directory exists."
                            curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1$g --output scripts/$g
                        fi
                    fi
                fi
            done
        fi
    fi
    for g in $FILES2
    do
        if [ -d $1$g ];
        then
            echo "$1$g is a directory"
            check $1$g/
        fi
    done
}