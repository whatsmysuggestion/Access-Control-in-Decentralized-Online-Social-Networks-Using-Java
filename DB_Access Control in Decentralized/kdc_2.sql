/*
MySQL Data Transfer
Source Host: localhost
Source Database: kdc_2
Target Host: localhost
Target Database: kdc_2
Date: 6/20/2014 4:35:44 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pkey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'kutty', '12');
INSERT INTO `profile` VALUES ('2', 'sweety', '05');
INSERT INTO `profile` VALUES ('3', 'priya', '/1');
