ALTER TABLE getall_resources
    ENGINE = MergeTree()
    ORDER BY (ClusterName, EventTime)
    TTL EventTime + INTERVAL 30 DAY
    SETTINGS index_granularity = 8192;