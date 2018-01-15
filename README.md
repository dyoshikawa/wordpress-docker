# Docker Wordpress
## Start
~~~
$ git clone https://github.com/dyoshikawa/docker-wordpress.git
$ cd docker-wordpress
$ docker-compose up -d
~~~

## WordPress初期設定

- mysql.env無変更の場合

|項目|値|
|:---|:---|
|ホスト|mysql|
|パスワード|password|
|データベース|wordpress|

## 参考
- https://tech.recruit-mp.co.jp/infrastructure/post-13086/
- https://tech.recruit-mp.co.jp/infrastructure/post-12795/
- https://joppot.info/2017/05/12/3977
- https://github.com/github/gitignore/blob/master/WordPress.gitignore