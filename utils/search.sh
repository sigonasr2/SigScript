function search() {
    FILES2=$(ls -A $1 2>/dev/null)
    for g in $FILES2
    do
        if [ -d $1$g ];
        then
            echo "$1$g is a directory"
            search $1$g/
        else 
            echo "$1$g is a file"
            if [ $g != "md5" ] && [ $g != "filelist" ] && [ $g != ".package.files" ]; then
                if [ $g != ".coauthors" ] && [ $g != "version_info" ]; then
                    SUM=$(md5sum < $1$g)
                    echo "$g:$SUM" >> $1md5
                fi
                echo "$g" >> $1filelist
            else
                echo "  ignoring $g..."
            fi
        fi
    done
}

function check() {
    echo "Check $1"
    FILES2=$(ls -A $1 2>/dev/null)
    if [ -f "$1/md5" ];
    then
        echo "   md5: https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1md5"
        curl -H 'Cache-Control: no-cache, no-store' -s "https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1md5" --output /tmp/out
        cmp -s $1/md5 /tmp/out
        if [ "$?" -ne 0 ] 
        then
            echo " Differences detected!"
            cat /tmp/out 
            while IFS= read -r line
            do
                IFS=':' read -ra split <<< $line
                g="${split[0]}"
                echo "LINE -- $g" 
                if [ "$g" != "md5" ] && [ "$g" != "filelist" ] && [ "$g" != ".package.files" ]; then
                    if [ -f $1$g ];
                    then
                        if [ "$g" != ".coauthors" ] && [ "$g" != "version_info" ]; then
                            echo "++Redownload $1$g..."
                            if [ -f "$1$g" ]; then
                                curl -H 'Cache-Control: no-cache, no-store' "https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1$g" --output $1$g
                            else
                                echo "===Could not find directory, assuming regular scripts directory exists."
                                curl -H 'Cache-Control: no-cache, no-store' "https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1$g" --output $LANGUAGE/scripts/$g
                            fi
                        fi
                    else 
                        echo "++==Downloading $1$g..."
                        curl -H 'Cache-Control: no-cache, no-store' "https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1$g" --output $1$g
                    fi
                fi
            done < /tmp/out
        fi
    fi
    if [ -f "$1/filelist" ];
    then
        echo "   filelist: https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1filelist"
        curl -H 'Cache-Control: no-cache, no-store' -s "https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1filelist" --output /tmp/out
        cmp -s $1/filelist /tmp/out
        if [ "$?" -ne 0 ] 
        then
            echo " Differences detected!"
            cat /tmp/out 
            while IFS= read -r line
            do
                IFS=':' read -ra split <<< $line
                g="${split[0]}"
                echo "LINE -- $g" 
                if [ "$g" != "md5" ] && [ "$g" != "filelist" ] && [ "$g" != ".package.files" ]; then
                    if [ -f $1$g ];
                    then
                        if [ "$g" != ".coauthors" ] && [ "$g" != "version_info" ]; then
                            echo "++Redownload $1$g..."
                            if [ -f "$1$g" ]; then
                                curl -H 'Cache-Control: no-cache, no-store' "https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1$g" --output $1$g
                            else
                                echo "===Could not find directory, assuming regular scripts directory exists."
                                curl -H 'Cache-Control: no-cache, no-store' "https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1$g" --output $LANGUAGE/scripts/$g
                            fi
                        fi
                    else 
                        echo "++==Downloading $1$g..."
                        curl -H 'Cache-Control: no-cache, no-store' "https://raw.githubusercontent.com/sigonasr2/SigScript/main/$1$g" --output $1$g
                    fi
                fi
            done < /tmp/out
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
