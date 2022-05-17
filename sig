export PROJECT_NAME="JavaProjectTemplate"
export PROJECT_DIR="src/sig"
export MAIN_CLASS="sig.${PROJECT_NAME}"
export OUT_DIR="bin"


if [ -z "$1" ]
  then
    echo ""
    echo "  Usage: ./sig <command> {args}"
    echo ""
    printf "====\tCurrent Configuration"
    printf "\t====================="
    printf "\n\t%-15s%20s" PROJECT_NAME ${PROJECT_NAME}
    printf "\n\t%-15s%20s" PROJECT_DIR ${PROJECT_DIR}
    printf "\n\t%-15s%20s" MAIN_CLASS ${MAIN_CLASS}
    printf "\n\t%-15s%20s" OUT_DIR ${OUT_DIR}
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