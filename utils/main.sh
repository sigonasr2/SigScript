if [ -z "$1" ]
  then
    echo ""
    echo "  Usage: ./sig <command> {args}"
    echo ""
    printf "====\tCurrent Configuration"
    printf "\t====================="
    for t in ${VARS[@]}
    do
      printf "\n\t%-15s%20s" $t ${!t}
    done
    printf "\n====================================================="
    echo ""
    echo ""
    echo "  Command List:"
    FILES=$(ls -1A ./$LANGUAGE/scripts 2>/dev/null | sed -e 's/\.sh$//' | sed -e 's/^/    /')
    for f in $FILES
    do
      if [ -f "./$LANGUAGE/scripts/$f.sh" ]; then
        DESC="$(head -n1 ./$LANGUAGE/scripts/$f.sh)"
        printf "\n\t%-15s%-65s" $f "${DESC:1}"
      fi
    done
    echo ""
    exit
fi

./$LANGUAGE/scripts/$1.sh "${@:2}"