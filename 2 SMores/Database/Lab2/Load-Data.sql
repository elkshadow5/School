INSERT INTO ZIPCODES values(32114, 'Daytona Beach');
INSERT INTO ZIPCODES values(32128, 'Port Orange');

INSERT INTO EMPLOYEES values(1, 'EMPLOYEE 1',32114,'2016-11-09');
INSERT INTO EMPLOYEES values(2, 'EMPLOYEE 2',32114,'2016-09-09');
INSERT INTO EMPLOYEES values(3, 'EMPLOYEE 3',32128,'2015-11-09');
INSERT INTO EMPLOYEES values(4, 'EMPLOYEE 4',32128,'2018-10-12');


INSERT INTO PARTS (pno,pname,qoh,price) values(10701, 'chair',50,50.87);
INSERT INTO PARTS (pno,pname,qoh,price) values(10201, 'table',50,350.17);
INSERT INTO PARTS (pno,pname,qoh,price) values(10301, 'coffee table',30,150.2);
INSERT INTO PARTS (pno,pname,qoh,price) values(10401, 'tv stand',20,122.2);



INSERT INTO CUSTOMERS values(1, 'CUSTOMER 1', 'Stree ABC', 32128, '386-222-3333');
INSERT INTO CUSTOMERS values(2, 'CUSTOMER 2', 'Stree DXC', 32128, '386-312-3333');
INSERT INTO CUSTOMERS values(3, 'CUSTOMER 3', 'Stree TTT', 32114, '386-222-1234');

INSERT INTO ORDERS values(313,3,1,'2016-11-02','2016-11-09');
INSERT INTO ORDERS values(315,3,1,'2016-11-03','2016-11-09');
INSERT INTO ORDERS values(438,3,1,'2017-03-12',null);

INSERT INTO ODETAILS values(313,10701,5);
INSERT INTO ODETAILS values(315,10201,2);
INSERT INTO ODETAILS values(438,10201,6);
