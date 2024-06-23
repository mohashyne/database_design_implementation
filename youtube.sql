CREATE TABLE IF NOT EXISTS user_profile (
                                            id BIGSERIAL NOT NULL PRIMARY KEY,
                                            first_name TEXT NOT NULL,
                                            last_name TEXT NOT NULL,
                                            email TEXT UNIQUE NOT NULL,
                                            gender TEXT CHECK(gender IN ('MALE', 'FEMALE')),
                                            created_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE IF NOT EXISTS youtube_account(
                                              id BIGINT PRIMARY KEY REFERENCES user_profile(id),
                                              created_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE IF NOT EXISTS youtube_channel (
                                               id BIGSERIAL NOT NULL PRIMARY KEY,
                                               youtube_account_id BIGINT NOT NULL REFERENCES youtube_account(id),
                                               channel_name TEXT NOT NULL UNIQUE,
                                               created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

CREATE TABLE IF NOT EXISTS channel_subscriber (
                                                  youtube_account_id BIGINT REFERENCES youtube_account(id),
                                                  youtube_channel_id BIGINT REFERENCES youtube_channel(id),
                                                  created_at TIMESTAMP WITHOUT TIME ZONE,
-- composite keys : when two keys are used as primary key.
-- it means when a youtube account subscribes to a channel,
-- only once.
                                                  PRIMARY KEY (youtube_account_id, youtube_channel_id)
);
