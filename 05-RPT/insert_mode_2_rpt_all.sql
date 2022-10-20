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

-- 1、总意向量表
insert overwrite table edu_rpt.rpt_all_intention_count
select
    customer_total,
    origin_type_state,
    clue_state_state,
    create_date_time_year,
    create_date_time_month,
    create_date_time_day
from edu_dm.dm_intention_clue where origin_type_state='0' and time_type='day' and group_type='all';

-- 2、学院位置热力图
insert overwrite table edu_rpt.rpt_intention_area_count
select
    customer_total,
    origin_type_state,
    clue_state_state,
    area,
    create_date_time_year,
    create_date_time_month,
    create_date_time_day
from edu_dm.dm_intention_clue where origin_type_state='0' and time_type='day' and group_type='area';

-- 3、意向学科排名表
insert overwrite table edu_rpt.rpt_intention_subject_count
select
    customer_total,
    origin_type_state,
    clue_state_state,
    itcast_subject_id,
    itcast_subject_name,
    create_date_time_year,
    create_date_time_month,
    create_date_time_day
from edu_dm.dm_intention_clue where time_type='day' and group_type='subject';

-- 4、意向校区排名表
insert overwrite table edu_rpt.rpt_intention_school_count
select
    customer_total,
    origin_type_state,
    clue_state_state,
    itcast_school_id,
    itcast_school_name,
    create_date_time_year,
    create_date_time_month,
    create_date_time_day
from edu_dm.dm_intention_clue where time_type='day' and group_type='school';

-- 5、来源渠道占比
insert overwrite table edu_rpt.rpt_intention_origin_count
select
    customer_total,
    origin_type_state,
    clue_state_state,
    origin_type,
    create_date_time_year,
    create_date_time_month,
    create_date_time_day
from edu_dm.dm_intention_clue where time_type='day' and group_type='origin';

-- 6、意向贡献中心占比
insert overwrite table edu_rpt.rpt_intention_tdepart_rate
select
    customer_total,
    origin_type_state,
    clue_state_state,
    tdepart_id,
    tdepart_name,
    create_date_time_year,
    create_date_time_month,
    create_date_time_day
from edu_dm.dm_intention_clue where time_type='day' and group_type='tdepart';

-- 7、有效线索量
insert overwrite table edu_rpt.rpt_valid_clue_count
select
    clue_nums,
    `origin_type_state`,
    `clue_state_state`,
    create_date_time_year,
    create_date_time_month,
    create_date_time_day
from edu_dm.dm_intention_clue where time_type='day' and group_type='all';



