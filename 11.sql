select (temp.win/temp.total) as win_rate
from
(
	select sum(s.win) as win, count(s.win) as total
	from participant as p, stat as s
	where p.player_id = s.player_id and p.position = 'TOP' and ((ss1 = 'Flash' and ss2 = 'Ignite') or (ss2 = 'Flash' and ss1 = 'Ignite'))
)as temp;

select avg(temp.goldearned) as avg_goldearned, avg(temp.kda) as avg_kda
from
(select s.goldearned, ((s.deaths+s.assists)/s.kills) as kda
from participant as p, stat as s
where p.player_id = s.player_id and p.position = 'TOP' and s.kills != 0 and ((ss1 = 'Flash' and ss2 = 'Ignite') or (ss2 = 'Flash' and ss1 = 'Ignite'))) as temp;

select (temp.win/temp.total) as win_rate
from
(
	select sum(s.win) as win, count(s.win) as total
	from participant as p, stat as s
	where p.player_id = s.player_id and p.position = 'TOP' and ((ss1 = 'Flash' and ss2 = 'Teleport') or (ss2 = 'Flash' and ss1 = 'Teleport'))
)as temp;

select avg(temp.goldearned) as avg_goldearned, avg(temp.kda) as avg_kda
from
(select s.goldearned, ((s.deaths+s.assists)/s.kills) as kda
from participant as p, stat as s
where p.player_id = s.player_id and p.position = 'TOP' and s.kills != 0 and ((ss1 = 'Flash' and ss2 = 'Teleport') or (ss2 = 'Flash' and ss1 = 'Teleport'))) as temp;
