# doktor-v2-backup

[doktor-v2](https://github.com/cdsl-research/doktor-v2) マイクロサービスで使用されている各種データベース（MongoDB, MinIO, Elasticsearch）のバックアップを行います。

## バックアップ対象

- **MongoDB**: author, paper, stats

- **MinIO**: paper, thumbnail

- **Elasticsearch**: fulltext

## ディレクトリ構成

- `deploy/`
    - K3s上で定期的にバックアップを実行するためのCronJobやConfigMapのマニフェストが含まれます。

- `dockerfile/`
    - 各種データベース（MongoDB, MinIO, Elasticsearch）のバックアップを行うシェルスクリプトとDockerfileが含まれます。

- `task-scheduler/`
    - Synology NASのタスクスケジューラーに設定するスクリプトが含まれます。
    - 30日以上前のバックアップ削除と、バックアップ状況のSlack通知を行います。