#!/bin/sh

set -e


echo ${INPUT_LISTIFY}
INPUT_BRANCH=${INPUT_BRANCH:-master}
INPUT_FORCE=${INPUT_FORCE:-false}
REPOSITORY=${INPUT_REPOSITORY:-$GITHUB_REPOSITORY}
AUTO_COMMIT_MSG="listify Auto"
COMMIT_MESSAGE="$(curl -s https://api.github.com/repos/${GITHUB_ACTOR}/${GITHUB_REPOSITORY}/commits/$GITHUB_SHA | jq '.commit.message' | sed 's/\"//g')"

echo "latest commit is : ${COMMIT_MESSAGE}"
echo ${GITHUB_ACTOR}
echo ${GITHUB_REPOSITORY}

if [[ "$COMMIT_MESSAGE" == "$AUTO_COMMIT_MSG" ]] ; then
    echo "listify auto push. Ignore"
    exit 0
fi

[ -z "${INPUT_GITHUB_TOKEN}" ] && {
    echo 'Missing input "github_token: ${{ secrets.GITHUB_TOKEN }}".';
    exit 1;
};

REMOTE_REPO="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${REPOSITORY}.git"

echo $REMOTE_REPO

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

git push "${REMOTE_REPO}" HEAD:${INPUT_BRANCH}
