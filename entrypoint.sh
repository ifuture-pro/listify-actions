#!/bin/sh

#set -e


echo ${INPUT_LISTIFY}

listify ./ && \

curl https://api.github.com/repos/ifuture-pro/listify-actions/commits/$GITHUB_SHA

git config user.name "${GITHUB_ACTOR}" && \
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" && \
if [ -z "$(git status --porcelain)" ]; then
    echo "Nothing to commit" && \
    exit 0
fi && \
git add . && \
git commit -m 'Listify Auto' && \
git push && \
