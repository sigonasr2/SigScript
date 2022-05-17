function search() {
    FILES2=$(ls $1)
    for g in $FILES2
    do
        if [ -d $1$g ];
        then
            echo "$1$g is a directory"
            search $1$g/
        else 
            echo "$1$g is a file"
            md5sum < $1$g >> $1md5
        fi
    done
}

function check() {
    echo "Check $1"
    FILES2=$(ls $1)
    if [ -f "$1/md5" ];
    then
        echo "   md5 exists"
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