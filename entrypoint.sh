#!/bin/sh

set -e


echo ${INPUT_LISTIFY}

COMMIT_MESSAGE="$(curl -s https://api.github.com/repos/ifuture-pro/listify-actions/commits/$GITHUB_SHA | jq '.commit.message')"

if [ "$COMMIT_MESSAGE" -eq "listify Auto" ] ; then
    echo "listify auto push. Ignore" && \
    exit 0
fi && \

listify ./ && \

git config user.name "${GITHUB_ACTOR}" && \
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" && \
if [ -z "$(git status --porcelain)" ]; then
    echo "Nothing to commit" && \
    exit 0
fi && \
git add . && \
git commit -m 'listify Auto' && \
git push && \
