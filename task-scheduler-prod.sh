slack () {
  curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$1\"}" https://hooks.slack.com/services/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 || true
}

cd /volume1/doktor-prod-backup

ENVIRONMENT="PROD"
SRC_DIR="cdsl@clematis-main-master-mi:/home/cdsl/backup/"
FIRST_BACKUP=$(ls | grep backup- | head -n 1)
SSH_KEY="/volume1/doktor-prod-backup/id_ed25519"

# rsyncコマンドで増分バックアップを行う
# バックアップ先のディレクトリが空の場合は、最新のバックアップを取得する
if [ -z "$(ls -d backup-*)" ]; then
  rsync -avzh $SRC_DIR ./backup-$(date +%Y%m%d-%H%M%S) -e "ssh -i $SSH_KEY"
  slack "[$ENVIRONMENT] First full backup has been completed."
else
  rsync -avh $SRC_DIR ./backup-$(date +%Y%m%d-%H%M%S) --link-dest=/volume1/doktor-dev-backup/$FIRST_BACKUP -e "ssh -i $SSH_KEY"
  slack "[$ENVIRONMENT] Backup has been completed."
fi