# Репликация

Данный проект предназначен для автоматизации процесса репликации между двумя docker-контейнерами

# Ссылки

* [Настройка репликации PostgreSQL в контейнерах Docker](https://www.dmosk.ru/miniinstruktions.php?mi ni=postgresql-replication-docker&ysclid=m76fgdphx8968237571) - не особо удачная реализация

* [Посмотреть тут](https://dev.to/ietxaniz/practical-postgresql-logical-replication-setting-up-an-experimentation-environment-using-docker-4h50?ysclid=m76ffadatt332013864)

* [Более толково](https://yourtodo.life/ru/posts/nastrojka-i-vosstanovlenie-postgresql-s-wal-podrobnoe-rukovodstvo/)

* [Инициализация PostgreSQL в DockerCompose связке](https://stackoverflow.com/questions/26598738/how-to-create-user-database-in-script-for-docker-postgres)

* [Работа с несколькими базами данных в Ruby on Rails приложении](https://rusrails.ru/active-record-multiple-databases#soedinenie-s-bazami-dannyh-bez-upravleniya-shemoy-i-migratsiyami)

# Запуск

Запуск двух postgresql-серверов

```docker
docker compose up -d
```

Остановка серверов

```docker
docker compose down
```

# Команды для master-сервера

Вход из под пользователя postres

```docker
docker exec -it master su - postgres
```

Внутри контейнера запускаем консольный psql

```bash
psql
```

Создаем таблицу и заполняем ее

```sql
CREATE TABLE users (id SERIAL PRIMARY KEY, name TEXT);
INSERT INTO users (name) VALUES ('Igor'), ('Ivan'), ('Sergey');
```

# Команды для slave-сервера

```docker
docker exec -it slave su - postgres
```

внутри docker-контейнера выполняем команду

```bash
./init-slave.sh
```

Внутри контейнера запускаем консольный psql

```bash
psql
```

Убеждаемся, что данные переданы из master в slave

```bash
SELECT * FROM users;
```
