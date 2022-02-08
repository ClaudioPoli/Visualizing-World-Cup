create table worldcups (
    year int,
    country varchar(20),
    winner varchar(20),
    runnersup varchar(20),
    third varchar(20),
    fourth varchar(20),
    goalsscored int,
    qualifiedteams int,
    matches int,
    attendance int,
    vizSide varchar(20)default 'Year'::character varying
);

create table worldcups2 (
    year int,
    country varchar(20),
    winner varchar(20),
    runnersup varchar(20),
    third varchar(20),
    fourth varchar(20),
    goalsscored int,
    qualifiedteams int,
    matches int,
    attendance int,
    vizSide varchar(20) default 'Winner'::character varying
);


create view union as (
select * from worldcups

union all

select * from worldcups2);