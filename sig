source utils/define.sh

define PROJECT_NAME "JavaProjectTemplate"
define PROJECT_DIR "src/sig"
define MAIN_CLASS "sig.${PROJECT_NAME}"
define OUT_DIR "bin"

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
    FILES=$(ls -1 ./scripts | sed -e 's/\.sh$//' | sed -e 's/^/    /')
    for f in $FILES
    do
      DESC="$(head -n1 ./scripts/$f.sh)"
      printf "\n\t%-15s%-65s" $f "${DESC:1}"
    done
    echo ""
    exit
fi

./scripts/$1.sh "${*:2}"