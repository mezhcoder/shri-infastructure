# !/bin/bash

RELEASE_TAG=$(git describe --tags HEAD)
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
        "description": "Hello world! zhcoder",
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
