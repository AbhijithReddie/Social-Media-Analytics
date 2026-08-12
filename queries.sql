-- ==============================================================
-- SQL + GenAI Mini Project : Social Media Analytics
-- Dataset : Social_Media
-- Student Name : CH Sai Abhijith Reddy
-- ==============================================================

-- 🚀 SETUP INSTRUCTIONS (MUST DO FIRST)
-- ==============================================================
-- Before solving this project, make sure you create and load the dataset.
--
-- STEP 1: Open your SQL client (MySQL Workbench, DBeaver, or SQLite Studio).
-- STEP 2: Run the provided dataset file:
--         dataset.sql
--
-- This script will:
--   ✅ Create a new database named `Social_Media`
--   ✅ Create all 7 tables (users, posts, comments, likes, followers, hashtags, post_hashtags)
--   ✅ Insert ~7,000 synthetic rows for analysis
--
-- STEP 3: After successful execution, Your Code the database:
--         USE Social_Media;
--
-- STEP 4: Verify the tables:
--         SHOW TABLES;
--         Your Code COUNT(*) FROM users;
--         Your Code COUNT(*) FROM posts;
--
-- Once you confirm the data is loaded, you can proceed to attempt all project queries.
-- ==============================================================

USE Social_Media;

-- ==============================================================
-- Q1. Most Active Users (Posts + Comments)
-- ==============================================================
SELECT u.username,
       COUNT(DISTINCT p.post_id) + COUNT(DISTINCT c.comment_id) AS activity_score
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
LEFT JOIN comments c ON u.user_id = c.user_id
GROUP BY u.username
ORDER BY activity_score DESC
LIMIT 10;

-- Solution Summary --
-- Finds top 10 users ranked by combined posts and comments.


-- ==============================================================
-- Q2. Most Liked Posts and Creators
-- ==============================================================
SELECT p.post_id, u.username, COUNT(l.like_id) AS total_likes
FROM posts p
JOIN users u ON p.user_id = u.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
GROUP BY p.post_id, u.username
ORDER BY total_likes DESC
LIMIT 10;

-- Solution Summary --
-- Shows top 10 posts with most likes and their creators.


-- ==============================================================
-- Q3. Top Countries by Average Engagement
-- ==============================================================
SELECT u.country, AVG(likes_count) AS avg_likes
FROM (
    SELECT p.post_id, p.user_id, COUNT(l.like_id) AS likes_count
    FROM posts p
    LEFT JOIN likes l ON p.post_id = l.post_id
    GROUP BY p.post_id, p.user_id
) sub
JOIN users u ON sub.user_id = u.user_id
GROUP BY u.country
ORDER BY avg_likes DESC;

-- Solution Summary --
-- Ranks countries by average likes per post.


-- ==============================================================
-- Q4. Trending Hashtags (Used in >20 Posts)
-- ==============================================================
SELECT h.tag_name, COUNT(DISTINCT ph.post_id) AS post_count
FROM hashtags h
JOIN post_hashtags ph ON h.hashtag_id = ph.hashtag_id
GROUP BY h.tag_name
HAVING COUNT(DISTINCT ph.post_id) > 20
ORDER BY post_count DESC;

-- Solution Summary --
-- Lists hashtags appearing in more than 20 posts.


-- ==============================================================
-- Q5. Top Influencers (Users with Most Followers)
-- ==============================================================
SELECT u.username, COUNT(f.follower_user_id) AS follower_count
FROM users u
JOIN followers f ON u.user_id = f.user_id
GROUP BY u.username
ORDER BY follower_count DESC
LIMIT 10;

-- Solution Summary --
-- Finds users with maximum followers.


-- ==============================================================
-- Q6. Followers Who Never Interacted
-- ==============================================================
SELECT DISTINCT u.username
FROM users u
JOIN followers f ON u.user_id = f.follower_user_id
WHERE u.user_id NOT IN (
    SELECT user_id FROM likes
    UNION
    SELECT user_id FROM comments
);

-- Solution Summary --
-- Identifies users who follow others but never liked or commented.


-- ==============================================================
-- Q7. Hashtags with Highest Engagement
-- ==============================================================
SELECT h.tag_name,
       SUM(COALESCE(l.like_count,0) + COALESCE(c.comment_count,0)) AS engagement_score
FROM hashtags h
JOIN post_hashtags ph ON h.hashtag_id = ph.hashtag_id
JOIN posts p ON ph.post_id = p.post_id
LEFT JOIN (
    SELECT post_id, COUNT(*) AS like_count FROM likes GROUP BY post_id
) l ON p.post_id = l.post_id
LEFT JOIN (
    SELECT post_id, COUNT(*) AS comment_count FROM comments GROUP BY post_id
) c ON p.post_id = c.post_id
GROUP BY h.tag_name
ORDER BY engagement_score DESC;

-- Solution Summary --
-- Calculates engagement score (likes + comments) per hashtag.


-- ==============================================================
-- Q8. Busiest Posting Hours or Days
-- ==============================================================
-- By hour
SELECT HOUR(created_at) AS post_hour, COUNT(*) AS posts_count
FROM posts
GROUP BY HOUR(created_at)
ORDER BY posts_count DESC;

-- By weekday
SELECT DAYNAME(created_at) AS weekday, COUNT(*) AS posts_count
FROM posts
GROUP BY DAYNAME(created_at)
ORDER BY posts_count DESC;

-- Solution Summary --
-- Shows busiest posting hours and weekdays.


-- ==============================================================
-- Q9. Inactive Users
-- ==============================================================
SELECT u.username
FROM users u
WHERE u.user_id NOT IN (SELECT user_id FROM posts)
  AND u.user_id NOT IN (SELECT user_id FROM likes)
  AND u.user_id NOT IN (SELECT user_id FROM comments);

-- Solution Summary --
-- Finds users who never posted, liked, or commented.


-- ==============================================================
-- Q10. Top Countries with Most Influencers
-- ==============================================================
SELECT u.country, COUNT(*) AS influencer_count
FROM users u
JOIN (
    SELECT user_id, COUNT(follower_user_id) AS followers
    FROM followers
    GROUP BY user_id
    HAVING COUNT(follower_user_id) > 50  -- threshold for influencer
) inf ON u.user_id = inf.user_id
GROUP BY u.country
ORDER BY influencer_count DESC;

-- Solution Summary --
-- Identifies countries with the highest number of influencers.


-- ==============================================================
-- BONUS CHALLENGES
-- ==============================================================
-- 1. Engagement rate = (likes + comments) / posts
SELECT u.username,
       (COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id)) / 
       NULLIF(COUNT(DISTINCT p.post_id),0) AS engagement_rate
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY u.username
ORDER BY engagement_rate DESC;

-- 2. Mutual followers
SELECT f1.user_id AS userA, f1.follower_user_id AS userB
FROM followers f1
JOIN followers f2
  ON f1.user_id = f2.follower_user_id AND f1.follower_user_id = f2.user_id;

-- 3. Most used hashtags by top 5 influencers
SELECT h.tag_name, COUNT(*) AS usage_count
FROM hashtags h
JOIN post_hashtags ph ON h.hashtag_id = ph.hashtag_id
JOIN posts p ON ph.post_id = p.post_id
WHERE p.user_id IN (
    SELECT user_id
    FROM followers
    GROUP BY user_id
    ORDER BY COUNT(follower_user_id) DESC
    LIMIT 5
)
GROUP BY h.tag_name
ORDER BY usage_count DESC;

-- 4. Country-wise engagement leaderboard
SELECT u.country,
       SUM(COALESCE(l.like_count,0) + COALESCE(c.comment_count,0)) AS total_engagement
FROM users u
JOIN posts p ON u.user_id = p.user_id
LEFT JOIN (
    SELECT post_id, COUNT(*) AS like_count FROM likes GROUP BY post_id
) l ON p.post_id = l.post_id
LEFT JOIN (
    SELECT post_id, COUNT(*) AS comment_count FROM comments GROUP BY post_id
) c ON p.post_id = c.post_id
GROUP BY u.country
ORDER BY total_engagement DESC;


-- ==============================================================
-- REFLECTION
-- ==============================================================
-- 1. GenAI was most helpful in accelerating query generation. Instead of spending hours debugging joins and groupings,
--    I could quickly produce working SQL aligned with the schema and then refine it for accuracy and performance.
--
-- 2. Optimization lessons included:
--    • Using subqueries and CTEs to simplify complex aggregations.
--    • Applying COALESCE and NULLIF to handle missing values and avoid division errors.
--    • Leveraging GROUP BY with DISTINCT to ensure accurate counts.
--    • Recognizing when indexes on foreign keys (user_id, post_id) would improve query speed.
--
-- 3. Business insights gained:
--    • Identifying influencers by follower counts highlights potential marketing partners.
--    • Engagement analysis (likes + comments) reveals which hashtags and countries drive the most activity.
--    • Time‑based posting trends show when users are most active, useful for scheduling campaigns.
--    • Detecting inactive users or silent followers can inform re‑engagement strategies.
--
-- Overall, the project demonstrated how SQL + GenAI can combine technical efficiency with actionable social media insights.
-- ==============================================================

