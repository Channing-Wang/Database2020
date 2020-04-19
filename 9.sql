select substring_index(m.version,'.',2) as version_, sum(temp.win) as win_cnt, count(*)-sum(temp.win) as lose_cnt, sum(temp.win)/count(*) as win_ratio
from
(select LT.match_id, LT.team, s.win
from 
(
select p.match_id, p.champion_id, p.player_id, if(p.player > 5, 'R','B') as team
from participant as p
where p.champion_id = 17 or p.champion_id = 64
) as LT, stat as s
where LT.player_id = s.player_id
group by LT.match_id, LT.team, s.win
having sum(LT.champion_id) = 81) as temp, match_info as m
where temp.match_id = m.match_id
group by substring_index(m.version,'.',2)
order by substring_index(m.version,'.',2) asc;
