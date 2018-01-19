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
|データベース|wordpress|
|ユーザ|root|
|パスワード|password|

## 参考
- https://tech.recruit-mp.co.jp/infrastructure/post-13086/
- https://tech.recruit-mp.co.jp/infrastructure/post-12795/
- https://joppot.info/2017/05/12/3977
- https://github.com/github/gitignore/blob/master/WordPress.gitignore
- https://qiita.com/ry0f/items/6e29fa9f689b97058085
- https://qiita.com/osktak/items/f1746d64797a6a4dd6ae