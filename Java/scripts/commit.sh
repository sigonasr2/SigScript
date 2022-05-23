#Adds a commit message and pushes project to github repository.
#Java
COMMIT_MESSAGE="$*"
while IFS= read -r line
do
if [ "$FIRST_LINE" = true ]; then
  COMMIT_MESSAGE+="

Co-authored-by: $line"
else
  COMMIT_MESSAGE+="
Co-authored-by: $line"
fi
done < utils/.coauthors
git add -u
git add *
git commit -m "$COMMIT_MESSAGE"
git push