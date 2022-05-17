function search() {
    FILES=$(ls $1)
    for f in $FILES
    do
        if [ -d $1$f ];
        then
            echo "$1$f is a directory"
            search $1$f/
        else 
            echo "$1$f is a file"
            md5sum < $1$f >> $1md5
        fi
    done
}