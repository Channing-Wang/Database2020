select count(distinct substring_index(version,'.',2)) as cnt
from match_info;