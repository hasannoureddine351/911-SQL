#Database Design Document
###Purpose
The purpose of this database is to store information related to emergency calls. It captures details such as location coordinates, description, reason for the call, timestamp, and additional contextual information.

###Scope
The scope of the database includes:

-Storing emergency call information.
-Analyzing call reasons and patterns.
-Providing a historical record of calls.
-Supporting geographical analysis of call data.

###Entities

####Calls Table
-id (Primary Key): Unique identifier for each call.
-lat: Latitude of the call location.
-lng: Longitude of the call location.
-desc: Description of the call.
-zip: ZIP code of the call location.
-title: Title of the call.
-reason: Reason for the call.
-timestamp: Timestamp of the call.
-twp: Township associated with the call.
-addr: Address of the call location.

####Logs Table
-call_id (Foreign Key): References the "id" column in the "calls" table.
-action: Describes the action performed (e.g."inserted").
-The "Logs" table has a foreign key relationship with-the "Calls" table, linking each log entry to a specific call.

###Optimizations
-Indexes: Create indexes on columns frequently used in search conditions (reason, twp, etc.) to improve query performance.

-Materialized Views: Consider creating materialized views for frequently queried data, especially aggregations.
Queries
Retrieve all calls with their details:
