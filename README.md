ENG 

PL

# 🏆 System Zarządzania Turniejami

## 📖 Opis projektu

Projekt zrealizowany w ramach kursu "Bazy Danych". Celem było stworzenie relacyjnej bazy danych obsługującej system turniejowy, umożliwiającej zarządzanie graczami, drużynami, turniejami oraz meczami. Zastosowano procedury składowane oraz partycjonowanie w wybranych tabelach w celu optymalizacji działania.

## 🛠️ Technologie

- **MariaDB** – system zarządzania bazą danych
- **Navicat Premium** (opcjonalnie) – narzędzie do zarządzania bazą danych

## 🗃️ Struktura bazy danych

Baza danych składa się z 16 tabel. Kluczowe z nich to:

- `gracze` – informacje o zawodnikach
- `druzyny` – dane drużyn
- `turnieje` – dane turniejów (z zastosowanym partycjonowaniem)
- `mecze` – zapis przebiegu meczów

Szczegółowa struktura znajduje się w pliku `turnieje - structure.sql`.

## ⚙️ Funkcjonalności

Zaimplementowano następujące procedury składowane:

- `dodaj_gracza` – dodawanie nowych graczy
- `dodaj_druzyne` – tworzenie nowych drużyn
- `dodaj_turniej` – organizacja nowych turniejów
- `zmien_status_gracza` – zmiana statusu aktywności gracza
- `zmien_status_druzyny` – zmiana statusu aktywności drużyny

Kod procedur zawarty jest w pliku `turnieje - structure&data.sql`.

## 📊 Partycjonowanie

Tabela `turnieje` została zoptymalizowana poprzez partycjonowanie według daty rozpoczęcia turnieju, co poprawia wydajność zapytań dotyczących zakresów czasowych.

## 🚀 Instrukcja uruchomienia

1. Zainstaluj **MariaDB**.
2. *(Opcjonalnie)* Zainstaluj **Navicat Premium** lub inne narzędzie do zarządzania bazami danych.
3. Uruchom plik `turnieje - structure.sql`, aby utworzyć strukturę bazy danych.
4. Załaduj plik `turnieje - structure&data.sql`, aby dodać przykładowe dane oraz procedury.

## 👤 Autor

**Paulina Wróblewska**  
📂 Repozytorium: [github.com/Paulina-Wroblewska/BazyDanych](https://github.com/Paulina-Wroblewska/BazyDanych)
