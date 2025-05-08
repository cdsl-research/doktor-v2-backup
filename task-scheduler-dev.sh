# Slack通知の関数
slack () {
  curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$1\"}" https://hooks.slack.com/services/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 || true
}

cd /volume1/doktor-dev-backup

SRC_DIR="cdsl@doktor-m-v2:/home/cdsl/backup/"
LATEST_BACKUP=$(ls | grep backup- | tail -n 1)
SSH_KEY="/volume1/doktor-dev-backup/id_ed25519"

# rsyncコマンドで増分バックアップを行う
# バックアップ先のディレクトリが空の場合は、最新のバックアップを取得する
if [ -z "$(ls -d backup-*)" ]; then
  rsync -avzh $SRC_DIR ./backup-$(date +%Y%m%d-%H%M%S) -e "ssh -i $SSH_KEY"
else
  rsync -avh $SRC_DIR ./backup-$(date +%Y%m%d-%H%M%S) --link-dest=/volume1/doktor-dev-backup/$LATEST_BACKUP -e "ssh -i $SSH_KEY"
  slack "[DEV] Backup finished."
fi