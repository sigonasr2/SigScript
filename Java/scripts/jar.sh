#Builds a runnable jar file using ${MAIN_CLASS} as an entry point and then runs the newly generated jar.
#Java
source ${LANGUAGE}/scripts/version_info
rm -Rf bin/*
javac -source ${SOURCE_VERSION} -target ${TARGET_VERSION} -Xlint:unchecked -cp ${CLASS_PATH} -d ${OUT_DIR} ${PROJECT_DIR}/${PROJECT_NAME}.java
printf "\n\n\nGenerating Manifest...\n\n"
touch manifest
echo "Main-Class: ${MAIN_CLASS}" >> manifest
printf "\n\n\nCreating Jar...\n\n"
ORIGINAL_LOC=$(pwd)
cd ${OUT_DIR}
jar cfm ${PROJECT_NAME}.jar ${ORIGINAL_LOC}/manifest sig
jar uf ${PROJECT_NAME}.jar -C ../lib/bin/ .
printf "\n\n\nRunning Program...\n\n"
java -cp .:../lib/bin -Djava.library.path="${LIBRARY_PATH}" -jar ${PROJECT_NAME}.jar "$@"
../${LANGUAGE}/scripts/clean.sh
cd ..
