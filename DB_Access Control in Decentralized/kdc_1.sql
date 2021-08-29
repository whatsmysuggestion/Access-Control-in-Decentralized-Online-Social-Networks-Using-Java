/*
MySQL Data Transfer
Source Host: localhost
Source Database: kdc_1
Target Host: localhost
Target Database: kdc_1
Date: 6/20/2014 4:35:04 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(255) default NULL,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `location` varchar(255) default NULL,
  `primekey` varchar(255) default NULL,
  `generatorkey` varchar(255) default NULL,
  `sc` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'kutty', '2012kutty@gmail.com', 'kutty', 'Chennai', '-,25/0,13330/.1/1.,/', '/', 'java.security.SecureRandom@14c3ff1');
INSERT INTO `profile` VALUES ('2', 'sweety', '2012kutty@gmail.com', 'sweety', 'Chennai', '-40/.21.301,3532,253', '/', 'java.security.SecureRandom@1e99979');
INSERT INTO `profile` VALUES ('3', 'priya', '2012kutty@gmail.com', 'priya', 'Chennai', '-013/1.101/3422.25,5', '/', 'java.security.SecureRandom@4fd7d');
