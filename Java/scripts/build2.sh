#Builds and runs the project for Windows.
#Java
source ${LANGUAGE}/scripts/version_info
javac -source ${SOURCE_VERSION} -target ${TARGET_VERSION} -Xlint:unchecked -cp ${CLASS_PATH_WINDOWS} -d ${OUT_DIR} ${PROJECT_DIR}/*.java
printf "\n\n\nRunning Program...\n\n"
ORIGINAL_LOC=$(pwd)
cd $OUT_DIR
if java ${CUSTOM_PARAMS} -cp ".;../lib/bin/" -XX:+UseZGC "-Djava.library.path=${LIBRARY_PATH}" ${MAIN_CLASS} "$@"; then
    ${ORIGINAL_LOC}/${LANGUAGE}/scripts/clean.sh
    exit
fi
if java ${CUSTOM_PARAMS} -cp ".;../lib/bin/" -XX:+UnlockExperimentalVMOptions -XX:+UseZGC "-Djava.library.path=${LIBRARY_PATH}" ${MAIN_CLASS} "$@"; then
    ${ORIGINAL_LOC}/${LANGUAGE}/scripts/clean.sh
    exit
fi
java ${CUSTOM_PARAMS} -cp ".;../lib/bin/" -XX:+PrintCommandLineFlags "-Djava.library.path=${LIBRARY_PATH}" ${MAIN_CLASS} "$@"
${ORIGINAL_LOC}/${LANGUAGE}/scripts/clean.sh