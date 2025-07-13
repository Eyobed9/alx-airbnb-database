✅ Step 1: Identify High-Usage Columns
Based on common SQL patterns (WHERE, JOIN, ORDER BY), the high-usage columns are:

🔹 In users table:
id → used in JOIN with bookings.

email → commonly queried (e.g., login).

🔹 In bookings table:
user_id → used in JOIN and GROUP BY.

property_id → used in JOIN and aggregation.

booking_date → often used in ORDER BY or date filters.

🔹 In properties table:
id → used in JOIN.

name → possibly searched or ordered by.


✅ Step 3: Measure Query Performance with EXPLAIN or ANALYZE
Example 1: Before Index
```sql
EXPLAIN ANALYZE
SELECT *
FROM users u
JOIN bookings b ON u.id = b.user_id
WHERE u.email = 'john@example.com';
```
❌ Likely full table scan on users if no index on email.

Example 2: After Index
After creating the index on users(email), rerun:

``` sql
EXPLAIN ANALYZE
SELECT *
FROM users u
JOIN bookings b ON u.id = b.user_id
WHERE u.email = 'john@example.com';
```
✅ The output should now show Index Scan or Index Seek for users.email.