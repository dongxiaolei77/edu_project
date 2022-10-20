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
--分桶
set hive.enforce.bucketing=true;
set hive.enforce.sorting=true;
set hive.optimize.bucketmapjoin = true;
set hive.auto.convert.sortmerge.join=true;
set hive.auto.convert.sortmerge.join.noconditionaltask=true;
--并行执行
set hive.exec.parallel=true;
set hive.exec.parallel.thread.number=8;
--小文件合并
-- set mapred.max.split.size=2147483648;
-- set mapred.min.split.size.per.node=1000000000;
-- set mapred.min.split.size.per.rack=1000000000;
--矢量化查询
set hive.vectorized.execution.enabled=true;
--关联优化器
set hive.optimize.correlation=true;
--读取零拷贝
set hive.exec.orc.zerocopy=true;
--join数据倾斜
set hive.optimize.skewjoin=true;
-- set hive.skewjoin.key=100000;
set hive.optimize.skewjoin.compiletime=true;
set hive.optimize.union.remove=true;
-- group倾斜
set hive.groupby.skewindata=false;


-- 1 	总访问客户量   按天划分
insert overwrite table edu_rpt.rpt_sum_visit_consult select
    dm_visit_consult.visit_id as visit_id,
    dm_visit_consult.time_type as time_type,
    dm_visit_consult.create_time_hour as create_time_hour,
    dm_visit_consult.create_time_quarter as create_time_quarter,
    dm_visit_consult.create_time_month as create_time_month,
    dm_visit_consult.create_time_day as create_time_day,
    dm_visit_consult.create_time_year as create_time_year

from edu_dm.dm_visit_consult where visit_id != 0 and time_type='day' and group_type='all';

-- 2 	地区独立访客热力图  按小时划分
insert overwrite table edu_rpt.rpt_area_visit_consult
select
    dm_visit_consult.visit_id as visit_id,
    dm_visit_consult.area as area,
    dm_visit_consult.time_type as time_type,
    dm_visit_consult.group_type as group_type,
    dm_visit_consult.create_time_hour as create_time_hour,
    dm_visit_consult.create_time_quarter as create_time_quarter,
    dm_visit_consult.create_time_month as create_time_month,
    dm_visit_consult.create_time_year as create_time_year

from edu_dm.dm_visit_consult where visit_id != 0 and time_type='hour' and group_type='area';

-- 3	来源渠道访问量占比 按 小时
insert overwrite table edu_rpt.rpt_source_channel_visit
select
     dm_visit_consult.visit_id as visit_id,
    dm_visit_consult.origin_channel as origin_channel,
    dm_visit_consult.time_type as time_type,
    dm_visit_consult.group_type as group_type,
    dm_visit_consult.create_time_hour as create_time_hour,
    dm_visit_consult.create_time_quarter as create_time_quarter,
    dm_visit_consult.create_time_month as create_time_month,
    dm_visit_consult.create_time_year as create_time_year
from edu_dm.dm_visit_consult where visit_id != 0 and time_type='hour' and group_type='origin_channel';


-- 4	搜索来源访问量占比  按天
-- 统计指定时间段内，不同搜索来源的访问客户量占比。
insert overwrite table edu_rpt.rpt_search_source select
     dm_visit_consult.visit_id as visit_id,
    dm_visit_consult.seo_source as seo_source,
    dm_visit_consult.time_type as time_type,
    dm_visit_consult.group_type as group_type,
    dm_visit_consult.create_time_hour as create_time_hour,
    dm_visit_consult.create_time_quarter as create_time_quarter,
    dm_visit_consult.create_time_month as create_time_month,
    dm_visit_consult.create_time_year as create_time_year
from edu_dm.dm_visit_consult where visit_id != 0  and time_type='day' and group_type='seo_source';


-- 5	活跃页面排行榜  小时榜
-- 统计指定时间段内，产生访问客户量最多的页面排行榜TOPN。
insert overwrite table edu_rpt.rpt_active_page_topn
select
    dm_visit_consult.visit_id as visit_id,
    dm_visit_consult.from_url as from_url,
    dm_visit_consult.time_type as time_type,
    dm_visit_consult.group_type as group_type,
    dm_visit_consult.create_time_hour as create_time_hour,
    dm_visit_consult.create_time_quarter as create_time_quarter,
    dm_visit_consult.create_time_month as create_time_month,
    dm_visit_consult.create_time_year as create_time_year
from edu_dm.dm_visit_consult where visit_id != 0  and time_type='hour' and group_type='from_url';

