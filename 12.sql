select adc2.champion_name as ADC, support2.champion_name as SUPPORT, sum(adc2.win)/count(adc2.win) as win_ratio, avg(support2.assists) as support_avg_Assists, count(*) as battles
from
(select adc.match_id, adc.champion_name, adc.team, s.win
from
(select p.match_id, p.player_id, c.champion_name, if(p.player > 5,'R','B') as team
from participant as p, champ as c
where p.champion_id = c.champion_id and p.position = 'DUO_CARRY') as adc, stat as s
where adc.player_id = s.player_id) as adc2,
(select support.match_id, support.champion_name, support.team, s.assists
from
(select p.match_id, p.player_id, c.champion_name, if(p.player > 5, 'R', 'B') as team
from participant as p, champ as c
where p.champion_id = c.champion_id and p.position = 'DUO_SUPPORT') as support, stat as s
where support.player_id = s.player_id) as support2
where adc2.match_id = support2.match_id and adc2.team = support2.team
group by ADC, SUPPORT
having battles > 1000
order by win_ratio desc
limit 5;

select avg(ps.assists) as support_avg_Assists
from
(
select p.champion_id, s.win, s.assists
from participant as p, stat as s
where p.player_id = s.player_id and s.win = 1 and p.position = 'DUO_SUPPORT'
)as ps
group by ps.champion_id
having count(*) > 1000
order by support_avg_Assists desc
limit 5;


