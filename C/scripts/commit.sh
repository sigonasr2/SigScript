#Adds a commit message and pushes project to github repository.
#C
COMMIT_MESSAGE="$*"
FIRST_LINE=true
while IFS= read -r line
do
if [ "$FIRST_LINE" = true ]; then
  COMMIT_MESSAGE+="

Co-authored-by: $line"
FIRST_LINE=false
else
  COMMIT_MESSAGE+="
Co-authored-by: $line"
fi
done < utils/.coauthors
git add -u
git add *
git commit -m "$COMMIT_MESSAGE"
git push