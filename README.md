# Social Media Analytics — SQL + Generative AI

> **Actionable Insights from Social Data Using MySQL and Generative AI**

## 1. Project Overview

Social media platforms generate massive volumes of activity data every second. This data is fragmented across multiple tables and interactions, making it difficult to connect the complete user journey.

Without a unified view of social media activity, it is challenging to understand:

* What drives user engagement
* Which content performs best
* When audiences are most active
* Who the top creators and influencers are
* Which hashtags are driving content discovery

This project analyzes a structured social media database using **MySQL** and **Generative AI** to transform raw social media activity into actionable insights for content strategy, timing decisions, audience understanding, and marketing optimization.

The project was developed as a **SQL + Generative AI Mini Project**.

---

## 2. Problem Statement

The core objective of this project is to analyze interconnected social media activity stored across multiple relational tables and derive meaningful business insights from the data.

The project connects users, posts, likes, comments, followers, and hashtags to provide a unified analytical view of social media activity.

### Why This Matters

#### Identify Influencers

Identify top creators and users with significant follower reach.

#### Optimize Timing

Identify peak posting hours and days to support smarter content scheduling.

#### Targeted Marketing

Understand regional and behavioral patterns to support data-driven marketing strategies.

---

## 3. Project Objectives

The primary objectives of this project are to:

* Analyze user activity and behavior
* Identify highly active and inactive users
* Analyze post engagement using likes and comments
* Identify the most engaging content
* Analyze engagement patterns across countries
* Identify trending hashtags
* Identify top influencers based on follower counts
* Determine peak posting hours and days
* Convert raw relational data into actionable business insights
* Demonstrate the use of Generative AI as an assistant for SQL development

---

## 4. Dataset and Database Structure

The project uses a MySQL database named `Social_Media`.

The database consists of the following core tables:

| Table           | Description                                     |
| --------------- | ----------------------------------------------- |
| `users`         | Stores user-related information                 |
| `posts`         | Stores posts created by users                   |
| `comments`      | Stores comment activity on posts                |
| `likes`         | Stores like interactions on posts               |
| `followers`     | Represents follower relationships between users |
| `hashtags`      | Stores hashtags used across the platform        |
| `post_hashtags` | Maps posts to their associated hashtags         |

The relational structure allows different types of user activity to be connected and analyzed using SQL.

---

## 5. Project Approach and Methodology

The project follows a structured analytics workflow.

### Step 1: Understand the Database Schema

* Tables and their purposes
* Primary and foreign key relationships
* Relationships between users and activities
* Relationships between posts and hashtags

### Step 2: Define Analytical Questions

* User activity
* Engagement
* Hashtag performance
* Influencer activity
* Posting behavior

### Step 3: Generate SQL Queries

* Joins
* Aggregations
* Filtering
* Grouping
* Common Table Expressions
* Relational operations

### Step 4: Use Generative AI

Generative AI was used as an assistance layer for:

* Understanding the dataset
* Generating SQL query approaches
* Translating analytical questions into SQL
* Exploring alternative query solutions
* Refining queries
* Improving query logic

Generative AI was used as a productivity tool, not a replacement for SQL knowledge.

### Step 5: Human Validation

All queries were:

* Reviewed
* Refined
* Executed
* Validated against the database

### Overall Workflow

```text
Schema Input
     ↓
Understand Dataset
     ↓
Define Analytical Questions
     ↓
Generate SQL
     ↓
Human Validation & Refinement
     ↓
Execute Queries
     ↓
Analyze Results
     ↓
Derive Business Insights
```

---

## 6. Technology Stack

### Database

* MySQL

### Query Language

* SQL

### AI Assistance

* Generative AI

### Core Capabilities

* Relational database querying
* Multi-table data analysis
* SQL query generation
* Data aggregation
* Analytical query development

---

## 7. SQL Concepts Implemented

### JOINs

Used to combine data across multiple tables:

* `JOIN`
* `LEFT JOIN`
* Self JOIN

### GROUP BY

Used for aggregation:

* Active users
* Engagement by country
* Hashtag usage
* Influencer ranking
* Time-based activity

### Common Table Expressions (CTEs)

Used to structure complex queries into readable blocks.

### Aggregate Functions

* `COUNT()`
* `SUM()`
* `AVG()`

### NULLIF

Used to prevent division errors and handle zero values safely.

---

## 8. Key Analysis Areas

### 8.1 User Analytics

* Top users
* Inactive users
* User behavior patterns

### 8.2 Engagement Analytics

* Most liked posts
* Engagement by country
* High-performing content

### 8.3 Hashtag Analytics

* Trending hashtags
* Frequently used hashtags
* Content discovery patterns

### 8.4 Influencer Analytics

* Top influencers
* High follower count users
* Reach estimation

### 8.5 Behavioral Analytics

* Peak posting hours
* Peak posting days
* Activity patterns

---

## 9. Key Insights and Business Impact

### Influencer Analysis

Identifies high-reach users.

**Impact:** Useful for collaborations and marketing campaigns.

### Regional Trends

Shows engagement differences across locations.

**Impact:** Enables targeted marketing strategies.

### Hashtag Trends

Identifies trending topics.

**Impact:** Improves content visibility strategy.

### Inactive Users

Detects low-engagement users.

**Impact:** Helps design re-engagement campaigns.

### Posting Time

Identifies peak activity periods.

**Impact:** Improves content scheduling strategy.

---

## 10. Implementation

The project is implemented using SQL scripts included in the repository.

### Running the Project

1. Install MySQL
2. Clone the repository
3. Open SQL files
4. Execute schema setup
5. Load dataset
6. Run queries
7. Analyze results

### Database Initialization

```sql
CREATE DATABASE IF NOT EXISTS Social_Media;

USE Social_Media;
```

---

## 11. Challenges Faced

### Complex Relationships

Multiple interconnected tables required careful join handling.

### Zero Engagement Data

Required special handling to avoid incorrect filtering.

---

## 12. Key Learnings

### User Behavior Analysis

Social data reveals strong behavioral patterns.

### Engagement Importance

Likes, comments, and followers are key performance indicators.

### Influencer Impact

High-follower users significantly influence visibility.

### SQL + AI Synergy

Generative AI accelerates query creation, but SQL understanding is essential for validation.

---

## 13. Future Scope

### Interactive Dashboard

* User activity visualization
* Engagement tracking
* Influencer dashboards

### Advanced Metrics

* Deeper engagement KPIs
* Content performance scoring

### Time-Based Analysis

* Long-term trend tracking
* Seasonal behavior analysis

### Predictive AI

* Engagement prediction
* Content recommendation
* Hashtag suggestion
* Optimal posting time prediction

---

## 14. Repository Structure

```text
Social-Media-Analytics/
│
├── README.md
├── dataset.sql
└── queries.sql
```

* `README.md` → Project documentation
* `dataset.sql` → Database schema + data
* `queries.sql` → Analytical SQL queries

---

## 15. Project Type

| Category              | Details                |
| --------------------- | ---------------------- |
| Domain                | Social Media Analytics |
| Database              | MySQL                  |
| Primary Technology    | SQL                    |
| Supporting Technology | Generative AI          |
| Project Type          | Mini Project           |

---

## 16. Author

**CH Sai Abhijith Reddy**

---

## 17. Conclusion

This project demonstrates how SQL combined with Generative AI can transform raw social media data into meaningful business insights.

It enables analysis of:

* User behavior
* Engagement patterns
* Influencer impact
* Hashtag trends
* Posting behavior

The workflow bridges structured database querying with AI-assisted development, making analytics faster, scalable, and more insightful.

Future enhancements can extend this into dashboards, predictive models, and real-time analytics systems.
