INSERT INTO HimoDB.user_role (role_id, name) VALUES
  (1, 'user'),
  (2, 'donor'),
  (3, 'admin'),
  (4, 'super admin');
  
  INSERT INTO HimoDB.urgency_level (urgency_id, urgency,price) VALUES
  (1, 'Not Urgent',100),
  (2, 'Urgent',200),
  (3, 'Very Urgent',300);
  
   INSERT INTO HimoDB.states (state_id,code, description) VALUES
(1,'AL', 'Alabama'),
(2,'AK', 'Alaska'),
(3,'AZ', 'Arizona'),
(4,'AR', 'Arkansas'),
(5,'CA', 'California'),
(6,'CO', 'Colorado'),
(7,'CT', 'Connecticut'),
(8,'DE', 'Delaware'),
(9,'DC', 'District of Columbia'),
(10,'FL', 'Florida'),
(11,'GA', 'Georgia'),
(12,'HI', 'Hawaii'),
(13,'ID', 'Idaho'),
(14,'IL', 'Illinois'),
(15,'IN', 'Indiana'),
(16,'IA', 'Iowa'),
(17,'KS', 'Kansas'),
(18,'KY', 'Kentucky'),
(19,'LA', 'Louisiana'),
(20,'ME', 'Maine'),
(21,'MD', 'Maryland'),
(22,'MA', 'Massachusetts'),
(23,'MI', 'Michigan'),
(24,'MN', 'Minnesota'),
(25,'MS', 'Mississippi'),
(26,'MO', 'Missouri'),
(27,'MT', 'Montana'),
(28,'NE', 'Nebraska'),
(29,'NV', 'Nevada'),
(30,'NH', 'New Hampshire'),
(31,'NJ', 'New Jersey'),
(32,'NM', 'New Mexico'),
(33,'NY', 'New York'),
(34,'NC', 'North Carolina'),
(35,'ND', 'North Dakota'),
(36,'OH', 'Ohio'),
(37,'OK', 'Oklahoma'),
(38,'OR', 'Oregon'),
(39,'PA', 'Pennsylvania'),
(40,'PR', 'Puerto Rico'),
(41,'RI', 'Rhode Island'),
(42,'SC', 'South Carolina'),
(43,'SD', 'South Dakota'),
(44,'TN', 'Tennessee'),
(45,'TX', 'Texas'),
(46,'UT', 'Utah'),
(47,'VT', 'Vermont'),
(48,'VA', 'Virginia'),
(49,'WA', 'Washington'),
(50,'WV', 'West Virginia'),
(51,'WI', 'Wisconsin'),
(52,'WY', 'Wyoming');

delete from HimoDB.states where state_id=0;
  
     INSERT INTO HimoDB.status (status_id, description) VALUES
  (1, 'Pending'),
  (2, 'Donar Assigned'),
   (3, 'completed'),
    (4, 'Cancelled');
    
    INSERT INTO HimoDB.user (user_id,first_name, last_name,email,password,role_id,phone) VALUES
      (1,'Sundeep', 'Chilukuri','sandychowdary.535@gmail.com','1234',1,6304089246),
        (2,'eswar', 'Chilukuri','eswar@gmail.com','1234',1,1632472394),
          (3,'Test', 'User','tester@gmail.com','1234',1,1632472394),
			(99,'admin', 'admin','admin@gmail.com','1234',3,1632472394),
			 (100,'super', 'admin','superadmin@gmail.com','1234',3,1632472394);
  

