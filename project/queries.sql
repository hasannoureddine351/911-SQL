-- Retrieve all calls with their details.
SELECT * FROM calls;

-- Count the number of calls for each reason.
SELECT reason,COUNT(*) as call_count FROM calls 
GROUP BY reason ;

-- Find the most common reasons for calls
SELECT reason,COUNT(*) as call_count FROM calls 
GROUP BY reason 
ORDER BY call_count DESC
LIMIT 1;

-- Retrieve calls within a specific time range.
SELECT timestamp,twp,addr,reason
FROM calls
WHERE timestamp BETWEEN '12/10/2015' AND '12/10/2016'
limit 100;


-- Get unique townships (twp) and the number of calls in each.
SELECT 
    twp,COUNT(*) as twp_calls FROM calls
GROUP BY 
    twp
ORDER BY
    twp_calls DESC
LIMIT 10;

-- Test the on_delete trigger
DELETE FROM calls_view WHERE id = 11;


-- Test on_insert trigger
INSERT INTO calls ("lat", "lng", "desc", "zip", "title", "reason", "twp", "addr", "timestamp")
VALUES 
    (37.7749, -122.4194, 'Test Description', 12345, 'Test Title', 'Emergency', 'Test Township', 'Test Address', CURRENT_TIMESTAMP);

