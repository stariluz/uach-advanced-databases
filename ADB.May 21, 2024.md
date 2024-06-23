```
docker run -dti -p3306:3306 --name adb-mysql --hostname adb-mysql -e MYSQL_ROOT_PASSWORD=1234adb -v data:/var/lib/mysql mysql
docker run -dti -p3306:3306 --name adb-mysql --hostname adb-mysql -e MYSQL_ROOT_PASSWORD=1234adb -v adb-mysql:/var/lib/mysql mysql
```