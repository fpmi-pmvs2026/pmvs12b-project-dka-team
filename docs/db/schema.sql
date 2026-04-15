PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS subscriptions (
    topic TEXT NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS articles (
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    imageUrl TEXT,
    sourceName TEXT NOT NULL,
    publishedAt INTEGER NOT NULL,
    url TEXT NOT NULL,
    topic TEXT NOT NULL,
    PRIMARY KEY (url, topic),
    FOREIGN KEY (topic)
        REFERENCES subscriptions(topic)
        ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS index_articles_topic
ON articles(topic);
