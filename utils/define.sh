export VARS=("")

export LANGUAGE=""

function define() {
  VARS+=("$1")
  value="${*:2}"
  eval export "$1"='$value'
}

if [[ $(pwd) != *"SigScript" ]]; then
  source utils/search.sh

  find . -type f -name md5 -delete

  #Check for hashes
  FILES=$(cat utils/.updateDirectories)
  for f in $FILES
  do 
      search $f
      check $f
  done
else
  echo "Dev build, no checks required."
fi