# WordpBase
## セットアップ
~~~
$ docker-compose up -d
~~~
~~~
$ cd app
$ vi .gitignore
~~~
~~~
*.log
wp-config.php
wp-content/advanced-cache.php
wp-content/backup-db/
wp-content/backups/
wp-content/blogs.dir/
wp-content/cache/
wp-content/upgrade/
wp-content/uploads/
wp-content/wp-cache-config.php
wp-content/plugins/hello.php

/license.txt
/readme.html
/sitemap.xml
/sitemap.xml.gz
~~~

## 参考
- https://tech.recruit-mp.co.jp/infrastructure/post-13086/#ampshare=https://tech.recruit-mp.co.jp/infrastructure/post-13086/
- https://tech.recruit-mp.co.jp/infrastructure/post-12795/
- https://joppot.info/2017/05/12/3977
- https://github.com/github/gitignore/blob/master/WordPress.gitignore