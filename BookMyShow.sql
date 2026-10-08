-- P1: Database Schema & Normalization

-- Create Movies Table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    language VARCHAR(50),
    duration_minutes INT
);

-- Create Theatres Table
CREATE TABLE theatres (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location_city VARCHAR(100)
);

-- Create Screens Table
CREATE TABLE screens (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_id INT NOT NULL,
    screen_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
);

-- Create Shows Table
CREATE TABLE shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    show_date DATE NOT NULL,
    start_time TIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES screens(screen_id)
);

-- Sample Data Insertion
INSERT INTO movies (title, language, duration_minutes) VALUES
('Inception', 'English', 148),
('Interstellar', 'English', 169),
('The Dark Knight', 'English', 152);

INSERT INTO theatres (name, location_city) VALUES
('PVR IMAX', 'Mumbai'),
('Cinepolis', 'Bangalore');

INSERT INTO screens (theatre_id, screen_name) VALUES
(1, 'Screen 1'),
(1, 'Screen 2'),
(2, 'Screen 1');

INSERT INTO shows (movie_id, screen_id, show_date, start_time) VALUES
(1, 1, '2026-10-15', '10:00:00'),
(2, 1, '2026-10-15', '14:00:00'),
(3, 2, '2026-10-15', '18:30:00'),
(1, 1, '2026-10-16', '10:00:00');


-- P2: Query Shows for a Date and Theatre
-- Write a query to list down all the shows on a given date at a given theatre along with their respective show timings.

SELECT 
    m.title AS movie_title,
    s.screen_name,
    sh.start_time
FROM shows sh
JOIN movies m ON sh.movie_id = m.movie_id
JOIN screens s ON sh.screen_id = s.screen_id
JOIN theatres t ON s.theatre_id = t.theatre_id
WHERE t.name = 'PVR IMAX' 
  AND sh.show_date = '2026-10-15'
ORDER BY sh.start_time;
