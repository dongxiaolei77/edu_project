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


insert overwrite table edu_dwd.dwd_web_chat_ems partition (dt)
select
id,
create_date_time,
session_id,
sid,
create_time,
seo_source,
seo_keywords,
ip,
area,
country,
province,
city,
origin_channel,
`user`,
manual_time,
begin_time,
end_time,
last_customer_msg_time_stamp,
last_agent_msg_time_stamp,
reply_msg_count,
msg_count,
browser_name,
os_info,
substr(create_time, 1, 4) as create_time_year,
quarter(create_time) as create_time_quarter,
substr(create_time, 6, 2)  as create_time_month,
substr(create_time, 9, 2)  as create_time_day,
substr(create_time, 12, 2)  as create_time_hour,
dt
from edu_ods.ods_web_chat_ems;

insert overwrite table edu_dwd.dwd_web_chat_text_ems partition (dt)
select
*
from edu_ods.ods_web_chat_text_ems;