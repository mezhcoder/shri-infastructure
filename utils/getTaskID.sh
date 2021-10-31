#!/bin/bash

RELEASE_TAG=$(git describe --tags HEAD)
UNIQUE="https://github.com/mezhcoder/shri-infastructure/releases/tag/${RELEASE_TAG}"

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
