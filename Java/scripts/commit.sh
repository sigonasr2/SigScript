#Adds a commit message and pushes project to github repository.
#Java
AUTHORS=$(cat utils/.coauthors)
COMMIT_MESSAGE="$*"
while IFS= read -r line
do
  COMMIT_MESSAGE+="
  $line"
done < "$AUTHORS"
git add -u
git add *
git commit -m "$COMMIT_MESSAGE"
git push