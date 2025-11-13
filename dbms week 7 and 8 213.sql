create database Supplier;
use Supplier;
create table SUPPLIER(sid int , sname varchar(50) ,city varchar(50) ,primary key (sid) );
insert into SUPPLIER values
(10001 ,"Acme Widget","Bangalore"),
(10002 ,"johns","kolkata"),
(10003,"vimal","mumbai"),
(10004,"reliance","delhi");

create table Parts(pid int , pname varchar(50) ,color char(50) , primary key (pid) );
insert into Parts values
(20001 ,"book","red"),
(20002,"pen","red"),
(20003 ,"pencil","green"),
(20004 ,"mobile","green"),
(20005 ,"charger","black");


CREATE TABLE Catalog (
    sid INT,
    pid INT,
    cost INT,
    PRIMARY KEY (sid, pid),
    FOREIGN KEY (sid) REFERENCES SUPPLIER(sid),
    FOREIGN KEY (pid) REFERENCES Parts(pid)
);
insert into catlog values 
(10001 ,20001 ,10),
(10001 ,20002 ,10),
(10001, 20003 ,30),
(10001, 20004 ,10 ),
(10001 ,20005 ,10),
(10002 ,20001,10),
(10002,20002,20),
(10003,20003,30),
(10004,20003, 40);

select distinct pname from Parts p
join Catlog c on p.pid = c.pid ;

select sname from SUPPLIER s 
join Catlog c on c.sid =s.sid 
join parts p on p.pid =c.pid 
group by s.sid 
having count(distinct p.pid )=(select count(*) from parts);

SELECT s.sname
FROM SUPPLIER s
WHERE NOT EXISTS (
    SELECT p.pid
    FROM Parts p
    WHERE p.color = 'red'
    AND NOT EXISTS (
        SELECT c.pid
        FROM Catalog c
        WHERE c.sid = s.sid AND c.pid = p.pid
    )
);
SELECT p.pname
FROM Parts p
JOIN Catalog c ON p.pid = c.pid
WHERE c.sid = 10001
AND p.pid NOT IN (
    SELECT pid
    FROM Catalog
    WHERE sid != 10001
);

SELECT DISTINCT c.sid
FROM Catalog c
JOIN (
    SELECT pid, AVG(cost) AS avg_cost
    FROM Catalog
    GROUP BY pid
) AS avg_table
ON c.pid = avg_table.pid
WHERE c.cost > avg_table.avg_cost;

SELECT p.pname, s.sname
FROM Parts p
JOIN Catalog c ON p.pid = c.pid
JOIN SUPPLIER s ON c.sid = s.sid
WHERE c.cost = (
    SELECT MAX(c2.cost)
    FROM Catalog c2
    WHERE c2.pid = p.pid
);


