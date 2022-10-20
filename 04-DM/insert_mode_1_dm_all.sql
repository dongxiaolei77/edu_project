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

insert into edu_dm.dm_consultation_consult partition (create_time_year)
-- 1.1 根据 年
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'year' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year;
-- 1.2 根据 季度
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'quarter' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter;
-- 1.3 根据 月
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'month' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month;
-- 1.4 根据日
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'day' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day;
-- 1.5 不跟据日期
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'all' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        '-1' as create_time_year
from edu_dwb.consultation_consult_dwb;
-- 1.6 根据小时
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'hour' as time_type,
        'all' as group_type,
        create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,create_time_hour;
-- 2.1 不跟据 日期 根据 地区
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'all' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        '-1' as create_time_year
from edu_dwb.consultation_consult_dwb
group by area;
-- 2.2 根据 年 地区
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'year' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,area;
-- 2.3 根据 季度 地区
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'quarter' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,area;
-- 2.4 根据月 校区
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'month' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,area;
-- 2.5 根据 日 校区
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'day' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,area;
-- 2.6 根据 小时 校区
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        'hour' as time_type,
        'area' as group_type,
        create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,create_time_hour,area;
-- 3.1 不跟据日期 根据来源渠道
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        'all' as time_type,
        'origin' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        '-1' as create_time_year
from edu_dwb.consultation_consult_dwb
group by origin_channel;
-- 3.2 根据 年 来源渠道
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        'year' as time_type,
        'origin' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,origin_channel;
-- 3.3 根据季度 来源渠道
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        'quarter' as time_type,
        'origin' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,origin_channel;
-- 3.4 根据 月 来源渠道
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        'month' as time_type,
        'origin' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,origin_channel;
-- 3.5 根据 日 来源渠道
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        'day' as time_type,
        'origin' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,origin_channel;
-- 3.6 根据 小时 来源渠道
insert into edu_dm.dm_consultation_consult partition (create_time_year)
select
        count(distinct consultation_id) as consultation_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        'hour' as time_type,
        'origin' as group_type,
        create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.consultation_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,create_time_hour,origin_channel;


-- 1.1 不根据日期
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'all' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        '-1' as create_time_year
from edu_dwb.visit_consult_dwb
;
-- 1.2 根据 年
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'year' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year
;

-- 1.3 根据 季度
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'quarter' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter
;

-- 1.4 根据 月
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'month' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month
;

-- 1.5 根据 日
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'day' as time_type,
        'all' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day
;

-- 1.6 根据 小时
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'hour' as time_type,
        'all' as group_type,
        create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,create_time_hour
;

-- 2.1 根据 所有时间 区域area
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'all' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        '-1' as create_time_year
from edu_dwb.visit_consult_dwb
group by area
;

-- 2.2 根据 年 区域area
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'year' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,area
;

-- 2.3 根据 季度 区域area
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'quarter' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,area
;

-- 2.4 根据 月 区域area
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'month' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,area
;

-- 2.5 根据 日 区域area
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'day' as time_type,
        'area' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,area
;

-- 2.6 根据 小时 区域area
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        area,
        '-1' as origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'hour' as time_type,
        'area' as group_type,
        create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,create_time_hour,area
;

-- 3.1 根据 所有时间 搜索来源source
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        seo_source,
        '-1' as from_url,
        'all' as time_type,
        'seo_source' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        '-1' as create_time_year
from edu_dwb.visit_consult_dwb
group by seo_source
;

-- 3.2 根据 年 搜索来源source
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        seo_source,
        '-1' as from_url,
        'year' as time_type,
        'seo_source' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,seo_source
;

-- 3.3 根据 季度 搜索来源source
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        seo_source,
        '-1' as from_url,
        'quarter' as time_type,
        'seo_source' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,seo_source
;

-- 3.4 根据 月 搜索来源source
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        seo_source,
        '-1' as from_url,
        'month' as time_type,
        'seo_source' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,seo_source
;

-- 3.5 根据 日 搜索来源source
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        seo_source,
        '-1' as from_url,
        'day' as time_type,
        'seo_source' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,seo_source
;

-- 3.6 根据 小时 搜索来源source
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        seo_source,
        '-1' as from_url,
        'hour' as time_type,
        'seo_source' as group_type,
        create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,create_time_hour,seo_source
;

-- 4.1 根据 所有时间 来源渠道origin
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'all' as time_type,
        'origin_channel' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        '-1' as create_time_year
from edu_dwb.visit_consult_dwb
group by origin_channel
;

-- 4.2 根据 年 来源渠道origin
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'year' as time_type,
        'origin_channel' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,origin_channel
;

-- 4.3 根据 季度 来源渠道origin
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'quarter' as time_type,
        'origin_channel' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,origin_channel
;

-- 4.4 根据 月 来源渠道origin
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'month' as time_type,
        'origin_channel' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,origin_channel
;

-- 4.5 根据 日 来源渠道origin
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'day' as time_type,
        'origin_channel' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,origin_channel
;

-- 4.6 根据 小时 来源渠道origin
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        origin_channel,
        '-1' as seo_source,
        '-1' as from_url,
        'hour' as time_type,
        'origin_channel' as group_type,
        create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,create_time_hour,origin_channel
;

-- 5.1 根据 所有时间 受访页面from
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        from_url,
        'all' as time_type,
        'from_url' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        '-1' as create_time_year
from edu_dwb.visit_consult_dwb
group by from_url
;

-- 5.2 根据 年 受访页面from
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        from_url,
        'year' as time_type,
        'from_url' as group_type,
        '-1' as create_time_hour,
        '-1' as create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,from_url
;

-- 5.3 根据 季度 受访页面from
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        from_url,
        'quarter' as time_type,
        'from_url' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        '-1' as create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,from_url
;

-- 5.4 根据 月 受访页面from
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        from_url,
        'month' as time_type,
        'from_url' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        '-1' as create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,from_url
;

-- 5.5 根据 日 受访页面from
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        from_url,
        'day' as time_type,
        'from_url' as group_type,
        '-1' as create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,from_url
;

-- 5.6 根据 日 受访页面from
insert into edu_dm.dm_visit_consult partition (create_time_year) select
        count(distinct visit_id) as visit_id,
        '-1' as area,
        '-1' as origin_channel,
        '-1' as seo_source,
        from_url,
        'hour' as time_type,
        'from_url' as group_type,
        create_time_hour,
        create_time_quarter,
        create_time_month,
        create_time_day,
        create_time_year
from edu_dwb.visit_consult_dwb
group by create_time_year,create_time_quarter,create_time_month,create_time_day,create_time_hour,from_url;
