#!/bin/bash
curl --request POST \
      --url ${{ secrets.ONEP_DEPLOY_URL }}${{ secrets.ONEP_APP_ID }}${{ secrets.ONEP_DEPLOY_TOKEN }} \
      -H 'Content-Type: application/json' \
      --data-binary @- <<EOF
      {
          "application_id": ${{ secrets.ONEP_APP_ID }},
          "application_uid": "${{ secrets.ONEP_APP_UID }}",
          "organization": "${{ secrets.ONEP_ORG }}",
          "description": "${{ github.event.head_commit.message }}",
          "version": "${{ github.sha }}",
          "type": "deploy"
      }
      EOF