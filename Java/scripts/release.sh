#Use ./sig release <windows|mac|linux> to create a custom installer based on OS.
#Java
source ${LANGUAGE}/scripts/version_info
FILES=$(cat ${LANGUAGE}/scripts/.package.files) 
if [ "$1" = "windows" ];then
    echo "Creating a package for Windows..."
    echo "Not implemented yet."
elif [ "$1" = "mac" ];then
    echo "Creating a package for Mac..."
    echo "Not implemented yet."
elif [ "$1" = "linux" ];then
    echo "Creating a package for Linux..."
    cd ..
    mkdir -vp RabiCloneOut/in
    for f in $FILES
    do 
        cp -Rv --parents $PROJECT_NAME/$f RabiCloneOut/in
    done
    jpackage --verbose --input RabiCloneOut/in/RabiClone --main-jar bin/RabiClone.jar --main-class sig.RabiClone --type app-image --dest RabiCloneOut
    cp -Rv RabiCloneOut/RabiClone/lib/app/* RabiCloneOut/RabiClone
    jpackage --verbose --app-image RabiCloneOut/RabiClone --name RabiClone
    rm -Rfv RabiCloneOut
    cd RabiClone
    echo "Done!"
else
    echo "Usage: "
    echo "  ./sig release <windows|mac|linux>"
fi