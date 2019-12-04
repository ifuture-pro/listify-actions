#!/bin/sh

set -e


echo ${INPUT_LISTIFY}
AUTO_COMMIT_MSG="listify Auto"
COMMIT_MESSAGE="$(curl -s https://api.github.com/repos/ifuture-pro/listify-actions/commits/$GITHUB_SHA | jq '.commit.message' | sed 's/\"//g')"

echo "latest commit is : ${COMMIT_MESSAGE}"

if [[ "$COMMIT_MESSAGE" == "$AUTO_COMMIT_MSG" ]] ; then
    echo "listify auto push. Ignore"
    exit 0
fi

listify ./

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
if [ -z "$(git status --porcelain)" ]; then
    echo "Nothing to commit"
    exit 0
fi
git config --list
git add .
git commit -m "${AUTO_COMMIT_MSG}"
git push
