# подключение к базе данных и маппинг таблиц через automap
import urllib
import sqlalchemy as sa
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import sessionmaker

_driver = "ODBC Driver 17 for SQL Server"

params = urllib.parse.quote_plus(
    f"DRIVER={{{_driver}}};"
    "SERVER=.\\SQLEXPRESS;"
    "DATABASE=shoe_shop;"
    "Trusted_Connection=yes;"
)
engine = sa.create_engine(f"mssql+pyodbc:///?odbc_connect={params}")

Base = automap_base()
Base.prepare(autoload_with=engine)

session = sessionmaker(engine)()

Product = Base.classes.product
User = Base.classes.user
Supplier = Base.classes.supplier
Name = Base.classes.name
Category = Base.classes.category
Manufacturer = Base.classes.manufacturer
Unit = Base.classes.unit
Role = Base.classes.role
OrderItem = Base.classes.order_item


def _load_lookup(cls):
    return {r.id: r.title.strip() for r in session.query(cls).all()}
