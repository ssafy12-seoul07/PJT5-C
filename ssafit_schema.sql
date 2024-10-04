CREATE TABLE `User` (
    `user_id` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `username` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE COMMENT 'UNIQUE',
    `password` VARCHAR(255) NOT NULL,
    `datetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`)
);

CREATE TABLE `Video` (
    `video_id` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `title` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `view_count` INT NOT NULL DEFAULT 0,
    `category` VARCHAR(50) NULL,
    PRIMARY KEY (`video_id`)
);

CREATE TABLE `Comment` (
    `comment_id` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `user_id` INT NOT NULL COMMENT 'FK',
    `video_id` INT NOT NULL COMMENT 'FK',
    `title` VARCHAR(100) NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`comment_id`),
    FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`),
    FOREIGN KEY (`video_id`) REFERENCES `Video`(`video_id`)
);

CREATE TABLE `FavoriteVideo` (
    `favorite_id` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `video_id` INT NOT NULL COMMENT 'FK',
    `user_id` INT NOT NULL COMMENT 'FK',
    PRIMARY KEY (`favorite_id`),
    FOREIGN KEY (`video_id`) REFERENCES `Video`(`video_id`),
    FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`)
);

CREATE TABLE `Follow` (
    `followrelationship_id` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `follower_id` INT NOT NULL COMMENT 'FK',
    `following_id` INT NOT NULL COMMENT 'FK',
    PRIMARY KEY (`followrelationship_id`),
    FOREIGN KEY (`follower_id`) REFERENCES `User`(`user_id`),
    FOREIGN KEY (`following_id`) REFERENCES `User`(`user_id`)
);
