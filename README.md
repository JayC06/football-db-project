⚽ Football Performance Database & Desktop App
📌 Overview

The project itself is a football statistics database designed to store player, team, match, and stadium data. The goal is to create an SQL-powered system alongside a desktop application, allowing users to retrieve football insights efficiently.

This project is for learning - aimed at improving my skills in SQL, App Development and any other skills required along the way. I'm starting from a base of having basic SQL knowledge and absoloutely no development knowledge. The focus is not just on completing the project but on learning all the necessary skills as I go. Therefore, the structure will be fluid based on my own development but the end goal will remain the same. Finally this repository will be a **portfolio piece** helping me transition into a coding or software related career.

🔧 Technologies Used
- SQL (MySQL/PostgreSQL) – Database management
- Python/C#/Java – Desktop application development
- Data Processing – CSV imports, indexing for performance
📊 Core Features
- ✅ Player Data – Store player names, positions, stats
- ✅ Performance Tracking – Goals, assists, appearances across seasons
- ✅ Team Data – Club details, rivalries, history
- ✅ Fixtures & Results – Match schedules, scores
- ✅ Stadium & Attendance Info – Venue details, crowd stats
🔍 Database Schema
The project uses a structured relational database with key tables:
- Players: player_id, name, position, team_id
- Teams: team_id, name, founded, stadium_id
- Fixtures & Results: match_id, home_team, away_team, score
- Player Performance: player_id, goals, assists, appearances
- Stadiums: stadium_id, name, location, capacity
🚀 Development Plan
✔ Phase 1 – Design database schema & relationships
✔ Phase 2 – Populate database with football data
✔ Phase 3 – Optimize SQL queries for performance
✔ Phase 4 – Build desktop application interface
🛠 Challenges & Solutions
One challenge was efficiently importing large amounts of football data. I addressed this by using bulk inserts and indexing strategies to speed up queries.
🎯 Future Improvements
Next, I plan to:
- Expand the database to include player transfers
- Integrate live data via an API
- Enhance the user interface for better interaction
