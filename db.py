import urllib
import pyodbc
import sqlalchemy as sa
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import sessionmaker

_driver = "SQL Server"

params = urllib.parse.quote_plus(
    f"DRIVER={{{_driver}}};"
    "SERVER=ILABSQLW19S1,49172;"
    "DATABASE=shoe_shop;"
    "Trusted_Connection=yes;"
)
engine = sa.create_engine(f"mssql+pyodbc:///?odbc_connect={params}")
SessionLocal = sessionmaker(engine)

Base = automap_base()
Base.prepare(autoload_with=engine)

session = SessionLocal()

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
