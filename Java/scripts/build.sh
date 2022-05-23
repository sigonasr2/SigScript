#Builds and runs the project.
#Java
source ${LANGUAGE}/scripts/version_info
rm -Rf out/*
javac -source ${SOURCE_VERSION} -target ${TARGET_VERSION} -Xlint:unchecked -cp ${PROJECT_DIR}/.. -d ${OUT_DIR} ${PROJECT_DIR}/*.java
printf "\n\n\nRunning Program...\n\n"
ORIGINAL_LOC=$(pwd)
cd $OUT_DIR
java ${MAIN_CLASS} "$@"
${ORIGINAL_LOC}/${LANGUAGE}/scripts/clean.sh