source utils/define.sh

define PROJECT_NAME "JavaProjectTemplate"
define PROJECT_DIR "src/sig"
define MAIN_CLASS "sig.${PROJECT_NAME}"
define OUT_DIR "bin"
define LIBRARY_PATH "../lib"
define CLASS_PATH "${PROJECT_DIR}/..:lib/bin"
define LANGUAGE ""

define AUTO_UPDATE true

source utils/main.sh