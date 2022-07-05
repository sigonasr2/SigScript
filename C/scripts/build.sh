#Compiles the entire program then runs it, producing an executable.
#C
printf "Running program...\n\n\n"
if gcc $(find . -type f -name "*.c") ${CUSTOM_PARAMS} -o ${PROJECT_NAME}; then
    ./${PROJECT_NAME} "$@"
fi
printf "\n\n"
