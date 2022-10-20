-- hive压缩
set hive.exec.compress.intermediate=true;
set hive.exec.compress.output=true;
-- 写入时压缩生效
set hive.exec.orc.compression.strategy=COMPRESSION;
-- 写入数据强制分桶
set hive.enforce.bucketing=true;
-- 开启强制排序
set hive.enforce.sorting=true;

--分区
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions.pernode=10000;
set hive.exec.max.dynamic.partitions=100000;
set hive.exec.max.created.files=150000;
--hive压缩
set hive.exec.compress.intermediate=true;
set hive.exec.compress.output=true;
--写入时压缩生效
set hive.exec.orc.compression.strategy=COMPRESSION;

set hive.exec.mode.local.auto=false;
set hive.exec.mode.local.auto.input.files.max=4;

-- # 允许最大的动态分区
set hive.exec.max.dynamic.partitions=1000;
-- # 单个节点允许最大分区
set hive.exec.max.dynamic.partitions.pernode=100;

insert overwrite table edu_dwb.visit_consult_dwb partition (create_time_year)
select
       dwce.sid as visit_id,
       dwce.area as area,
       dwce.origin_channel as origin_channel,
       dwce.seo_source as seo_source,
       dwcte.from_url as from_url,
       dwce.create_time_hour as create_time_hour,
       dwce.create_time_quarter as create_time_quarter,
       dwce.create_time_month as create_time_month,
       dwce.create_time_day as create_time_day,
       dwce.create_time_year as create_time_year
from edu_dwd.dwd_web_chat_ems dwce
left join edu_dwd.dwd_web_chat_text_ems dwcte on dwce.id=dwcte.id;

insert overwrite table edu_dwb.consultation_consult_dwb partition (create_time_year)
select
       dwce.sid as consultation_id,
       dwce.area as area,
       dwce.origin_channel as origin_channel,
       dwce.seo_source as seo_source,
       dwce.create_time_hour as create_time_hour,
       dwce.create_time_quarter as create_time_quarter,
       dwce.create_time_month as create_time_month,
       dwce.create_time_day as create_time_day,
       dwce.create_time_year as create_time_year
from edu_dwd.dwd_web_chat_ems dwce
left join edu_dwd.dwd_web_chat_text_ems dwcte on dwce.id=dwcte.id and  dwce.msg_count>=1 ;