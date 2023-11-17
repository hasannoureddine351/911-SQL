# Database Design Document

## Purpose
The database aims to store emergency call information, encompassing location coordinates, description, call reasons, timestamp, and additional context.

## Scope
The database covers:
- Storing emergency call information.
- Analyzing call reasons and patterns.
- Providing a historical record of calls.
- Supporting geographical analysis of call data.

## Entities

### Calls Table
- `id` (Primary Key): Unique identifier for each call.
- `lat`: Latitude of the call location.
- `lng`: Longitude of the call location.
- `desc`: Description of the call.
- `zip`: ZIP code of the call location.
- `title`: Title of the call.
- `reason`: Reason for the call.
- `timestamp`: Timestamp of the call.
- `twp`: Township associated with the call.
- `addr`: Address of the call location.

### Logs Table
- `call_id` (Foreign Key): Refers to the "id" column in the "calls" table.
- `action`: Describes the action performed (e.g., "inserted").
- The "Logs" table maintains a foreign key relationship with the "Calls" table, linking each log entry to a specific call.

## Optimizations
- Indexes: Create indexes on columns used in search conditions (e.g., reason, twp) to enhance query performance.
- Materialized Views: Consider creating materialized views, particularly for frequently queried data and aggregations.

## Queries
Retrieve all calls with their details.

Count the number of calls for each reason.

Find the most common reasons for calls

Retrieve calls within a specific time range.

Get unique townships (twp) and the number of calls in each.


