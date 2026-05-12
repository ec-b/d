"""
Скачивает .venv.zip с сервера и распаковывает рядом со скриптом.
Запуск: python bootstrap.py
После — запускать приложение: .venv\Scripts\python.exe main.py
"""

import urllib.request
import zipfile
import sys
from pathlib import Path

VENV_ZIP_URL = "http://YOUR_SERVER/venv.zip"  # <- поменяй на свой URL
DEST = Path(__file__).parent


def main():
    zip_path = DEST / ".venv.zip"

    print("Скачиваю venv...")
    def progress(count, block, total):
        pct = count * block * 100 // total
        print(f"\r  {pct}%", end="", flush=True)

    urllib.request.urlretrieve(VENV_ZIP_URL, zip_path, reporthook=progress)
    print("\nРаспаковываю...")

    with zipfile.ZipFile(zip_path, "r") as z:
        z.extractall(DEST)

    zip_path.unlink()
    print("Готово. Запуск: .venv\\Scripts\\python.exe main.py")


if __name__ == "__main__":
    main()
