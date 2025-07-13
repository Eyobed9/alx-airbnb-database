SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;


SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;
