SELECT *
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;

SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Before 
EXPLAIN ANALYZE
SELECT *
FROM users u
JOIN bookings b ON u.id = b.user_id
WHERE u.email = 'john@example.com';

-- After
EXPLAIN ANALYZE
SELECT *
FROM users u
JOIN bookings b ON u.id = b.user_id
WHERE u.email = 'john@example.com';