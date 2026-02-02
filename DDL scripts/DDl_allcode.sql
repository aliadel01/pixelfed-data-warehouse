CREATE TABLE "fact_sessions" (
    "session_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "profile_sk" bigint NOT NULL,
    "device_sk" bigint NOT NULL,
    "date_sk" int NOT NULL,
    "last_activity" int,
    "created_at" datetime,
    CONSTRAINT "pk_fact_sessions_session_sk" PRIMARY KEY ("session_sk")
);

CREATE TABLE "dim_media" (
    "media_sk" bigint,
    "media_id" bigint NOT NULL UNIQUE,
    "profile_sk" bigint,
    "is_nsfw" tinyint,
    "remote_media" tinyint,
    "original_sha256" varchar(500),
    "optimized_sha256" varchar(500),
    "media_path" varchar(500),
    "thumbnail_path" varchar(500),
    "cdn_url" varchar(500),
    "optimized_url" varchar(500),
    "thumbnail_url" varchar(500),
    "remote_url" varchar(500),
    "caption" varchar(500),
    "hls_path" varchar(500),
    "order" tinyint,
    "mime" varchar(500),
    "size" bigint,
    "orientation" varchar(500),
    "filter_name" varchar(500),
    "filter_class" varchar(500),
    "license" varchar(500),
    "processed_at" datetime,
    "hls_transcoded_at" datetime,
    "created_at" datetime,
    "deleted_at" datetime,
    "key" varchar(500),
    "metadata" json,
    "version" tinyint,
    "effective_from" datetime,
    "effective_to" datetime,
    "is_current" tinyint,
    CONSTRAINT "pk_dim_media_media_sk" PRIMARY KEY ("media_sk")
);

CREATE TABLE "fact_bookmarks" (
    "fact_bookmarks_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "status_sk" bigint NOT NULL,
    "profile_sk" bigint NOT NULL,
    "created_at" datetime,
    CONSTRAINT "pk_fact_bookmarks_fact_bookmarks_sk" PRIMARY KEY ("fact_bookmarks_sk")
);

CREATE TABLE "fact_status_media" (
    "fact_status_media_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "status_sk" bigint NOT NULL,
    "media_sk" bigint NOT NULL,
    "created_at" datetime,
    CONSTRAINT "pk_fact_status_media_fact_status_media_sk" PRIMARY KEY ("fact_status_media_sk")
);

CREATE TABLE "dim_device" (
    "device_sk" bigint,
    "ip_address" varchar(100),
    "user_agent" varchar(500),
    "device_type" varchar(100),
    "created_at" datetime,
    CONSTRAINT "pk_dim_device_device_sk" PRIMARY KEY ("device_sk")
);

CREATE TABLE "fact_likes" (
    "fact_like_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "profile_sk" bigint NOT NULL,
    "status_sk" bigint NOT NULL,
    "flagged" tinyint,
    "created_at" datetime,
    "deleted_at" datetime,
    "is_deleted" tinyint,
    CONSTRAINT "pk_fact_likes_fact_like_sk" PRIMARY KEY ("fact_like_sk")
);

CREATE TABLE "dim_hashtags" (
    "hashtag_sk" bigint,
    "hashtag_id" bigint NOT NULL UNIQUE,
    "name" varchar(500) UNIQUE,
    "slug" varchar(500) UNIQUE,
    "is_nsfw" tinyint,
    "is_banned" tinyint,
    "created_at" datetime,
    "updated_at" datetime,
    CONSTRAINT "pk_dim_hashtags_hashtag_sk" PRIMARY KEY ("hashtag_sk")
);

CREATE TABLE "dim_place" (
    "place_sk" bigint,
    "place_id" bigint,
    "slug" varchar(500),
    "name" varchar(500),
    "country" varchar(500),
    "aliases" json,
    "lat" decimal,
    "long" decimal,
    "created_at" datetime,
    "updated_at" datetime,
    CONSTRAINT "pk_dim_place_place_sk" PRIMARY KEY ("place_sk")
);

CREATE TABLE "fact_comments" (
    "fact_comment_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "profile_sk" bigint NOT NULL,
    "status_sk" bigint NOT NULL,
    "comment" text,
    "rendered" text,
    "entities" json,
    "is_remote" tinyint,
    "rendered_at" datetime,
    "created_at" datetime,
    CONSTRAINT "pk_fact_comments_fact_comment_sk" PRIMARY KEY ("fact_comment_sk")
);

CREATE TABLE "fact_user_filters" (
    "fact_filter_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "profile_sk" bigint NOT NULL,
    "filter_type" varchar(100),
    "filterable_type" varchar(100),
    "filterable_id" bigint,
    "date_sk" int NOT NULL,
    "created_at" datetime,
    CONSTRAINT "pk_fact_user_filters_fact_filter_sk" PRIMARY KEY ("fact_filter_sk")
);

CREATE TABLE "fact_auth_events" (
    "auth_event_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "profile_sk" bigint NOT NULL,
    "oauth_client_sk" bigint NOT NULL,
    "date_sk" int NOT NULL,
    "event_type" varchar(50),
    "success_flag" tinyint,
    "created_at" datetime,
    CONSTRAINT "pk_fact_auth_events_auth_event_sk" PRIMARY KEY ("auth_event_sk")
);

CREATE TABLE "fact_status_engagement_daily" (
    "fact_status_engagement_daily_sk" bigint,
    "status_sk" bigint NOT NULL,
    "profile_sk" bigint NOT NULL,
    "date_sk" int NOT NULL,
    "likes_count" bigint,
    "reblogs_count" bigint,
    "reply_count" int,
    "bookmarks_count" int,
    "comments_count" int,
    "created_at" datetime,
    CONSTRAINT "pk_fact_status_engagement_daily_fact_status_engagement_daily_sk" PRIMARY KEY ("fact_status_engagement_daily_sk")
);

CREATE TABLE "dim_profile" (
    "profile_sk" bigint,
    "profile_id" bigint NOT NULL,
    "user_id" bigint,
    "username" varchar(500),
    "name" varchar(500),
    "domain" varchar(500),
    "bio" text,
    "location" varchar(500),
    "website" varchar(500),
    "avatar_url" varchar(500),
    "is_private" tinyint,
    "unlisted" tinyint,
    "cw" tinyint,
    "no_autolink" tinyint,
    "is_suggestable" tinyint,
    "webfinger" varchar(500),
    "role" varchar(50),
    "crawlable" tinyint,
    "show_guests" tinyint,
    "show_discover" tinyint,
    "public_dm" tinyint,
    "hide_cw_search" tinyint,
    "hide_blocked_search" tinyint,
    "always_show_cw" tinyint,
    "compose_media_descriptions" tinyint,
    "reduce_motion" tinyint,
    "optimize_screen_reader" tinyint,
    "high_contrast_mode" tinyint,
    "video_autoplay" tinyint,
    "send_email_new_follower" tinyint,
    "send_email_new_follower_request" tinyint,
    "send_email_on_share" tinyint,
    "send_email_on_like" tinyint,
    "send_email_on_mention" tinyint,
    "show_profile_followers" tinyint,
    "show_profile_follower_count" tinyint,
    "show_profile_following" tinyint,
    "show_profile_following_count" tinyint,
    "effective_from" datetime,
    "effective_to" datetime,
    "is_current" tinyint,
    "created_at" datetime,
    CONSTRAINT "pk_dim_profile_profile_sk" PRIMARY KEY ("profile_sk")
);

CREATE TABLE "dim_action" (
    "action_sk" bigint,
    "action_name" varchar(100) UNIQUE,
    "action_category" varchar(100),
    CONSTRAINT "pk_dim_action_action_sk" PRIMARY KEY ("action_sk")
);

CREATE TABLE "dim_status" (
    "status_sk" bigint,
    "status_id" bigint NOT NULL UNIQUE,
    "profile_sk" bigint NOT NULL,
    "place_sk" bigint,
    "conversation_id" bigint,
    "in_reply_to_status_id" bigint,
    "reblog_of_status_id" bigint,
    "uri" varchar(500),
    "url" varchar(500),
    "object_url" varchar(500),
    "caption" text,
    "rendered" text,
    "cw_summary" varchar(500),
    "entities" json,
    "type" varchar(50),
    "language" varchar(10),
    "is_nsfw" tinyint,
    "visibility" varchar(50),
    "scope" varchar(50),
    "reply" tinyint,
    "comments_disabled" tinyint,
    "local" tinyint,
    "created_at" datetime,
    "deleted_at" datetime,
    "is_deleted" tinyint,
    "effective_from" datetime,
    "effective_to" datetime,
    "is_current" tinyint,
    CONSTRAINT "pk_dim_status_status_sk" PRIMARY KEY ("status_sk")
);

CREATE TABLE "fact_activities" (
    "activity_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "from_profile_sk" bigint NOT NULL,
    "to_profile_sk" bigint NOT NULL,
    "object_type" varchar(500),
    "date_sk" int NOT NULL,
    "processed_at" datetime,
    "created_at" datetime,
    CONSTRAINT "pk_fact_activities_activity_sk" PRIMARY KEY ("activity_sk")
);

CREATE TABLE "dim_date" (
    "date_sk" int,
    "date" date NOT NULL UNIQUE,
    "day" int,
    "month" int,
    "year" int,
    "quarter" int,
    "day_of_week" int,
    "day_name" varchar(20),
    "month_name" varchar(20),
    "is_weekend" tinyint,
    "is_holiday" tinyint,
    CONSTRAINT "pk_dim_date_date_sk" PRIMARY KEY ("date_sk")
);

CREATE TABLE "fact_profile_daily_snapshot" (
    "fact_profile_daily_snapshot_sk" bigint,
    "profile_sk" bigint NOT NULL,
    "date_sk" int NOT NULL,
    "status_count" int,
    "followers_count" int,
    "following_count" int,
    "likes_given_count" int,
    "likes_received_count" int,
    "reblogs_given_count" int,
    "reblogs_received_count" int,
    "comments_count" int,
    "comments_received_count" int,
    "stories_count" int,
    "story_views_count" int,
    "bookmarks_count" int,
    "active_today_flag" tinyint,
    "deleted_flag" tinyint,
    "created_at" datetime,
    CONSTRAINT "pk_fact_profile_daily_snapshot_fact_profile_daily_snapshot_sk" PRIMARY KEY ("fact_profile_daily_snapshot_sk")
);

CREATE TABLE "fact_status_hashtags" (
    "fact_status_hashtags_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "status_sk" bigint NOT NULL,
    "hashtag_sk" bigint NOT NULL,
    "profile_sk" bigint NOT NULL,
    "status_visibility" varchar(500),
    "created_at" datetime,
    CONSTRAINT "pk_fact_status_hashtags_fact_status_hashtags_sk" PRIMARY KEY ("fact_status_hashtags_sk")
);

CREATE TABLE "fact_user_devices" (
    "fact_user_devices_sk" bigint,
    "profile_sk" bigint NOT NULL,
    "device_sk" bigint NOT NULL,
    "trusted" tinyint,
    "last_active_date_sk" int NOT NULL,
    "created_at" datetime,
    "updated_at" datetime,
    CONSTRAINT "pk_fact_user_devices_fact_user_devices_sk" PRIMARY KEY ("fact_user_devices_sk")
);

CREATE TABLE "fact_audit_events" (
    "audit_event_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "actor_profile_sk" bigint NOT NULL,
    "target_object" varchar(500),
    "action_sk" bigint NOT NULL,
    "date_sk" int NOT NULL,
    "event_source" varchar(50),
    "access_level" varchar(50),
    "created_at" datetime,
    CONSTRAINT "pk_fact_audit_events_audit_event_sk" PRIMARY KEY ("audit_event_sk")
);

CREATE TABLE "dim_oauth_client" (
    "oauth_client_sk" bigint,
    "client_id" bigint,
    "name" varchar(500),
    "client_type" varchar(50),
    "personal_access_client" tinyint,
    "password_client" tinyint,
    "revoked" tinyint,
    "created_at" datetime,
    CONSTRAINT "pk_dim_oauth_client_oauth_client_sk" PRIMARY KEY ("oauth_client_sk")
);

CREATE TABLE "fact_user_invites" (
    "fact_user_invites_sk" bigint,
    "id" bigint NOT NULL UNIQUE,
    "from_profile_sk" bigint NOT NULL,
    "to_profile_sk" bigint,
    "email" varchar(500),
    "message" text,
    "key" varchar(500),
    "token" varchar(500),
    "valid_until" datetime,
    "used_at" datetime,
    "created_at" datetime,
    "updated_at" datetime,
    CONSTRAINT "pk_fact_user_invites_fact_user_invites_sk" PRIMARY KEY ("fact_user_invites_sk")
);

-- Foreign key constraints
-- Schema: public
ALTER TABLE "fact_audit_events" ADD CONSTRAINT "fk_fact_audit_events_action_sk_dim_action_action_sk" FOREIGN KEY("action_sk") REFERENCES "dim_action"("action_sk");
ALTER TABLE "fact_sessions" ADD CONSTRAINT "fk_fact_sessions_device_sk_dim_device_device_sk" FOREIGN KEY("device_sk") REFERENCES "dim_device"("device_sk");
ALTER TABLE "fact_user_devices" ADD CONSTRAINT "fk_fact_user_devices_device_sk_dim_device_device_sk" FOREIGN KEY("device_sk") REFERENCES "dim_device"("device_sk");
ALTER TABLE "fact_status_hashtags" ADD CONSTRAINT "fk_fact_status_hashtags_hashtag_sk_dim_hashtags_hashtag_sk" FOREIGN KEY("hashtag_sk") REFERENCES "dim_hashtags"("hashtag_sk");
ALTER TABLE "fact_status_media" ADD CONSTRAINT "fk_fact_status_media_media_sk_dim_media_media_sk" FOREIGN KEY("media_sk") REFERENCES "dim_media"("media_sk");
ALTER TABLE "fact_auth_events" ADD CONSTRAINT "fk_fact_auth_events_oauth_client_sk_dim_oauth_client_oauth_c" FOREIGN KEY("oauth_client_sk") REFERENCES "dim_oauth_client"("oauth_client_sk");
ALTER TABLE "dim_status" ADD CONSTRAINT "fk_dim_status_place_sk_dim_place_place_sk" FOREIGN KEY("place_sk") REFERENCES "dim_place"("place_sk");
ALTER TABLE "dim_media" ADD CONSTRAINT "fk_dim_media_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "dim_status" ADD CONSTRAINT "fk_dim_status_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_activities" ADD CONSTRAINT "fk_fact_activities_from_profile_sk_dim_profile_profile_sk" FOREIGN KEY("from_profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_activities" ADD CONSTRAINT "fk_fact_activities_to_profile_sk_dim_profile_profile_sk" FOREIGN KEY("to_profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_audit_events" ADD CONSTRAINT "fk_fact_audit_events_actor_profile_sk_dim_profile_profile_sk" FOREIGN KEY("actor_profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_auth_events" ADD CONSTRAINT "fk_fact_auth_events_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_bookmarks" ADD CONSTRAINT "fk_fact_bookmarks_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_comments" ADD CONSTRAINT "fk_fact_comments_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_likes" ADD CONSTRAINT "fk_fact_likes_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_profile_daily_snapshot" ADD CONSTRAINT "fk_fact_profile_daily_snapshot_profile_sk_dim_profile_profil" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_sessions" ADD CONSTRAINT "fk_fact_sessions_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_status_engagement_daily" ADD CONSTRAINT "fk_fact_status_engagement_daily_profile_sk_dim_profile_profi" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_status_hashtags" ADD CONSTRAINT "fk_fact_status_hashtags_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_user_devices" ADD CONSTRAINT "fk_fact_user_devices_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_user_filters" ADD CONSTRAINT "fk_fact_user_filters_profile_sk_dim_profile_profile_sk" FOREIGN KEY("profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_user_invites" ADD CONSTRAINT "fk_fact_user_invites_from_profile_sk_dim_profile_profile_sk" FOREIGN KEY("from_profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_user_invites" ADD CONSTRAINT "fk_fact_user_invites_to_profile_sk_dim_profile_profile_sk" FOREIGN KEY("to_profile_sk") REFERENCES "dim_profile"("profile_sk");
ALTER TABLE "fact_bookmarks" ADD CONSTRAINT "fk_fact_bookmarks_status_sk_dim_status_status_sk" FOREIGN KEY("status_sk") REFERENCES "dim_status"("status_sk");
ALTER TABLE "fact_comments" ADD CONSTRAINT "fk_fact_comments_status_sk_dim_status_status_sk" FOREIGN KEY("status_sk") REFERENCES "dim_status"("status_sk");
ALTER TABLE "fact_likes" ADD CONSTRAINT "fk_fact_likes_status_sk_dim_status_status_sk" FOREIGN KEY("status_sk") REFERENCES "dim_status"("status_sk");
ALTER TABLE "fact_status_engagement_daily" ADD CONSTRAINT "fk_fact_status_engagement_daily_status_sk_dim_status_status_" FOREIGN KEY("status_sk") REFERENCES "dim_status"("status_sk");
ALTER TABLE "fact_status_hashtags" ADD CONSTRAINT "fk_fact_status_hashtags_status_sk_dim_status_status_sk" FOREIGN KEY("status_sk") REFERENCES "dim_status"("status_sk");
ALTER TABLE "fact_status_media" ADD CONSTRAINT "fk_fact_status_media_status_sk_dim_status_status_sk" FOREIGN KEY("status_sk") REFERENCES "dim_status"("status_sk");