create database lesson_4_hw
use lesson_4_hw
go

--Task1;

CREATE TABLE [dbo].[TestMultipleZero]
(
    [A] [int] NULL,
    [B] [int] NULL,
    [C] [int] NULL,
    [D] [int] NULL
);
GO

INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

select *
from [dbo].[TestMultipleZero]
where not (
    isnull(A, 0) = 0 and 
    isnull(B, 0) = 0 and 
    isnull(C, 0) = 0 and 
    isnull(D, 0) = 0
);


--Task2;

CREATE TABLE TestMax
(
    Year1 INT
    ,Max1 INT
    ,Max2 INT
    ,Max3 INT
);
GO
 
INSERT INTO TestMax 
VALUES
    (2001,10,101,87)
    ,(2002,103,19,88)
    ,(2003,21,23,89)
    ,(2004,27,28,91);

Select 
    Year1,
    Max1,
    Max2,
    Max3,
    (Select max(v) 
     from (values (Max1), (Max2), (Max3)) as value_table(v)
    ) as MaxValue
from TestMax;

--Task3;


CREATE TABLE EmpBirth
(
    EmpId INT  IDENTITY(1,1) 
    ,EmpName VARCHAR(50) 
    ,BirthDate DATETIME 
);
 
INSERT INTO EmpBirth(EmpName,BirthDate)
SELECT 'Pawan' , '12/04/1983'
UNION ALL
SELECT 'Zuzu' , '11/28/1986'
UNION ALL
SELECT 'Parveen', '05/07/1977'
UNION ALL
SELECT 'Mahesh', '01/13/1983'
UNION ALL
SELECT'Ramesh', '05/09/1983';

select EmpName, BirthDate
from EmpBirth
where 
    month(BirthDate) = 5 and
    day(BirthDate) between 7 and 15;


--Task4;

create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');
select * from letters

select letter
from letters
order by 
    case when letter = 'b' then 0 else 1 end,  -- Put 'b' first
    letter;
