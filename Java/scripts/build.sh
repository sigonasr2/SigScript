#Builds and runs the project.
#Java
source ${LANGUAGE}/scripts/version_info
javac -source ${SOURCE_VERSION} -target ${TARGET_VERSION} -Xlint:unchecked -cp ${CLASS_PATH} -d ${OUT_DIR} ${PROJECT_DIR}/*.java
printf "\n\n\nRunning Program...\n\n"
ORIGINAL_LOC=$(pwd)
cd $OUT_DIR
java ${CUSTOM_PARAMS} -cp .:../lib/bin -Djava.library.path="${LIBRARY_PATH}" ${MAIN_CLASS} "$@"
${ORIGINAL_LOC}/${LANGUAGE}/scripts/clean.sh