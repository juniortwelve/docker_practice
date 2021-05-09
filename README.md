# このリポジトリについて

このリポジトリは、Docker(Docker Compose)とGithub Actionsの勉強用に作成したリポジトリです。  
アプリの内容自体はほぼ`rails new`しただけのものですが、`docker-compose up`のみでアプリが構築、起動するようになっているほか、プルリクエスト作成時にGithub actionsによるCIが自動で走るようになっています。

# Dockerについて
このアプリは、Dockerを用いて簡単に環境構築、アプリの起動が行えるようになっています。  
まずは
```bash
git clone git@github.com:juniortwelve/docker_practice.git
```
でリポジトリをクローン後
```bash
touch .env
```
で`.env`という名前のファイルをアプリ直下に作成して下さい。  
その後、以下の内容を`.env`ファイルに書き込んで下さい。
```bash
MYSQL_USER=rails
MYSQL_PASSWORD=password
MYSQL_ROOT_PASSWORD=password
MYSQL_HOST=db
MYSQL_DATABASE=docker_practice_development
```

最後に
```bash
docker-compose up
```
でアプリを起動することができます。  
なお、初回起動時は`Webpacker::Manifest::MissingEntryError`というエラーが発生することがあるので、その場合は
```
docker-compose run --rm web yarn install
```
を実行してから、再度`docker-compose up`をしてください。

# Github actionsについて
このリポジトリは Github actionsによるCIを導入しており、
プルリクエスト作成時にRspecとRubocopが自動で走るようになっています。  
ジョブの成功時、失敗時にはそれぞれ以下のような通知がSlackに飛ぶようになっています。
| 成功時 | 失敗時 |
| --- | --- |
| ![スクリーンショット 2021-05-09 153656](https://user-images.githubusercontent.com/49778469/117562771-86746200-b0dc-11eb-9e65-dcc37980fafe.png) | ![スクリーンショット 2021-05-09 153726](https://user-images.githubusercontent.com/49778469/117562774-8b391600-b0dc-11eb-9afa-5bf1430e4ca9.png) |
