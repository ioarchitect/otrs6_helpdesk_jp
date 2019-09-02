OTRS6 Helpdeskイメージです。

事前調査やバージョンアップ計画前の検証などの用途にご利用ください。

OTRS 6.0.22 helpdesk (OTRS6)
Mysql 5.7.19

基本的にはioarchitectjp/otrs5_helpdesk_jpのOTRSのバージョンを5から6に上げたものです。

実行は以下のようにしてください。
docker run -d -p <ポート>:80 docker.io/ioarchitectjp/otrs6_helpdesk_jp
もしくは
docker run -d -p <ポート>:80 ioarchitectjp/otrs6_helpdesk_jp

コンテナ起動後、以下のURLでログイン画面にアクセスできます。
http://<ホストのIP>:<ポート>/otrs/index.pl

初期状態では、以下のアカウントが有効となっています。ログイン後適宜変更してください。
ID: root@localhost
PW: otrs-ioa

本バージョンではメールの評価が出来るようにローカルのみで有効なウェブメーラーを同梱しました。
以下のURLからウェブメーラーにログインして、OTRSにサポート依頼を投げることができます。
http://<ホストのIP>:<ポート>/webmail

メール用のユーザとして以下アカウントを用意しています。パスワードはユーザ名と同一です。
cust01/cust01
cust02/cust02
cust03/cust03
cust04/cust04
cust05/cust05
agent01/agent01
agent02/agent02
agent03/agent03
agent04/agent04
agent05/agent05

初期状態ではOTRSヘルプデスクのメールアドレスは以下の通りです。
helpdesk@eval-mail.local.domain

cust01〜cust05でWebメーラーにログインし、上のアドレスに対してメールを送るとOTRSに取り込まれます(5分ほどかかります)。また、OTRSからメールの返信を行うことができますので、メール関連の操作についてもお試しいただけるかと思います。
agent01〜agent05は担当者作成時のメールアドレスとしてお使いください。OTRSからのシステム通知等がお試しいただけます。


・「OTRSデーモンが起動していません」のメッセージは5〜10分ぐらい経つと消えます。
・OTRSの評価目的のイメージのため、本番での使用はお勧めしません。

