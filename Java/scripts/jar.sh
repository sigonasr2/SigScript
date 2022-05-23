#Builds a runnable jar file using ${MAIN_CLASS} as an entry point and then runs the newly generated jar.
#Java
rm -Rf bin/*
javac -Xlint:unchecked -cp src -d bin ${PROJECT_DIR}/${PROJECT_NAME}.java
printf "\n\n\nGenerating Manifest...\n\n"
touch manifest
echo "Main-Class: ${MAIN_CLASS}" >> manifest
printf "\n\n\nCreating Jar...\n\n"
ORIGINAL_LOC=$(pwd)
cd ${OUT_DIR}
jar cfm ${PROJECT_NAME}.jar ${ORIGINAL_LOC}/manifest sig
printf "\n\n\nRunning Program...\n\n"
java -jar ${PROJECT_NAME}.jar "$@"
cd ..
./${LANGUAGE}/scripts/clean.sh
