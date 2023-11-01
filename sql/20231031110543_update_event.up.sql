CREATE TABLE IF NOT EXISTS new_events (
    ClusterName String,
    Id          String,
    EventTime   DateTime('UTC'),
    OpType      String,
    Name        String,
    Namespace   String,
    Kind        String,
    Message     String,
    Reason      String,
    Host        String,
    Event       String,
    FirstTime   String,
    LastTime    String
) ENGINE = MergeTree()
    ORDER BY (ClusterName, EventTime)
    TTL EventTime + INTERVAL 10 MINUTE
    SETTINGS index_granularity = 8192;

ALTER TABLE new_events RENAME TO events;
