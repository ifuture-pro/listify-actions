FROM node:10-alpine

LABEL "maintainer"="ifuture-pro <business@ifuture.pro>"
LABEL "repository"="http://github.com/ifuture-pro/listify-actions"
LABEL "homepage"="http://github.com/ifuture-pro/listify-actions"

LABEL "com.github.actions.name"="Listify Auto"
LABEL "com.github.actions.description"="Generate and merge all directories to the specified file.List of contents"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

RUN npm install @ifuture/listify -g

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
