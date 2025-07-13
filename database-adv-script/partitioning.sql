-- performance.sql
SELECT 
    b.id AS booking_id,
    b.booking_date,
    
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.method

FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id;


EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id;


-- Add these if they don't exist
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_payment_id ON bookings(payment_id);



SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id;


-- If payments are sometimes not recorded, avoid blocking the booking row
SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.payment_id = pay.id;
