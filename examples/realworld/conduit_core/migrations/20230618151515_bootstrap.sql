CREATE TABLE users (
    id UUID PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio VARCHAR(2048),
    image VARCHAR(2048),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE articles (
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) PRIMARY KEY,
    description VARCHAR(1024) NOT NULL,
    body TEXT NOT NULL,
    tag_list TEXT[] NOT NULL,
    user_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE favorites (
    user_id UUID NOT NULL,
    article_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (article_id) REFERENCES articles(slug) ON DELETE CASCADE,
    PRIMARY KEY (user_id, article_id)
);

CREATE TABLE followers (
   followed_id UUID NOT NULL,
   follower_id UUID NOT NULL,
   FOREIGN KEY (followed_id) REFERENCES users(id) ON DELETE CASCADE,
   FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
   PRIMARY KEY (followed_id, follower_id)
);

CREATE TABLE comments (
    id BIGSERIAL PRIMARY KEY,
    author_id UUID NOT NULL,
    article_id VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (article_id) REFERENCES articles(slug) ON DELETE CASCADE
);