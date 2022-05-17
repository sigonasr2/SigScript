#Adds a commit message and pushes project to github repository.
#

source utils/search.sh

find . -type f -name md5 -delete

#Generate a new hash for every sub-directory, which may require an update.
FILES=$(ls -d */)
for f in $FILES
do 
    search $f
done
FILES=$(ls -p | grep -v /)
for f in $FILES
do 
    md5sum < $1$g >> $1md5
done
git add -u
git add *
git commit -m "$*"
git push