# !/bin/bash

#2>&1 - перевод потока 2 в 1
# tr -s - замена \n на " " для приятного восприятия + обход ограничения лимита
OUTPUT_JEST=$(npm run test 2>&1 | tr -s "\n" " ")

RELEASE_TAG=$(git describe --tags HEAD)
UNIQUE="https://github.com/mezhcoder/shri-infastructure/releases/tag/${RELEASE_TAG}"
echo "Get unique: '${UNIQUE}'"
TASK_ID=$(
    curl -s -X POST "https://api.tracker.yandex.net/v2/issues/_search" \
    -H "Authorization: OAuth ${OAUTH}" \
    -H "X-Org-Id: ${XORGID}" \
    -H "Content-Type: application/json" \
    -d '{
    "filter": {
         "unique":"'${UNIQUE}'"
      }
    }' | jq -r '.[].key'
    )
echo ${TASK_ID}

#Send comment
#Send ticket
RESPONSE=$(
    curl -so dev/null -w '%{http_code}' -X POST "https://api.tracker.yandex.net/v2/issues/${TASK_ID}/comments" \
    -H "Authorization: OAuth ${OAUTH}" \
    -H "X-Org-Id: ${XORGID}" \
    -H "Content-Type: application/json" \
    -d '{
        "text": "'${OUTPUT_JEST}'"
    }'
)
echo $RESPONSE