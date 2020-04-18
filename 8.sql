select c.champion_name
from champ as c
where c.champion_id not in
(
	select distinct t.champion_id
	from match_info as m, teamban as t
	where m.match_id = t.match_id and m.version like '7.7%'
)
order by c.champion_name asc;
