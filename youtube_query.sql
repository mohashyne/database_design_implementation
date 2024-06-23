SELECT * FROM user_profile;
SELECT * FROM youtube_account;
SELECT * FROM youtube_channel;
SELECT * FROM channel_subscriber;

SELECT * FROM user_profile
JOIN public.youtube_account ya on user_profile.id = ya.id
JOIN public.channel_subscriber cs on ya.id = cs.youtube_account_id
JOIN public.youtube_channel yc on cs.youtube_channel_id = yc.id;