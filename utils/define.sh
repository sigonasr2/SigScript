export VARS=("")

function define() {
  VARS+=("$1")
  value="${*:2}"
  eval "$1"='$value'
}