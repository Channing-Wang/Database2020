select champion_id, count(*) as cnt
from participant
where position = 'JUNGLE'
group by champion_id
order by cnt desc
limit 3;