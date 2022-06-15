#Use ./sig release <windows|mac|linux> to create a custom installer based on OS.
#Java
source ${LANGUAGE}/scripts/version_info
if [ "$1" = "windows" ];then
    echo "Creating a package for Windows..."
    echo "Not implemented yet."
elif [ "$1" = "mac" ];then
    echo "Creating a package for Mac..."
    echo "Not implemented yet."
elif [ "$1" = "linux" ];then
    echo "Creating a package for Linux..."
    cd ..
    jpackage --input RabiClone --main-jar bin/RabiClone.jar --main-class sig.RabiClone --type app-image --dest RabiCloneOut
    cp -R RabiCloneOut/RabiClone/lib/app/* RabiCloneOut/RabiClone
    jpackage --app-image RabiCloneOut/RabiClone --name RabiClone
    rm -Rf RabiCloneOut
    cd RabiClone
    echo "Done!"
else
    echo "Usage: "
    echo "  ./sig release <windows|mac|linux>"
fi