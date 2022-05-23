#Builds and runs the project.
#Java
rm -Rf out/*
javac -Xlint:unchecked -cp ${PROJECT_DIR}/.. -d ${OUT_DIR} ${PROJECT_DIR}/*.java
printf "\n\n\nRunning Program...\n\n"
ORIGINAL_LOC=$(pwd)
cd $OUT_DIR
java ${MAIN_CLASS} "$@"
${ORIGINAL_LOC}/${LANGUAGE}/scripts/clean.sh