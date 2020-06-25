/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  xiangmacbook
 * Created: 2019-3-19
 */

use world_chatDB;

CREATE TABLE `user` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'primary key, user id',
  `email` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'email',
  `password` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'password',
  `userName` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'user name',
  `profile_pic` VARCHAR(164) DEFAULT '' COMMENT 'profile picture path',
  `status` TINYINT(4) DEFAULT 0 COMMENT 'Develop/Normal user 1:Normal User 2:Developer',
  `language` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'language',  
  `country` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'country',
  `sex` VARCHAR(64) NOT NULL DEFAULT '1' COMMENT '1 for male, 0 for female',  
  `age` BIGINT(20) NOT NULL DEFAULT '1' COMMENT 'age',   
    
  PRIMARY KEY (`id`),
  UNIQUE `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user table';

CREATE TABLE `chat_list` (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'primary key, user id',
  `userName` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'user name',
  `profile_pic` VARCHAR(164) DEFAULT '' COMMENT 'profile picture path',
  `language` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'language',  
  `country` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'country',
  `sex` VARCHAR(64) NOT NULL DEFAULT '1' COMMENT '1 for male, 0 for female',  
  `age` BIGINT(20) NOT NULL DEFAULT '1' COMMENT 'age',   
  `timestamp` BIGINT(20) NOT NULL,
  UNIQUE `id` (`id`),
  FOREIGN KEY (id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='chat list table';

CREATE TABLE `friend_list` (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'user id',
  `fid` BIGINT(20) UNSIGNED NOT NULL COMMENT 'users friends id',
  `unread` BIGINT(20) UNSIGNED,   
  `userName` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'friends user name',
  `profile_pic` VARCHAR(164) DEFAULT '' COMMENT 'profile picture path',
  `language` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'language',
  FOREIGN KEY (id) REFERENCES user(id),
  FOREIGN KEY (fid) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='friend list table';

CREATE TABLE `chat_history` (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'user id',
  `to_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'users friends id',
  `message` VARCHAR(200) DEFAULT '' COMMENT 'message',
  `Millis` BIGINT(20),
  FOREIGN KEY (id) REFERENCES user(id),
  FOREIGN KEY (to_id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='chat_history';

CREATE TABLE `user_profile` (
  `id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'user id',
  `userName` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'friends user name',  
  `description` VARCHAR(200) DEFAULT '' COMMENT 'description',
  `location` VARCHAR(64) DEFAULT '' COMMENT 'location',
  `birth` BIGINT(20) NOT NULL DEFAULT 18 COMMENT 'birth',    
   FOREIGN KEY (id) REFERENCES user(id),
   UNIQUE `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user_profile';

CREATE TABLE `notes` (
  `writter_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'user id',
  `recieve_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'friends user name',  
  `description` VARCHAR(640) DEFAULT '' COMMENT 'description',   
   FOREIGN KEY (writter_id) REFERENCES user(id),
   FOREIGN KEY (recieve_id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='notes';

CREATE TABLE `incoming_message` (
    `id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'user id',
    `unread` BIGINT(20) UNSIGNED,
    `sender_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'user id',
    FOREIGN KEY (id) REFERENCES user(id),
    FOREIGN KEY (sender_id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='incoming';


INSERT INTO user_profile(id, userName,description, location, birth) VALUES (10, 'Lee', 'balbal', 'beijing, China', '1996-08-07');
INSERT INTO user_profile(id, userName,description, location, birth) VALUES (14, 'xiang', 'balbal', 'Chengdu, China', '1996-08-06');
INSERT INTO user_profile(id, userName,description, location, birth) VALUES (7, 'Joe', 'balbal', 'Shanghai,China', '1996-08-05');

INSERT INTO user(language, country, sex, age) VALUES ('Chinese', 'China', 1,25);
INSERT INTO user(email, language, country, sex, age) VALUES ('test', 'Chinese', 'China', 0,30);
INSERT INTO user(email, language, country, sex, age) VALUES ('test3', 'Chinese', 'China', 0,25);
INSERT INTO user(email, language, country, sex, age) VALUES ('test4', 'Chinese', 'China', 0,21);
INSERT INTO user(email, language, country, sex, age) VALUES ('test5', 'Chinese', 'China', 0,21);


INSERT INTO user(email, language, country, sex, age) VALUES ('tset2', 'Spanish', 'Spain', 0,18);
INSERT INTO user(email, language, country, sex, age) VALUES ('tset4', 'Afrikanns', 'AF', 1,18);
INSERT INTO user(userName, profile_pic , email, language, country, sex, age) VALUES ('Joe','joe_profile', 'tset5', 'Afrikanns', 'AF', 1,60);
INSERT INTO user(userName, profile_pic , email, language, country, sex, age) VALUES ('Anhao','Anhao_profile', 'tset6', 'Afrikanns', 'AF', 1,61);
INSERT INTO user(userName, profile_pic , email, language, country, sex, age) VALUES ('Lijiarong','Lijiarong_profile', 'li@gmail.com', 'AF', 'AF', 0,30);
INSERT INTO user(userName,password, profile_pic , email, language, country, sex, age) VALUES ('Lee','123','Lijiarong_profile', 'lee@gmail.com', 'AF', 'AF', 0,30);
INSERT INTO user(userName,password, profile_pic , email, language, country, sex, age) VALUES ('xiang','123','Lijiarong_profile', 'xiang@gmail.com', 'AF', 'AF', 0,30);
INSERT INTO user(userName,password, profile_pic , email, language, country, sex, age) VALUES ('dong','123','Lijiarong_profile', 'dong@gmail.com', 'AF', 'AF', 0,30);

INSERT INTO user(userName,password, profile_pic , email, language, country, sex, age) VALUES ('China','123','Lijiarong_profile', 'china@gmail.com', 'zh-CN', 'CN', 0,30);
INSERT INTO user(userName,password, profile_pic , email, language, country, sex, age) VALUES ('US','123','Lijiarong_profile', 'us@gmail.com', 'EN', 'US', 0,30);



INSERT INTO user(userName, profile_pic , email, language, country, sex, age) VALUES 
('Test1','test1_P', 'tset1@', 'Afrikanns', 'AF', 1,60);
INSERT INTO user(userName, profile_pic , email, language, country, sex, age) VALUES 
('Test2','test2_P', 'tset2@', 'Afrikanns', 'AF', 0,60);


INSERT INTO friend_list(id, fid, userName, profile_pic, language) VALUES (10, 9, 'Lijiarong', 'Lijiarong_profile', 'Afrikanns');

SELECT id FROM user WHERE (country = '' AND language = '' AND sex = '' AND age > min AND age < max )


