#Adds a commit message and pushes project to github repository.
#

source utils/search.sh

find . -type f -name md5 -delete

#Generate a new hash for every sub-directory, which may require an update.
FILES=$(cat utils/.updateDirectories) 
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
for f in $FILES
do 
    search $f
done
git add -u
git add *
git commit -m "$COMMIT_MESSAGE"
git push