# !/bin/bash

RELEASE_TAG=$(git describe --tags HEAD)
EARLY_RELEASE=$(git tag -l | sort -r | tail -1 | head -n2)
LAST_RELEASE=$(git tag -l | sort -r | head -n1)

AUTHOR=$(git log --pretty=format:"%aN" | head -n1)
CHANGELOG=$(git log ${EARLY_RELEASE}..${LAST_RELEASE} --pretty=format:"%h - %s (%an, %ar)")

RESPONSE=$(
curl -s -X POST https://api.tracker.yandex.net/v2/issues \
--write-out '%{http_code}' \
--output errorBashLogs.txt \
-H "Content-Type: application/json" \
-H "Authorization: OAuth ${OAUTH}" \
-H "X-Org-Id: ${XORGID}" \
-d '{
        "queue":"TMP",
        "summary": "'"${RELEASE_TAG}"'",
        "type": "task",
        "description": "AUTHOR: '${AUTHOR}'\n CHANGELOG: '${CHANGELOG}'",
        "unique": "https://github.com/mezhcoder/shri-infastructure/releases/tag/'${RELEASE_TAG}'"
    }'
)

if [ ${RESPONSE} = 201 ]; then
  echo "Ticket created."
elif [ ${RESPONSE} = 409 ]; then
  echo "Ticket already created."
else
  echo "Error: ${RESPONSE}"
fi
