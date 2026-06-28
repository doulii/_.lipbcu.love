#!/bin/bash

set -ev

ARTIFACT_ID=$(curl -L -H "Authorization: Bearer $GITHUB_TOKEN" \
	-H "Accept: application/vnd.github+json" \
	https://api.github.com/repos/doulii/www.lipbcu.love/actions/artifacts |jq .artifacts[0].id)

curl -L -H "Authorization: Bearer $GITHUB_TOKEN" \
	-H "Accept: application/vnd.github+json" \
	-o artifact.zip \
	"https://api.github.com/repos/doulii/www.lipbcu.love/actions/artifacts/$ARTIFACT_ID/zip"

unzip -o artifact.zip -d www

rm artifact.zip

