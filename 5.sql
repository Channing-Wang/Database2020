select if(temp.win,'win','lose') as win_lose, count(*) as cnt
from
(
	select p.match_id, s.win, avg(s.longesttimespentliving) as aver
	from participant as p, stat as s
	where p.player_id = s.player_id
	group by p.match_id, s.win
	having aver >= 1200
)as temp
group by temp.win
