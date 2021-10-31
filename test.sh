#!/bin/bash

response=$(
curl -s -X GET https://api.tracker.yandex.net/v2/issues \
-H "Content-Type: application/json" \
-H "Authorization: OAuth ${OAuth}" \
-H "X-Org-Id: ${XOrgID}"
)