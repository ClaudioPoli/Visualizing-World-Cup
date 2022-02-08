create table matches(
    data varchar(50),
    year int,
    month varchar(5),
    hour varchar(20),
    day int,
    stage varchar(50),
    stadium varchar(50),
    city varchar(40),
    home_team_name varchar (50),
    home_team_goal int,
    away_team_goal int,
    away_team_name varchar(50),
    winner varchar(50),
    loser varchar(50),
    draw varchar(10),
    win_cond varchar(50),
    penalties varchar(10),
    penalties_winner varchar(50),
    penalties_loser varchar(50),
    extra_time varchar(10),
    golden_goal varchar(10),
    attendance int,
    half_time_home_goal int,
    half_time_away_goal int,
    referee varchar(50),
    assistant1 varchar(50),
    assistant2 varchar(50),
    roundID varchar(20),
    matchID varchar(20),
    home_team_in varchar(5),
    away_team_in varchar(5)
);

create table players
(
    roundID  varchar(20),
    matchID  varchar(20),
    team_in  varchar(5),
    coach    varchar(50),
    lineup   varchar(5),
    shirt    int,
    player   varchar(50),
    position varchar(5),
    event    varchar(50),
    event2   varchar(50),
    goal int,
    own_goal int,
    yellow int,
    red int,
    penalty int,
    missed_penalty int,
    sub_in int,
    sub_out int
);


create table matchesplayers(
    roundID  varchar(20),
    matchID  varchar(20),
    team_in  varchar(5),
    coach    varchar(50),
    lineup   varchar(5),
    shirt    int,
    player   varchar(50),
    position varchar(5),
    event    varchar(50),
    event2   varchar(50),
    goal int,
    own_goal int,
    yellow int,
    red int,
    penalty int,
    missed_penalty int,
    sub_in int,
    sub_out int,
    data varchar(50),
    year int,
    month varchar(5),
    hour varchar(20),
    day int,
    stage varchar(50),
    stadium varchar(50),
    city varchar(40),
    home_team_name varchar (50),
    home_team_goal int,
    away_team_goal int,
    away_team_name varchar(50),
    winner varchar(50),
    loser varchar(50),
    draw varchar(10),
    win_cond varchar(50),
    penalties varchar(10),
    penalties_winner varchar(50),
    penalties_loser varchar(50),
    extra_time varchar(10),
    golden_goal varchar(10),
    attendance int,
    half_time_home_goal int,
    half_time_away_goal int,
    referee varchar(50),
    assistant1 varchar(50),
    assistant2 varchar(50),
    roundID2 varchar(20),
    matchID2 varchar(20),
    home_team_in varchar(5),
    away_team_in varchar(5)

);


select * from players p
left join matches m on p.matchID = m.matchID and p.roundID=m.roundID;


--Eliminazione duplicati
CREATE FUNCTION drop_duplicates(tab regclass, attr text) RETURNS VOID
AS
$$
BEGIN
    EXECUTE 'ALTER TABLE ' || tab || ' ADD id serial;' ||
            'DELETE FROM ' || tab || ' a USING ' || tab || ' b ' ||
            'WHERE a.id < b.id AND a.' || attr || ' = b.' || attr || ';' ||
            'ALTER TABLE ' || tab || ' DROP id;';
    RETURN;
END
$$
    LANGUAGE plpgsql;


ALTER TABLE matchesplayers
    ADD id serial;
DELETE
FROM matchesplayers a
    USING matchesplayers b
WHERE a.id < b.id
  AND a.matchID = b.matchID
  AND a.roundID = b.roundID
  AND a.player = b.player;
ALTER TABLE matchesplayers
    DROP id;

select * from matchesplayers
order by year asc,month asc, day asc;