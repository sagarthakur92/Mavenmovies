-- 2 -- We want to reward the user who has been around the longest, Find the 5 oldest users
 
SELECT * from users 
order by created_at asc limit 5;

-- 3--To target inactive users in an email ad campaign, find the users who have never posted a photo
 
SELECT username
FROM users
left JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4--Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?
 
SELECT username,photos.id,photos.image_url, COUNT(*) AS total
FROM photos INNER JOIN likes ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5--The investors want to know how many times does the average user post.
 
SELECT ROUND((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users),2) as average;

-- 6-- A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.
 
SELECT tag_name, COUNT(tag_name) AS total
FROM tags
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY  total DESC 
limit 5;
 
-- 7--To find out if there are bots, find users who have liked every single photo on the site
 
SELECT users.id,username, COUNT(users.id) As total_likes_by_user
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING total_likes_by_user = (SELECT COUNT(*) FROM photos);

-- 8--Find the users who have created instagramid in may and select top 5 newest joinees from it?
 
select * from users where month(created_at)=5 order by created_at desc limit 5;
 
-- 9-- Can you help me find the users whose name starts with c and ends with any number and have 
-- posted the photos as well as liked the photos?
 
select * from users where username rlike '^c' and username rlike '$';

-- 10--Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5

