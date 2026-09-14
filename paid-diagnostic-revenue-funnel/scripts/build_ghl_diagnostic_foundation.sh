#!/usr/bin/env bash
# Create a focused HighLevel paid-diagnostic foundation. Safe to rerun.
# Requires: GHL_LOCATION_ID, GHL_PRIVATE_INTEGRATION_TOKEN, curl, jq
set -euo pipefail

BASE_URL='https://services.leadconnectorhq.com'
LOCATION_ID="${GHL_LOCATION_ID:?GHL_LOCATION_ID is required}"
TOKEN="${GHL_PRIVATE_INTEGRATION_TOKEN:?GHL_PRIVATE_INTEGRATION_TOKEN is required}"
BRAND_PREFIX="${BRAND_PREFIX:-Brand}"
OFFER_NAME="${OFFER_NAME:-Paid Revenue Diagnostic}"
PIPELINE_NAME="${BRAND_PREFIX} | ${OFFER_NAME}s"
HEADERS=(
  -H 'Accept: application/json'
  -H 'Content-Type: application/json'
  -H "Authorization: Bearer ${TOKEN}"
  -H 'Version: v3'
)

create_tag_if_missing() {
  local tag_name="$1"
  if printf '%s' "$EXISTING_TAGS" | jq -e --arg name "$tag_name" '.. | objects | select(.name? == $name)' >/dev/null; then
    printf 'TAG_STATUS=EXISTS:%s\n' "$tag_name"
  else
    curl -fsS -X POST "${BASE_URL}/locations/${LOCATION_ID}/tags" "${HEADERS[@]}" \
      --data "$(jq -n --arg name "$tag_name" '{name:$name}')" >/dev/null
    printf 'TAG_STATUS=CREATED:%s\n' "$tag_name"
  fi
}

PIPELINES=$(curl -fsS "${BASE_URL}/opportunities/pipelines?locationId=${LOCATION_ID}" "${HEADERS[@]}")
if printf '%s' "$PIPELINES" | jq -e --arg name "$PIPELINE_NAME" '.pipelines[]? | select(.name == $name)' >/dev/null; then
  printf 'PIPELINE_STATUS=EXISTS:%s\n' "$PIPELINE_NAME"
else
  PAYLOAD=$(jq -n --arg name "$PIPELINE_NAME" --arg locationId "$LOCATION_ID" '
    {
      name:$name, locationId:$locationId, showInFunnel:true, showInPieChart:true,
      useOpportunityProbability:true, colorRenderMode:"dot",
      stages:[
        {name:"New Request",position:1,showInFunnel:true,stageWinProbability:5},
        {name:"Qualified",position:2,showInFunnel:true,stageWinProbability:15},
        {name:"Paid",position:3,showInFunnel:true,stageWinProbability:25},
        {name:"Booked",position:4,showInFunnel:true,stageWinProbability:35},
        {name:"Diagnostic Complete",position:5,showInFunnel:true,stageWinProbability:45},
        {name:"Strategy Delivered",position:6,showInFunnel:true,stageWinProbability:55},
        {name:"Proposal",position:7,showInFunnel:true,stageWinProbability:70},
        {name:"Won",position:8,showInFunnel:true,stageWinProbability:100},
        {name:"Nurture",position:9,showInFunnel:false,stageWinProbability:5}
      ]
    }')
  RESPONSE=$(curl -fsS -X POST "${BASE_URL}/opportunities/pipelines" "${HEADERS[@]}" --data "$PAYLOAD")
  PIPELINE_ID=$(printf '%s' "$RESPONSE" | jq -r '.id // .pipeline.id // empty')
  [[ -n "$PIPELINE_ID" ]] || { echo 'Pipeline response omitted ID.' >&2; exit 1; }
  printf 'PIPELINE_STATUS=CREATED:%s\nPIPELINE_ID=%s\n' "$PIPELINE_NAME" "$PIPELINE_ID"
fi

EXISTING_TAGS=$(curl -fsS "${BASE_URL}/locations/${LOCATION_ID}/tags" "${HEADERS[@]}")
for tag in \
  "src | website | paid diagnostic" \
  "offer | paid revenue diagnostic" \
  "stage | new request" \
  "stage | qualified" \
  "stage | paid" \
  "stage | booked"; do
  create_tag_if_missing "$tag"
done

FIELDS=$(curl -fsS "${BASE_URL}/locations/${LOCATION_ID}/customFields?model=contact" "${HEADERS[@]}")
FIELD_NAME="${BRAND_PREFIX} | Diagnostic Readiness"
if printf '%s' "$FIELDS" | jq -e --arg name "$FIELD_NAME" '.customFields[]? | select(.name == $name)' >/dev/null; then
  printf 'FIELD_STATUS=EXISTS:%s\n' "$FIELD_NAME"
else
  curl -fsS -X POST "${BASE_URL}/locations/${LOCATION_ID}/customFields" "${HEADERS[@]}" \
    --data "$(jq -n --arg name "$FIELD_NAME" '{name:$name,dataType:"TEXT",placeholder:"Why is solving this now commercially important?",position:0,model:"contact"}')" >/dev/null
  printf 'FIELD_STATUS=CREATED:%s\n' "$FIELD_NAME"
fi

printf 'FOUNDATION_BUILD=SUCCESS\n'
