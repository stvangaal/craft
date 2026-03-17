# SQL

SQL (Structured Query Language) is the standard language for querying relational databases. If your research involves clinical data, administrative datasets, electronic health records, or any structured data source, you will encounter SQL. It's how data is stored, retrieved, and combined in most healthcare and research data systems.

Understanding SQL lets you inspect, validate, and extract data directly rather than depending on someone else to pull it for you. You can write a query to check how many patients meet your inclusion criteria, verify that a data extract is complete, or join tables from different sources into a single dataset. These are everyday tasks in clinical research, and SQL is the language they're done in.

You don't need to design databases or write production applications. What you need is the ability to write SELECT statements, filter with WHERE clauses, join tables, and aggregate data with GROUP BY — the core operations that cover the vast majority of research use cases.

## Getting Started

SQL runs against a database, not on its own. For learning, you can use browser-based tools or install a lightweight database locally.

| Resource | Notes |
|---|---|
| [SQLite](https://www.sqlite.org/download.html) | Lightweight, file-based database that requires no server setup. Good for learning and small datasets |
| [DB Browser for SQLite](https://sqlitebrowser.org) | Free GUI for SQLite — create databases, write queries, and browse results visually |
| [MySQL Community Server](https://dev.mysql.com/downloads/mysql/) | Full relational database. Needed if your research data lives in MySQL, but heavier than SQLite for learning |

## Quick References

- [SQL Basics Cheat Sheet (LearnSQL)](https://learnsql.com/blog/sql-basics-cheat-sheet/) — downloadable PDF covering SELECT, WHERE, JOINs, and aggregation with clear examples
- [DataCamp SQL Basics Cheat Sheet](https://www.datacamp.com/cheat-sheet/sql-basics-cheat-sheet) — quick reference for querying, filtering, and aggregating data

## Courses

| Course | Platform | Notes |
|---|---|---|
| [Introduction to SQL](https://www.datacamp.com/courses/introduction-to-sql) | DataCamp | 2 hours. Querying relational databases, filtering, and aggregating. Interactive, no setup required |
| [SQL for Data Science](https://www.coursera.org/learn/sql-for-data-science) | Coursera (UC Davis) | Beginner. SELECT, filtering, subqueries, and JOINs. Can be audited free |
| [Clinical Data Science Specialization](https://www.coursera.org/specializations/clinical-data-science) | Coursera (U. Colorado) | Six-course introduction to clinical data, including writing SQL queries and database joins on health data. Directly relevant to clinician-researchers |
