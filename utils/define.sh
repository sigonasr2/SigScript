export VARS=("")

function define() {
  VARS+=("$1")
  value="${*:2}"
  eval "$1"='$value'
}

if [[ $(pwd) == *"SigScript" ]]; then
  source utils/search.sh

  #Check for hashes
  FILES=$(ls -d */)
  for f in $FILES
  do 
      search $f
      check $f
  done
else
  echo "Dev build, no checks required."
fi