select t1.position, c.champion_name
from
(select temp.position, max(temp.cnt) as use_times
from 
(
	select p.position, p.champion_id, count(*) as cnt
	from participant as p, match_info as m
	where p.match_id = m.match_id and (m.duration between 2400 and 3000)
	group by p.position, p.champion_id
	having (p.position = 'TOP' or p.position = 'MID' or p.position = 'JUNGLE' or p.position = 'DUO_CARRY' or p.position = 'DUO_SUPPORT')
)as temp
group by temp.position
order by temp.position)as t1,
(select temp.champion_id, max(temp.cnt) as use_times
from 
(
	select p.position, p.champion_id, count(*) as cnt
	from participant as p, match_info as m
	where p.match_id = m.match_id and (m.duration between 2400 and 3000)
	group by p.position, p.champion_id
	having (p.position = 'TOP' or p.position = 'MID' or p.position = 'JUNGLE' or p.position = 'DUO_CARRY' or p.position = 'DUO_SUPPORT')
)as temp
group by temp.position, temp.champion_id)as t2, champ as c
where t1.use_times = t2.use_times and t2.champion_id = c.champion_id;
