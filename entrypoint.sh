#!/bin/sh

set -e


INPUT_BRANCH=${INPUT_BRANCH:-master}
INPUT_FORCE=${INPUT_FORCE:-false}
INPUT_DIRECTORY=${INPUT_DIRECTORY:-'.'}
REPOSITORY=${INPUT_REPOSITORY:-$GITHUB_REPOSITORY}
AUTO_COMMIT_MSG=${INPUT_COMMIT_MSG:-"listify Actions automatic https://github.com/ifuture-pro/listify-actions"}
COMMIT_MESSAGE="$(curl -s https://api.github.com/repos/${REPOSITORY}/commits/$GITHUB_SHA | jq '.commit.message' | sed 's/\"//g')"
LISTIFY_CMD="listify ${INPUT_LISTIFY:-./}"

echo "listify command : ${LISTIFY_CMD}"

echo "latest commit : ${COMMIT_MESSAGE}"

if [[ "$COMMIT_MESSAGE" == "$AUTO_COMMIT_MSG" ]] ; then
    echo "listify auto push. Ignore"
    exit 0
fi

[ -z "${INPUT_GITHUB_TOKEN}" ] && {
    echo 'Missing input "github_token: ${{ secrets.GITHUB_TOKEN }}".';
    exit 1;
};

REMOTE_REPO="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${REPOSITORY}.git"

APPEND=$(${LISTIFY_CMD})

cd ${INPUT_DIRECTORY}

pwd

echo "INPUT_DIRECTORY : ${INPUT_DIRECTORY}"

echo "APPEND : ${APPEND}"


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
