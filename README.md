# 🏆 Tournament Management System

![Status](https://img.shields.io/badge/status-completed-blue)
![Type](https://img.shields.io/badge/project-academic-lightgrey)
![License](https://img.shields.io/badge/license-MIT-blue)
![Database](https://img.shields.io/badge/database-MariaDB-lightgrey)

[🇬🇧 English](#-english-version) | [🇵🇱 Polski](#-wersja-polska)
## 🇬🇧 English version
---
## 📖 Project Description

This project was developed as part of a university "Databases" course.  
It aims to implement a **relational database system** for managing tournaments, including:

- players
- teams
- tournaments
- matches

To enhance efficiency, the system uses **stored procedures** and **partitioning** on the main tournament table.

---

## 🛠️ Technologies

- **MariaDB** – main relational database
- **Navicat Premium** *(optional)* – graphical database interface

---

## 🗃️ Database Structure

The system consists of **16 relational tables**. Key entities include:

| Table       | Description                        |
|-------------|------------------------------------|
| `gracze`    | Stores player information          |
| `druzyny`   | Stores team data                   |
| `turnieje`  | Tournament records (partitioned)   |
| `mecze`     | Match details                      |

The full schema is defined in the file `turnieje - structure.sql`.

---

## ⚙️ Features

Several **stored procedures** have been implemented to simplify database operations:

- `dodaj_gracza` – add a new player
- `dodaj_druzyne` – add a new team
- `dodaj_turniej` – create a tournament
- `zmien_status_gracza` – change player active status
- `zmien_status_druzyny` – change team active status

The procedure definitions and sample data are available in `turnieje - structure&data.sql`.

---

## 📊 Table Partitioning

The `turnieje` (tournaments) table is **partitioned by start date**, enabling more efficient execution of queries involving date ranges.

---

## 🚀 How to Run the Project

1. ✅ Install **MariaDB**
2. ⚙️ *(Optional)* Install **Navicat Premium** or a similar database management tool
3. 🧱 Load the file `turnieje - structure.sql` to create the database schema
4. 📥 Load `turnieje - structure&data.sql` to insert sample data and stored procedures

---

## 👤 Author

**Paulina Wróblewska**  
🔗 [LinkedIn](https://www.linkedin.com/in/paulina-wr%C3%B3blewska-2381a217b/)

🔗 [GitHub](https://github.com/Paulina-Wroblewska)

---

## 📌 Notes

- The database design supports scalability and is suitable for tournament tracking systems.
- The project can be further expanded with application layers (API, frontend, admin panel).



## 🇵🇱 Wersja polska
---

### 📖 Opis projektu

Projekt zrealizowany w ramach kursu "Bazy danych". Celem było stworzenie relacyjnej bazy danych obsługującej system turniejowy. Baza umożliwia zarządzanie graczami, drużynami, turniejami oraz meczami. Zaimplementowano procedury składowane oraz partycjonowanie tabeli `turnieje`.

### 🛠️ Technologie

- **MariaDB**
- **Navicat Premium** (opcjonalnie)

### 🗃️ Struktura bazy danych

Baza zawiera 16 tabel. Kluczowe z nich:

- `gracze` – zawodnicy
- `druzyny` – drużyny
- `turnieje` – turnieje (z partycjonowaniem)
- `mecze` – dane meczowe

Struktura: `turnieje - structure.sql`

### ⚙️ Funkcjonalności

Procedury składowane:

- `dodaj_gracza`
- `dodaj_druzyne`
- `dodaj_turniej`
- `zmien_status_gracza`
- `zmien_status_druzyny`

Kod w: `turnieje - structure&data.sql`

### 📊 Partycjonowanie

Tabela `turnieje` partycjonowana według daty rozpoczęcia – poprawa wydajności zapytań czasowych.

### 🚀 Uruchomienie

1. Zainstaluj **MariaDB**
2. *(Opcjonalnie)* Navicat Premium
3. Załaduj `turnieje - structure.sql`
4. Następnie załaduj `turnieje - structure&data.sql`

### 👤 Autor

**Paulina Wróblewska**  
🔗 [LinkedIn](https://www.linkedin.com/in/paulina-wr%C3%B3blewska-2381a217b/)

🔗 [GitHub](https://github.com/Paulina-Wroblewska)



