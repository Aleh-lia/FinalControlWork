baleh@Ubuntu:~$ wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb
--2023-03-23 21:06:03--  https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb
Распознаётся dev.mysql.com (dev.mysql.com)… 23.61.243.80, 2a02:26f0:9500:b80::2e31, 2a02:26f0:9500:b91::2e31
Подключение к dev.mysql.com (dev.mysql.com)|23.61.243.80|:443... соединение установлено.
HTTP-запрос отправлен. Ожидание ответа… 302 Moved Temporarily
Адрес: https://repo.mysql.com//mysql-apt-config_0.8.16-1_all.deb [переход]
--2023-03-23 21:06:04--  https://repo.mysql.com//mysql-apt-config_0.8.16-1_all.deb
Распознаётся repo.mysql.com (repo.mysql.com)… 2.19.12.220
Подключение к repo.mysql.com (repo.mysql.com)|2.19.12.220|:443... соединение установлено.
HTTP-запрос отправлен. Ожидание ответа… 200 OK
Длина: 35528 (35K) [application/x-debian-package]
Сохранение в: ‘mysql-apt-config_0.8.16-1_all.deb’
mysql-apt-config_0.8.16- 100%[===============================>]  34,70K  --.-KB/s    за 0,06s
2023-03-23 21:06:05 (544 KB/s) - ‘mysql-apt-config_0.8.16-1_all.deb’ сохранён [35528/35528]

vbaleh@Ubuntu:~$ sudo dpkg -i mysql-apt-config_0.8.16-1_all.deb
(Чтение базы данных … на данный момент установлен 207341 файл и каталог.)
Подготовка к распаковке mysql-apt-config_0.8.16-1_all.deb …
Распаковывается mysql-apt-config (0.8.16-1) на замену (0.8.16-1) …
Настраивается пакет mysql-apt-config (0.8.16-1) …

vbaleh@Ubuntu:~$ sudo apt update
vbaleh@Ubuntu:~$ sudo apt-get install mysql-server
vbaleh@Ubuntu:~$ sudo wget https://download.virtualbox.org/virtualbox/7.0.4/virtualbox-7.0_7.0.4-154605~Ubuntu~jammy_amd64.deb
vbaleh@Ubuntu:~$ sudo dpkg -i virtualbox-7.0_7.0.4-154605~Ubuntu~jammy_amd64.deb
vbaleh@Ubuntu:~$ sudo apt -f install
vbaleh@Ubuntu:~$ sudo dpkg -r virtualbox-7.0

