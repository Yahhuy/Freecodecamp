# 🌌 Cosmic Database: An Astronomical Relational Schema

## 🧠 Project Overview

This project is a relational database schema designed to model entities within a fictional or scientific universe — from massive galaxies down to tiny moons. Built on PostgreSQL, the schema allows structured storage and querying of astronomical objects including:

- **Galaxies**
- **Stars**
- **Planets**
- **Moons**
- **Constellations**
- **Space Objects** (e.g. comets, black holes, probes)

## 🗂️ Schema Highlights

Each table in the database maps to a class of celestial entities:

| Table Name     | Description                                     |
|----------------|-------------------------------------------------|
| `galaxy`       | Stores galactic metadata like type, size, and distance |
| `star`         | Tracks stars and links them to galaxies         |
| `planet`       | Records planets orbiting stars                  |
| `moon`         | Registers moons and their host planets          |
| `constellation`| Represents constellations containing stars      |
| `space_object` | Generic repository for comets, probes, black holes, etc. |

### 🔗 Key Relationships
- `star.galaxy_id` → `galaxy.galaxy_id`
- `planet.star_id` → `star.star_id`
- `moon.planet_id` → `planet.planet_id`
- Many-to-many: `constellation_star` junction table

## 🧪 How to Use

### 1. Create Tables
Use the SQL scripts provided to initialize your database schema.

### 2. Populate Data
Insert sample data using the included `INSERT` scripts. These contain rows for real and fictional objects.

### 3. Run Queries
Explore the cosmos with SQL queries, such as:
```sql
-- Example: Find planets with potential for life
SELECT name FROM planet WHERE has_life = TRUE;

🚀 Technologies Used
PostgreSQL

SQL (DDL & DML)

VS Code (Web & Desktop)

Git (for version control)
