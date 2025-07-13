-- Index on users.email for faster lookup (e.g., login)
CREATE INDEX idx_users_email ON users(email);

-- Index on bookings.user_id to speed up joins and aggregations
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id for join with properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.booking_date for date range queries
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Index on properties.name for search or ordering
CREATE INDEX idx_properties_name ON properties(name);
