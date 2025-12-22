#!/bin/bash

set -e

TFC_WORKSPACE_ID=$1
TFC_API_TOKEN=$2
AWS_ACCESS_KEY_ID=$3
AWS_SECRET_ACCESS_KEY=$4
AWS_SESSION_TOKEN=$5

# Check if the variable AWS_ACCESS_KEY_ID exists
EXISTING_AWS_ACCESS_KEY_ID=$(curl --silent --request GET \
  --url "https://app.terraform.io/api/v2/workspaces/$TFC_WORKSPACE_ID/vars" \
  --header "Authorization: Bearer $TFC_API_TOKEN" \
  | jq -r --arg search_key "AWS_ACCESS_KEY_ID" '.data[] | select(.attributes.key == $search_key) | .id')

if [ -n "$EXISTING_AWS_ACCESS_KEY_ID" ]; then
  # Update the existing variable
  curl --silent --request PATCH \
    --url "https://app.terraform.io/api/v2/vars/$EXISTING_ACCESS_KEY_ID" \
    --header "Authorization: Bearer $TFC_API_TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --data '{
      "data": {
        "type": "vars",
        "attributes": {
          "key": "AWS_ACCESS_KEY_ID",
          "value": "'"$AWS_ACCESS_KEY_ID"'",
          "category": "env",
          "hcl": false,
          "sensitive": true
        }
      }
    }'
else
  # Create a new variable
  curl --silent --request POST \
    --url "https://app.terraform.io/api/v2/workspaces/$TFC_WORKSPACE_ID/vars" \
    --header "Authorization: Bearer $TFC_API_TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --data '{
      "data": {
        "type": "vars",
        "attributes": {
          "key": "AWS_ACCESS_KEY_ID",
          "value": "'"$AWS_ACCESS_KEY_ID"'",
          "category": "env",
          "hcl": false,
          "sensitive": true
        }
      }
    }'
fi

# Check if the variable AWS_SECRET_ACCESS_KEY exists
EXISTING_AWS_SECRET_ACCESS_KEY=$(curl --silent --request GET \
  --url "https://app.terraform.io/api/v2/workspaces/$TFC_WORKSPACE_ID/vars" \
  --header "Authorization: Bearer $TFC_API_TOKEN" \
  | jq -r --arg search_key "AWS_SECRET_ACCESS_KEY" '.data[] | select(.attributes.key == $search_key) | .id')

if [ -n "$EXISTING_AWS_SECRET_ACCESS_KEY" ]; then
  # Update the existing variable
  curl --silent --request PATCH \
    --url "https://app.terraform.io/api/v2/vars/$EXISTING_AWS_SECRET_ACCESS_KEY" \
    --header "Authorization: Bearer $TFC_API_TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --data '{
      "data": {
        "type": "vars",
        "attributes": {
          "key": "AWS_SECRET_ACCESS_KEY",
          "value": "'"$AWS_SECRET_ACCESS_KEY"'",
          "category": "env",
          "hcl": false,
          "sensitive": true
        }
      }
    }'
else
  # Create a new variable
  curl --silent --request POST \
    --url "https://app.terraform.io/api/v2/workspaces/$TFC_WORKSPACE_ID/vars" \
    --header "Authorization: Bearer $TFC_API_TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --data '{
      "data": {
        "type": "vars",
        "attributes": {
          "key": "AWS_SECRET_ACCESS_KEY",
          "value": "'"$AWS_SECRET_ACCESS_KEY"'",
          "category": "env",
          "hcl": false,
          "sensitive": true
        }
      }
    }'
fi

# Check if the variable AWS_SESSION_TOKEN exists
EXISTING_AWS_SESSION_TOKEN=$(curl --silent --request GET \
  --url "https://app.terraform.io/api/v2/workspaces/$TFC_WORKSPACE_ID/vars" \
  --header "Authorization: Bearer $TFC_API_TOKEN" \
  | jq -r --arg search_key "AWS_SESSION_TOKEN" '.data[] | select(.attributes.key == $search_key) | .id')

if [ -n "$EXISTING_AWS_SESSION_TOKEN" ]; then
  # Update the existing variable
  curl --silent --request PATCH \
    --url "https://app.terraform.io/api/v2/vars/$EXISTING_AWS_SESSION_TOKEN" \
    --header "Authorization: Bearer $TFC_API_TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --data '{
      "data": {
        "type": "vars",
        "attributes": {
          "key": "AWS_SESSION_TOKEN",
          "value": "'"$AWS_SESSION_TOKEN"'",
          "category": "env",
          "hcl": false,
          "sensitive": true
        }
      }
    }'
else
  # Create a new variable
  curl --silent --request POST \
    --url "https://app.terraform.io/api/v2/workspaces/$TFC_WORKSPACE_ID/vars" \
    --header "Authorization: Bearer $TFC_API_TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --data '{
      "data": {
        "type": "vars",
        "attributes": {
          "key": "AWS_SESSION_TOKEN",
          "value": "'"$AWS_SESSION_TOKEN"'",
          "category": "env",
          "hcl": false,
          "sensitive": true
        }
      }
    }'
fi

