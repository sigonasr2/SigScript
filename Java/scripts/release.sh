#Creates a zip file containing all project contents.
#Java
source ${LANGUAGE}/scripts/version_info
TARGET_FILE="${PROJECT_NAME}_${RELEASE_VERSION}.zip"
FILES=$(cat ${LANGUAGE}/scripts/.package.files) 
echo "Creating Package $TARGET_FILE..."
for f in $FILES
do 
    zip -ur $TARGET_FILE $f
done
echo "Complete!"
echo ""
echo ""
echo ""