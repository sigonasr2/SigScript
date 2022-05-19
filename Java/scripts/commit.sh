#Adds a commit message and pushes project to github repository.
#Java
COMMIT_MESSAGE="$*"
while IFS= read -r line
do
  COMMIT_MESSAGE+="

Co-authored-by: $line"
done < utils/.coauthors
git add -u
git add *
git commit -m "$COMMIT_MESSAGE"
git push