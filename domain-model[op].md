# Модели предметной области


## Клиенты
Внешний сервис

## Заказы
Внешний сервис

## Пользователи
Интеграция с корпоративным SSO (Keycloak)
* Аутентификация
* Авторизация
* (мб) Профиль

Уведомления пользователя (Возможно отдельный сервия)

## Обращения
Основная часть проекта
* DB Postgres (с репликацией и пр.) 

Основные сущности
### Инцинденты (обращения в техническую поддержку)
  * Заводятся через UI
  * Возможны дополнительние каналы получения
    * Telegram, ...
    * ESB
    * SMS gateway
### Проблемы (задачи для менеджера задач)
* Заводится автоматически
* По закрытию, автоматически закрывать Инциндент
### Доски (спорная сущность)
* Привязана к Пользователю
* Возможно есть разные виды
### Фильтры (спорная сущность)
* Если сделаем генератор фильтров, здесь сохраним фильтр

### Менеджер задач (Dashboard)
* Grafana
* Prometheus
  * DB Clickhouse
* Фильтры

Вопросы:
* что скрывается за `У задачи имеется бизнес-процесс`
* Привязка в
* Доски
  * где создавать - Grafana
  * как хранить
    * Grafana (сохранять в виде JSON)
  * где брать ссылки
  * автоматическое создание для пользователя
* язык запросов/фильтры
  * где создавать - Grafana
  * как хранить - в паралельной БД (как вариант развития)
    * группировка
    * области видимости
* Пользователи и роли
  * Хранить в выделенном реалме в keyclock

### Сервис Клиентов (наш)
* Список клиентов
* Поиск по имени
* Создание
* Редактирование
### Сервис Заказов (наш)
* Список заказов
* Поиск по Клиенту
* Поиск
* Создание
### Сервис для динамической миграции
* Обращения во внешние системы - кэшируются (Redis)
* Клиенты
  * Создание
    * проксируем обращения в наш сервис
  * Редактирование
    * проверяет если есть в кэше - переносит в наш сервис
    * проксируем обращения в наш сервис
  * Поиск по имени 
    * забираем список с нашего
    * забираем список с внешнего (с таймаутом)
      * сохраняем в кэш то, что есть во внешнем, но нет в нашем
    * возвращаем объединение нашего и кэша
  * Список клиентов
    * Как Поиск по имени, но с пагинацией
* Заказы
  * как клиенты

### БД
* Репликация
* Отдельные БД(схемы) для каждого сервиса (микросекрвисный ?подход)
