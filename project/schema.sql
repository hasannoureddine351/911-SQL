CREATE TABLE "calls" (
    "id" INT,
    "lat" DECIMAL NOT NULL,
    "lng" DECIMAL NOT NULL,
    "desc" TEXT NOT NULL,
    "zip" INT NOT NULL,
    "title" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "timestamp" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "twp" TEXT NOT NULL,
    "addr" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "logs"(
    "call_id" INT NOT NULL,
    "action" TEXT NOT NULL,
    FOREIGN KEY (call_id) REFERENCES calls(id)

);




CREATE TRIGGER calls_on_insert
AFTER INSERT ON calls
FOR EACH ROW
BEGIN
    INSERT INTO logs (call_id, action)
    VALUES (NEW.id, 'inserted');
END;


CREATE VIEW calls_view AS
SELECT id, lat, lng, zip, title, reason, timestamp, twp, addr
FROM calls;


CREATE TRIGGER calls_view_delete
INSTEAD OF DELETE ON calls_view
FOR EACH ROW
BEGIN
    UPDATE calls SET deleted = 1 WHERE id = OLD.id;
    INSERT INTO logs (call_id, action) VALUES (OLD.id, 'deleted');
END;

CREATE INDEX idx_calls_timestamp ON calls(timestamp);