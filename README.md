# Каталог товаров

Десктопное приложение на PySide6 с подключением к MS SQL Server.

## Требования

- Python 3.10+
- ODBC Driver 17 for SQL Server (или встроенный `SQL Server`)
- Подключение к серверу `ILABSQLW19S1,49172` по Windows Authentication
- База данных `shoe_shop`

## Установка

```cmd
python -m venv .venv
.venv\Scripts\activate.bat
pip install PySide6 SQLAlchemy pyodbc
```

## Запуск

```cmd
python main.py
```

## Роли

| Роль | Доступ |
|---|---|
| Гость | просмотр каталога |
| Менеджер | + поиск, фильтр, сортировка |
| Администратор | + добавление, редактирование, удаление товаров |

Войти как гость можно без логина — кнопка **«Войти как гость»**.
