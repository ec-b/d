# Developer Notes

## Подключение к БД

Сервер: `ILABSQLW19S1`, порт `49172`, база `shoe_shop`, Windows Authentication.
Настройки в `db.py`. Если `SQL Server` драйвер не находится — проверить доступные:

```python
import pyodbc; print(pyodbc.drivers())
```

Заменить `_driver` в `db.py` на нужный (например `ODBC Driver 17 for SQL Server`).

## Генерация UI из .ui файлов

```cmd
pyside6-uic ui/login.ui -o ui/login.py
pyside6-uic ui/main.ui -o ui/main.py
pyside6-uic ui/item_card.ui -o ui/item_card.py
pyside6-uic ui/edit.ui -o ui/edit.py
```

## Схема БД

### Справочники — общая структура (`category`, `manufacturer`, `name`, `role`, `status`, `supplier`, `unit`)

| Поле | Тип |
|---|---|
| id | int |
| title | nvarchar |

### product

| Поле | Тип | Примечание |
|---|---|---|
| id | int | |
| article | nvarchar | |
| name_id | int | → name |
| unit_id | int | → unit |
| price | decimal | |
| supplier_id | int | → supplier |
| manufacturer_id | int | → manufacturer |
| category_id | int | → category |
| discount | decimal | nullable |
| stock_quantity | int | |
| description | nvarchar | nullable |
| photo | nvarchar | nullable, путь к файлу |

### user

| Поле | Тип | Примечание |
|---|---|---|
| id | int | |
| role_id | int | → role |
| full_name | nvarchar | |
| login | nvarchar | |
| password | nvarchar | |

### order

| Поле | Тип | Примечание |
|---|---|---|
| id | int | |
| order_date | datetime | |
| delivery_date | datetime | nullable |
| pickup_point_id | int | → pickup_point |
| user_id | int | → user |
| code | nvarchar | nullable |
| status_id | int | → status |

### order_item

| Поле | Тип | Примечание |
|---|---|---|
| id | int | |
| order_id | int | → order |
| product_id | int | → product |
| quantity | int | |

### pickup_point

| Поле | Тип |
|---|---|
| id | int |
| address | nvarchar |