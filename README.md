# BookMyShow Database Solution

## Entities and Attributes

Based on the problem statement, the following entities and their attributes are identified:

1. **Movie**
   - `movie_id` (Primary Key)
   - `title`
   - `language`
   - `duration_minutes`

2. **Theatre**
   - `theatre_id` (Primary Key)
   - `name`
   - `location_city`

3. **Screen** (A theatre can have multiple screens running different shows)
   - `screen_id` (Primary Key)
   - `theatre_id` (Foreign Key -> Theatre)
   - `screen_name`

4. **Show** (A specific screening of a movie)
   - `show_id` (Primary Key)
   - `movie_id` (Foreign Key -> Movie)
   - `screen_id` (Foreign Key -> Screen)
   - `show_date`
   - `start_time`

## Normalization (1NF, 2NF, 3NF, BCNF)
- **1NF**: All table attributes are atomic. There are no repeating groups.
- **2NF**: All tables have a single-column primary key (`movie_id`, `theatre_id`, etc.), so there are no partial dependencies.
- **3NF & BCNF**: There are no transitive dependencies. Every non-key attribute is mutually independent and fully dependent only on the primary key. For every functional dependency `X -> Y`, `X` is a superkey.

## Sample Rows

### `movies` Table
| movie_id | title | language | duration_minutes |
|----------|-------|----------|------------------|
| 1 | Inception | English | 148 |

### `theatres` Table
| theatre_id | name | location_city |
|------------|------|---------------|
| 1 | PVR IMAX | Mumbai |

### `screens` Table
| screen_id | theatre_id | screen_name |
|-----------|------------|-------------|
| 1 | 1 | Screen 1 |

### `shows` Table
| show_id | movie_id | screen_id | show_date | start_time |
|---------|----------|-----------|-----------|------------|
| 1 | 1 | 1 | 2026-10-15 | 10:00:00 |

## SQL Solution
The SQL queries for creating these tables, inserting the sample data (P1), and querying the shows for a specific theatre and date (P2) can be found in `solution.sql`.
