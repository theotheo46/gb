12.2 Альтернативный стек

- Среда разработки: Python
- База данных: MongoDB
- Интеграция: REST API

Pros:
- Python:
  - Top 1 TIOBE Index. Самый популярный среди разработчиков ПО. Огромное комьюнити
  - Простота. Интуитивно понятен большинству разработчиков. Выслкая скорость разработки
  - Репозиторий PyPI содержит более 300,000 пакетов
- MongoDB:
  - Можно начинать работать с данными сразу без создания схем
  - Высокая скорость работы за счет наличия механизм хранения данных в памяти
  - Встроенная поддержка шардирования/репликации


Cons:
- Python:
  - Невысокая производительность
- MongoDB:
  - Поддержка транзакций появилась относительно недавно
  - Запросы к нескольким коллекциям - неэффективны


Резюме:
- Стэк идеален для разработки POC/Prototype/MVP


14. Представление развертывания
- Тестовая среда развертывается на рабочем компьютере разработчика с помощью minikube/Kind
- Продуктивная среда среда включает в себя кластер филиала на котором разворачиваюся все микросервисы, Grafana и Prometeus/Clickhouse. Развертывание на региональные узлы кластера репликации базы данных осуществляется отдельно.