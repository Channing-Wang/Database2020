select c.champion_name, count(*) as cnt
from participant as p, champ as c
where c.champion_id = p. champion_id and p.position = 'JUNGLE'
group by champion_id
order by cnt desc
limit 3;