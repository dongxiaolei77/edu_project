
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

-- 第二主题插入DWB宽表语句
insert overwrite table edu_dwb.itcast_intention_dwb partition (create_date_time_year)
select
    dcri.customer_id as customer_id,
    dcri.create_date_time as create_date_time,
    dc.area as area,
    disc.id as itcast_school_id,
    disc.name as itcast_school_name,
    dcri.origin_type as origin_type,
    dis.id as itcast_subjuct_id,
    dis.name as itcast_subject_name,
    dcri.origin_type_state as origin_type_state,
    dcc.clue_state_state as clue_state_state,
    dcd.id as tdepart_id,
    dcd.name as tdepart_name,
    dcri.create_date_time_hour as create_date_time_hour,
    dcri.create_date_time_month as create_date_time_month,
    dcri.create_date_time_day as create_date_time_day,
    dcri.create_date_time_year as create_date_time_year
from edu_dwd.dwd_customer_relationship_intention dcri
left join edu_dwd.dwd_customer_clue dcc on dcri.id = dcc.customer_relationship_id
left join edu_dwd.dwd_customer dc on dc.id = dcri.customer_id
left join edu_dwd.dwd_employee de on de.id = dcri.creator
left join edu_dwd.dwd_scrm_department dcd on de.scrm_department_id=dcd.id
left join edu_dwd.dwd_itcast_school disc on disc.id = dcri.itcast_school_id
left join edu_dwd.dwd_itcast_subject dis on dis.id = dcri.itcast_subject_id;


-- 第三主题插入DWB宽表语句
insert overwrite table edu_dwb.customer_signup_dwb partition (payment_time_year,payment_time_month,payment_time_day)
select
    dcr.customer_id as customer_id,
    dcr.itcast_school_id as itcast_school_id,
    dic.itcast_school_name  as itcast_school_name,
    dcr.itcast_subject_id as itcast_subject_id,
    dic.itcast_subject_name as itcast_subject_name,
    de.department_id as tdepart_id,
    de.department_name as tdepart_name,
    origin_type,
    origin_type_state,
    payment_time,
    payment_time_hour,
    payment_time_year,
    payment_time_month,
    payment_time_day
from edu_dwd.dwd_customer_relationship_payment dcr
left join edu_dwd.dwd_itcast_clazz dic on  dcr.itcast_clazz_id=dic.id
left join edu_dwd.dwd_employee de on dcr.creator=de.id
left join edu_dwd.dwd_scrm_department dsd on de.department_id=dsd.id;
