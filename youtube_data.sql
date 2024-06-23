

-- users
INSERT INTO public.user_profile (id, first_name, last_name, email, gender, created_at)
VALUES
    (1, 'Musa', 'Ali', 'john.doe@example.com', 'MALE', now()),
    (2, 'Hauwa', 'Muhammad', 'jane.smith@example.com', 'FEMALE', now()),
    (3, 'Hassan', 'Nuhu', 'alice.johnson@example.com', 'FEMALE', now()),
    (4, 'Bob', 'Brown', 'bob.brown@example.com', 'MALE', now()),
    (5, 'Charlie', 'Davis', 'charlie.davis@example.com', 'MALE', now());

-- youtube accounts
INSERT INTO public.youtube_account (id, created_at)
VALUES
    (1, now()),
    (2, now()),
    (3, now()),
    (4, now());

-- youtube channels
INSERT INTO public.youtube_channel (id, youtube_account_id, channel_name, created_at)
VALUES
    (1, 1, 'TheNetNija', now()),
    (2, 2, 'TraversyMedia', now()),
    (3, 4, 'Mosh', now());

-- subscribers
INSERT INTO public.channel_subscriber (youtube_account_id, youtube_channel_id, created_at)
VALUES
    (1, 2, now()),
    (1, 3, now()),
    (4, 1, now()),
    (2, 1, now());


