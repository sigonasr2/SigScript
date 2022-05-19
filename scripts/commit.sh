#Adds a commit message and pushes project to github repository.
#

source utils/search.sh

find . -type f -name md5 -delete

#Generate a new hash for every sub-directory, which may require an update.
FILES=$(cat utils/.updateDirectories) 
AUTHORS=$(cat utils/.coauthors)
COMMIT_MESSAGE="$*"
for a in $AUTHORS
do
    COMMIT_MESSAGE+="
    Co-authored-by: $a"
done
for f in $FILES
do 
    search $f
done
git add -u
git add *
git commit -m "$COMMIT_MESSAGE"
git push