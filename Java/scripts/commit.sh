#Adds a commit message and pushes project to github repository.
#Java
AUTHORS=$(cat utils/.coauthors)
COMMIT_MESSAGE="$*"
for a in $AUTHORS
do
    COMMIT_MESSAGE+="
    Co-authored-by: $a"
done
git add -u
git add *
git commit -m "$COMMIT_MESSAGE"
git push