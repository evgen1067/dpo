insert into
    crm_customer (id, first_name, last_name, phone, email)
values
    (1,'Simon','Bass','(152) 174-9876','phasellus.in@google.net'),
    (2,'Nehru','Macdonald','(543) 327-2327','aliquam.vulputate.ullamcorper@aol.com'),
    (3,'Adam','Tanner','1-284-561-8408','scelerisque@hotmail.ca'),
    (4,'Wylie','Ford','(780) 830-7541','porttitor@aol.com'),
    (5,'Oren','Burch','(343) 725-1377','nonummy@icloud.org'),
    (6,'Tiger','Mcdonald','1-503-181-2683','nunc.interdum@hotmail.com'),
    (7,'Drew','Hyde','1-422-281-8962','ipsum@yahoo.com'),
    (8,'Todd','Calhoun','1-820-338-2162','erat.vitae.risus@icloud.net'),
    (9,'Brennan','Mosley','(211) 394-4001','quam.vel.sapien@icloud.couk'),
    (10,'Marshall','Nixon','1-715-263-6035','cursus.purus@protonmail.net'),
    (11,'Jakeem','Walls','(191) 675-3883','vestibulum.mauris@icloud.org'),
    (12,'Aristotle','Hebert','(511) 395-6207','libero.morbi.accumsan@icloud.ca'),
    (13,'Oliver','Hughes','1-113-656-5656','nec.luctus@yahoo.com'),
    (14,'Lionel','Massey','1-384-802-4715','etiam.bibendum@hotmail.couk'),
    (15,'Griffith','Hobbs','(334) 425-0165','integer.id.magna@hotmail.com'),
    (16,'Lucas','O''Neill','(542) 261-4209','lacus@outlook.edu'),
    (17,'Lionel','Heath','(848) 849-0024','non.sapien@google.couk'),
    (18,'Noble','Drake','1-626-311-8677','nunc.sit@protonmail.ca'),
    (19,'Keith','Anthony','1-648-824-3724','pretium@yahoo.org'),
    (20,'Xanthus','Mullen','1-959-449-6977','eu.turpis.nulla@hotmail.com');

insert into
    crm_status (id, name)
values
    (1, 'Выполнен'),
    (2, 'Оплачено'),
    (3, 'Ожидает подтверждения магазина'),
    (4, 'Подтвержден'),
    (5, 'Доставляется'),
    (6, 'Заказ выдан клиенту'),
    (7, 'Укомплектован'),
    (8, 'Отказ от заказа'),
    (9, 'Нет оплаты'),
    (10, 'Отменен');

insert into
    crm_order (id, customer_id, created_at, manager_id, status_id, is_paid, total_sum, utm_source)
values
    (1,9,'2023-04-20 16:12:35',18,3,'true',10503,'YPN45THZ1FP'),
    (2,12,'2022-07-10 01:59:44',16,7,'true',1987,'KXR53RMD7DE'),
    (3,6,'2022-09-04 15:39:04',15,5,'true',10695,'XCV78TCK2UD'),
    (4,10,'2022-10-16 11:53:09',17,3,'true',5900,'YPN45THZ1FP'),
    (5,17,'2023-05-01 21:33:47',13,9,'false',2837,'XCV78TCK2UD'),
    (6,6,'2022-05-07 18:55:09',2,7,'true',6768,'KXR53RMD7DE'),
    (7,14,'2024-01-12 01:22:57',18,3,'false',1491,'KXR53RMD7DE'),
    (8,1,'2022-09-16 18:35:14',10,6,'false',7702,'XCV78TCK2UD'),
    (9,1,'2024-02-06 17:27:16',14,5,'true',10592,'YHW75YCA4ES'),
    (10,4,'2024-02-14 16:41:28',2,2,'false',4692,'MGD57TIB9KI'),
    (11,14,'2023-01-03 03:13:57',4,4,'false',3747,'YPN45THZ1FP'),
    (12,11,'2023-08-09 05:04:06',6,9,'true',1679,'KXR53RMD7DE'),
    (13,11,'2023-02-15 19:28:17',11,6,'true',6351,'KXR53RMD7DE'),
    (14,17,'2023-09-22 21:09:27',16,8,'true',8528,'KXR53RMD7DE'),
    (15,16,'2023-06-09 03:23:06',15,6,'false',8743,'KXR53RMD7DE'),
    (16,15,'2023-05-05 13:03:00',6,8,'false',3148,'KXR53RMD7DE'),
    (17,14,'2023-10-29 00:41:06',17,4,'false',2980,'KXR53RMD7DE'),
    (18,12,'2023-02-16 21:18:49',1,6,'true',6364,'KXR53RMD7DE'),
    (19,10,'2023-12-20 16:56:33',19,9,'false',3285,'XCV78TCK2UD'),
    (20,13,'2022-05-12 19:12:40',11,4,'true',9015,'EOH85SOS8UY'),
    (21,15,'2023-06-20 07:10:45',18,2,'true',2454,'QXT56BZL6MG'),
    (22,8,'2023-10-27 03:29:59',9,5,'false',6899,'QXT56BZL6MG'),
    (23,11,'2023-04-26 05:41:37',8,1,'true',3314,'KXR53RMD7DE'),
    (24,19,'2022-10-09 18:25:43',17,8,'true',10110,'KXR53RMD7DE'),
    (25,2,'2022-11-08 04:09:55',8,9,'true',5903,'KXR53RMD7DE'),
    (26,1,'2022-06-15 04:17:57',8,6,'false',1260,'QXT56BZL6MG'),
    (27,6,'2023-06-23 10:09:37',14,5,'true',4705,'YPN45THZ1FP'),
    (28,12,'2023-09-26 02:31:18',15,2,'true',1412,'QXT56BZL6MG'),
    (29,7,'2022-12-29 21:25:50',1,10,'true',9365,'KXR53RMD7DE'),
    (30,5,'2022-08-28 19:19:23',16,5,'true',6711,'RTF59IOD6BM'),
    (31,19,'2024-03-28 22:15:49',12,10,'false',7910,'VYB46CSD8OX'),
    (32,12,'2022-06-26 22:14:48',19,5,'true',2903,'WLY51TMF5VC'),
    (33,12,'2023-06-08 03:36:57',7,7,'false',2042,'BKQ57GMT9BU'),
    (34,16,'2022-07-25 17:09:00',13,2,'true',8931,'HYL58JYT2ET'),
    (35,9,'2023-09-05 00:12:50',11,1,'true',9527,'YPN45THZ1FP'),
    (36,6,'2023-12-09 12:51:16',6,9,'true',5996,'RQD58HFP0AR'),
    (37,10,'2022-08-14 12:44:16',15,2,'false',1769,'YPN45THZ1FP'),
    (38,11,'2022-11-03 20:11:38',17,4,'true',5976,'FOC98BTU0OU'),
    (39,14,'2023-06-22 04:52:46',5,8,'true',4017,'EBA22GIR5VX');

insert into
    crm_order_history (id, order_id, created_at, field_name, old_value, new_value)
values
    (1,23,'2022-04-20 21:05:30','status_id',null,4),
    (2,23,'2022-04-24 10:25:45','status_id',4,3),
    (3,23,'2022-04-25 23:34:08','status_id',3,2),
    (4,23,'2022-05-06 18:39:44','status_id',2,1),
    (5,35,'2022-05-12 23:32:54','status_id',null,5),
    (6,35,'2022-05-22 14:28:57','status_id',5,3),
    (7,35,'2022-06-14 15:09:00','status_id',3,2),
    (8,35,'2022-07-06 01:21:48','status_id',2,1),
    (9,35,'2022-08-23 05:34:25','status_id',null,6),
    (10,3,'2022-09-15 08:17:36','status_id',6,4),
    (11,3,'2022-09-16 21:56:53','status_id',4,2),
    (12,4,'2022-11-17 15:44:00','status_id',null,5),
    (13,4,'2022-11-26 21:05:11','status_id',5,6),
    (14,4,'2022-12-04 06:04:14','status_id',6,7),
    (15,4,'2023-01-31 13:36:48','status_id',7,2),
    (16,4,'2023-02-02 20:30:46','status_id',2,1),
    (17,5,'2023-02-08 17:15:17','status_id',null,6),
    (18,5,'2023-02-09 09:23:17','status_id',6,7),
    (19,5,'2023-03-09 18:05:08','status_id',7,2),
    (20,5,'2023-04-09 16:13:00','status_id',2,1),
    (21,12,'2022-10-21 21:47:21','manager_id',3,4),
    (22,16,'2023-03-14 04:51:34','manager_id',7,2),
    (23,11,'2022-06-18 10:59:30','manager_id',5,7),
    (24,11,'2023-08-20 07:04:01','manager_id',5,6),
    (25,13,'2023-09-10 08:52:22','manager_id',2,3),
    (26,37,'2023-04-26 10:49:05','manager_id',4,5),
    (27,34,'2024-02-11 02:15:53','manager_id',4,7),
    (28,21,'2022-07-17 12:45:01','manager_id',7,4),
    (29,31,'2022-10-21 18:25:36','manager_id',8,9),
    (30,12,'2023-10-10 16:18:36','manager_id',7,10),
    (31,20,'2023-09-10 14:18:45','total_sum',8,3),
    (32,26,'2023-09-21 12:59:44','total_sum',3,10),
    (33,17,'2023-08-09 23:19:56','total_sum',9,4),
    (34,36,'2024-01-13 13:23:10','total_sum',3,6),
    (35,7,'2022-06-24 11:47:32','total_sum',3,8),
    (36,21,'2023-11-04 00:28:05','total_sum',5,9),
    (37,24,'2023-02-20 20:42:23','total_sum',2,1),
    (38,8,'2023-07-08 08:55:13','total_sum',5,3),
    (39,10,'2022-06-10 23:18:20','total_sum',5,7),
    (40,8,'2023-08-30 10:46:35','total_sum',2,2);


insert into
    crm_customer_visit (id, customer_id, visit_length, created_at, landing_page, exit_page, utm_source)
values
    (1,16,75,'2024-04-12 06:54:49','https://instagram.com/group/9?page=1&offset=1','http://facebook.com/group/9?p=8','KXR53RMD7DE'),
    (2,6,124,'2023-12-14 21:46:00','http://facebook.com/en-ca?client=g','https://baidu.com/site?ad=115','CJF73GBD1FY'),
    (3,3,83,'2024-03-29 00:07:11','http://netflix.com/en-ca?str=se','http://reddit.com/site?page=1&offset=1','KXR53RMD7DE'),
    (4,8,29,'2024-03-13 18:06:53','http://naver.com/en-us?ad=115','https://instagram.com/site?q=test','EEQ40YWJ6HV'),
    (5,16,168,'2023-11-13 03:16:16','https://cnn.com/one?ab=441&aad=2','https://yahoo.com/sub/cars?client=g','REO23LFI7DK'),
    (6,6,230,'2024-04-11 00:39:40','http://instagram.com/group/9?q=11','http://guardian.co.uk/fr?page=1&offset=1','BTJ07QSU6OA'),
    (7,2,242,'2023-10-28 06:44:29','http://google.com/en-us?q=4','http://baidu.com/site?ab=441&aad=2','DHN70ISI8EU'),
    (8,16,126,'2023-11-02 16:04:15','https://wikipedia.org/one?ab=441&aad=2','https://wikipedia.org/group/9?gi=100','KXR53RMD7DE'),
    (9,16,172,'2023-01-25 14:45:35','http://youtube.com/user/110?gi=100','http://whatsapp.com/en-us?q=4','XCV78TCK2UD'),
    (10,4,21,'2023-12-28 13:38:12','http://wikipedia.org/site?q=4','https://twitter.com/one?page=1&offset=1','MJI53KQS6KP'),
    (11,4,126,'2023-11-29 23:19:59','http://pinterest.com/group/9?q=test','https://wikipedia.org/settings?q=11','YPN45THZ1FP'),
    (12,3,158,'2022-10-21 15:34:06','http://walmart.com/sub?client=g','https://wikipedia.org/one?q=11','PKS81KKF6ZK'),
    (13,16,208,'2022-08-12 08:36:24','http://guardian.co.uk/user/110?q=11','http://cnn.com/sub?q=11','YKY85NMU1CE'),
    (14,16,107,'2024-03-02 00:11:44','https://twitter.com/site?q=4','https://guardian.co.uk/settings?search=1','XCV78TCK2UD'),
    (15,19,188,'2023-02-01 20:13:59','https://yahoo.com/site?search=1&q=de','https://reddit.com/site?ad=115','XCV78TCK2UD'),
    (16,2,178,'2024-02-16 09:11:27','http://walmart.com/settings?g=1','http://reddit.com/group/9?q=0','XCV78TCK2UD'),
    (17,12,148,'2024-01-27 22:54:11','https://whatsapp.com/sub?ad=115','http://baidu.com/settings?p=8','XCV78TCK2UD'),
    (18,1,168,'2023-06-16 06:29:36','https://cnn.com/site?search=1&q=de','https://baidu.com/fr?k=0','YPN45THZ1FP'),
    (19,12,149,'2022-12-21 22:19:53','http://netflix.com/en-ca?page=1&offset=1','https://naver.com/sub/cars?str=se','YPN45THZ1FP'),
    (20,4,156,'2022-11-10 22:20:18','https://wikipedia.org/site?search=1','http://facebook.com/sub?q=4','YPN45THZ1FP'),
    (21,12,164,'2023-01-19 15:12:35','http://guardian.co.uk/settings?search=1&q=de','https://ebay.com/fr?search=1&q=de','YPN45THZ1FP'),
    (22,20,234,'2023-01-26 13:32:14','http://youtube.com/en-ca?p=8','https://whatsapp.com/settings?k=0','YPN45THZ1FP'),
    (23,9,208,'2023-04-01 18:44:21','http://naver.com/en-ca?search=1','http://guardian.co.uk/settings?ad=115','YPN45THZ1FP'),
    (24,2,134,'2023-01-26 00:27:48','https://youtube.com/user/110?str=se','http://reddit.com/user/110?p=8','QXT56BZL6MG'),
    (25,8,202,'2022-10-02 09:33:01','https://zoom.us/sub/cars?q=11','http://twitter.com/group/9?q=11','QXT56BZL6MG'),
    (26,2,186,'2024-04-18 21:52:28','https://ebay.com/en-us?k=0','https://bbc.co.uk/sub/cars?search=1','QXT56BZL6MG'),
    (27,16,246,'2022-09-09 04:59:29','https://netflix.com/site?str=se','https://whatsapp.com/user/110?ab=441&aad=2','KXR53RMD7DE'),
    (28,13,31,'2022-06-03 09:49:16','http://zoom.us/user/110?q=11','https://yahoo.com/group/9?search=1&q=de','KXR53RMD7DE'),
    (29,17,224,'2022-05-23 22:05:21','https://zoom.us/sub/cars?search=1','http://instagram.com/group/9?ad=115','KXR53RMD7DE'),
    (30,6,142,'2022-11-07 15:49:08','https://baidu.com/sub/cars?ad=115','http://facebook.com/sub?gi=100','KXR53RMD7DE'),
    (31,3,53,'2022-04-24 02:56:11','https://bbc.co.uk/one?ad=115','https://youtube.com/settings?str=se','YLC28YOB8KE'),
    (32,4,26,'2024-04-19 13:14:26','http://guardian.co.uk/sub?q=4','http://baidu.com/en-us?q=4','POV53PZG7RH'),
    (33,6,209,'2022-10-03 08:00:58','https://zoom.us/site?q=4','https://youtube.com/user/110?p=8','QXT56BZL6MG'),
    (34,17,186,'2022-09-30 05:23:27','https://cnn.com/site?q=test','https://naver.com/sub/cars?gi=100','GXW40IMM3DM'),
    (35,12,119,'2023-02-09 13:38:26','http://twitter.com/group/9?q=11','https://naver.com/group/9?page=1&offset=1','HPE13XRU6HY'),
    (36,19,235,'2023-05-09 21:37:02','http://naver.com/settings?p=8','http://walmart.com/en-ca?q=4','FWQ64IUQ6SQ'),
    (37,5,197,'2023-05-01 16:46:10','http://twitter.com/one?ad=115','http://whatsapp.com/sub?ad=115','SEV96TFP7RO'),
    (38,9,133,'2022-04-26 04:32:08','http://wikipedia.org/sub?client=g','http://baidu.com/fr?q=4','WKL88ONF7TE'),
    (39,15,129,'2023-07-31 14:50:11','https://youtube.com/site?p=8','https://walmart.com/fr?gi=100','LBK71RWQ0KS'),
    (40,16,207,'2022-08-13 07:42:16','http://twitter.com/group/9?ab=441&aad=2','http://pinterest.com/fr?search=1','RXI46MWY2OL');

insert into
    crm_customer_visit_page (id, visit_id, page, time_on_page)
values
    (1,13,'https://twitter.com/fr?k=0',321),
    (2,24,'http://netflix.com/sub/cars?k=0',415),
    (3,5,'http://facebook.com/group/9?q=test',49),
    (4,4,'https://netflix.com/user/110?q=4',206),
    (5,11,'https://wikipedia.org/site?q=11',404),
    (6,34,'https://netflix.com/group/9?k=0',436),
    (7,35,'https://bbc.co.uk/en-ca?ad=115',499),
    (8,15,'http://guardian.co.uk/site?page=1&offset=1',127),
    (9,36,'https://twitter.com/fr?g=1',164),
    (10,26,'http://reddit.com/site?gi=100',247),
    (11,14,'https://pinterest.com/one?client=g',42),
    (12,28,'http://instagram.com/group/9?q=0',70),
    (13,28,'http://naver.com/sub/cars?k=0',129),
    (14,8,'https://netflix.com/one?ab=441&aad=2',166),
    (15,22,'http://zoom.us/fr?q=4',188),
    (16,24,'http://guardian.co.uk/site?q=test',45),
    (17,15,'https://instagram.com/en-us?q=test',36),
    (18,15,'https://ebay.com/sub?p=8',83),
    (19,6,'https://google.com/one?str=se',131),
    (20,31,'http://wikipedia.org/sub/cars?q=4',93),
    (21,13,'https://twitter.com/fr?k=0',118),
    (22,24,'http://netflix.com/sub/cars?k=0',119),
    (23,5,'http://facebook.com/group/9?q=test',66),
    (24,4,'https://netflix.com/user/110?q=4',40),
    (25,11,'https://wikipedia.org/site?q=11',130),
    (26,34,'https://netflix.com/group/9?k=0',129),
    (27,35,'https://bbc.co.uk/en-ca?ad=115',127),
    (28,15,'http://guardian.co.uk/site?page=1&offset=1',105),
    (29,36,'https://twitter.com/fr?g=1',178),
    (30,26,'http://reddit.com/site?gi=100',163),
    (31,14,'https://pinterest.com/one?client=g',42),
    (32,28,'http://instagram.com/group/9?q=0',70),
    (33,28,'http://naver.com/sub/cars?k=0',129),
    (34,8,'https://netflix.com/one?ab=441&aad=2',166),
    (35,22,'http://zoom.us/fr?q=4',188),
    (36,24,'http://guardian.co.uk/site?q=test',45),
    (37,15,'https://instagram.com/en-us?q=test',36),
    (38,15,'https://ebay.com/sub?p=8',83),
    (39,6,'https://google.com/one?str=se',131),
    (40,31,'http://wikipedia.org/sub/cars?q=4',93);

