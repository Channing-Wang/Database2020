select t1.position, c.champion_name, t2.max_kda as kda
from
(select temp.position, max(temp.kda) as max_kda
from (
	select p.position, p.champion_id, ((sum(kills)+sum(assists))/sum(deaths)) as kda
	from participant as p, stat as s
	where p.player_id = s.player_id
	group by p.position, p.champion_id
	having (p.position = 'TOP' or p.position = 'MID' or p.position = 'JUNGLE' or p.position = 'DUO_CARRY' or p.position = 'DUO_SUPPORT')
)as temp
group by temp.position
order by temp.position)as t1,
(select temp.champion_id, max(temp.kda) as max_kda
from (
	select p.position, p.champion_id, ((sum(kills)+sum(assists))/sum(deaths)) as kda
	from participant as p, stat as s
	where p.player_id = s.player_id
	group by p.position, p.champion_id
	having (p.position = 'TOP' or p.position = 'MID' or p.position = 'JUNGLE' or p.position = 'DUO_CARRY' or p.position = 'DUO_SUPPORT')
)as temp
group by temp.position, temp.champion_id)as t2, champ as c
where t1.max_kda = t2.max_kda and t2.champion_id = c.champion_id;
