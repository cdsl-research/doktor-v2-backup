#!/bin/bash

SLACK_WEBHOOK_URL=$(cat /volume1/doktor-prod-backup/slack-webhook.env)
slack () {
  curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$1\"}" "$SLACK_WEBHOOK_URL" || true
}

cd /volume1/doktor-prod-backup

# 30日前のバックアップの削除
ls -r backup-* | sed -n '31,$p' | xargs rm -rf;

# Slackの #_notice_doktor_backup に通知する
LATEST_BACKUP_DIR=$(ls -r backup-* | head -n 1 | sed 's/:$//')
DIR_CONTENTS=$(ls -lh "$LATEST_BACKUP_DIR")
MESSAGE="[PROD] Data dump has been stored on natadecoco: /volume1/doktor-prod-backup/$LATEST_BACKUP_DIR\n\`\`\`\n$DIR_CONTENTS\n\`\`\`"
slack "$MESSAGE"