VERBOSE=false
DRY=false
while getopts n:v: option; do
  case "$option" in
    n)
      DRY=true;;
    v)
      VERBOSE=true;;
    *)
      echo "Unknown option $arg."
  esac
done
