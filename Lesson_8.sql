/* Задачи необходимо решить с использованием объединения таблиц (JOIN)*/

USE vk;

/* Задание 1: Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).*/

SELECT from_user_id,
	CONCAT(users.firstname, ' ', users.lastname) AS `friend's name`,
	COUNT(*) AS `total messages`
FROM messages
JOIN users ON users.id = messages.from_user_id
WHERE TO_user_id = 3
GROUP BY from_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

/* Задание 2: Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.*/

SELECT COUNT(*) AS countlikes
FROM likes 
JOIN media  ON likes.media_id = media.id
JOIN profiles  ON profiles.user_id = media.user_id
WHERE  YEAR(CURDATE()) - YEAR(birthday) < 10;

/* Задание 3: Определить кто больше поставил лайков (всего): мужчины или женщины */

SELECT COUNT(*) AS likes, gender 
FROM likes
JOIN profiles ON likes.user_id = profiles.user_id 
GROUP BY gender;
