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


-- 1 校区报名柱状图
insert overwrite table edu_rpt.rpt_school_application partition (payment_time_year,payment_time_month,payment_time_day)
select
    dm_customer_signup.signup_num as application_sum,
    dm_customer_signup.itcast_school_id as itcast_school_id,
    dm_customer_signup.itcast_school_name as itcast_school_name,
    dm_customer_signup.origin_type_state as origin_type_state,
    dm_customer_signup.payment_time_year as payment_time_year,
    dm_customer_signup.payment_time_month as payment_time_month,
    dm_customer_signup.payment_time_day as payment_time_day
from edu_dm.dm_customer_signup where origin_type_state<>'-1' and time_type='day' and grouptype='school';

-- 2 学科报名柱状图
insert overwrite table edu_rpt.rpt_subject_application partition (payment_time_year,payment_time_month,payment_time_day)
select
    dm_customer_signup.signup_num as application_sum,
    dm_customer_signup.itcast_subject_id as itcast_subject_id,
    dm_customer_signup.itcast_subject_name as itcast_subject_name,
    dm_customer_signup.origin_type_state as origin_type_state,
    dm_customer_signup.payment_time_year as payment_time_year,
    dm_customer_signup.payment_time_month as payment_time_month,
    dm_customer_signup.payment_time_day as payment_time_day
from edu_dm.dm_customer_signup where origin_type_state<>'-1' and time_type='day' and grouptype='subject';

-- 3 年月总报名量
insert overwrite table edu_rpt.rpt_year_month_application partition (payment_time_year,payment_time_month)
select
    dm_customer_signup.signup_num as application_sum,
    dm_customer_signup.payment_time_year as payment_time_year,
    dm_customer_signup.payment_time_month as payment_time_month
from edu_dm.dm_customer_signup where origin_type_state='-1' and time_type='month' and grouptype='all';


-- 4 线上报名量
insert overwrite table edu_rpt.rpt_origin_application partition (payment_time_year,payment_time_month,payment_time_day)
select
    dm_customer_signup.signup_num as application_sum,
       dm_customer_signup.origin_type_state as origin_type_state,
       dm_customer_signup.payment_time_year as payment_time_year,
       dm_customer_signup.payment_time_month as payment_time_month,
       dm_customer_signup.payment_time_day as payment_time_day
from edu_dm.dm_customer_signup where origin_type_state='0' and time_type='day' and grouptype='all';

-- 7 日报名趋势图
insert overwrite table edu_rpt.rpt_day_application partition (payment_time_year,payment_time_month,payment_time_day)
select
    dm_customer_signup.signup_num as application_sum,
       dm_customer_signup.origin_type_state as origin_type_state,
       dm_customer_signup.payment_time_year as payment_time_year,
       dm_customer_signup.payment_time_month as payment_time_month,
       dm_customer_signup.payment_time_day as payment_time_day
from edu_dm.dm_customer_signup where origin_type_state <> '-1' and time_type='day' and grouptype='all';

-- 8 校区学科的报名学员TOP
insert overwrite table edu_rpt.rpt_school_subject_application partition (payment_time_year,payment_time_month)
select
  dm_customer_signup.signup_num as application_sum,
    dm_customer_signup.itcast_school_id as itcast_school_id,
    dm_customer_signup.itcast_school_name as itcast_school_name,
    dm_customer_signup.itcast_subject_id as itcast_subject_id,
    dm_customer_signup.itcast_subject_name as itcast_subject_name,
    dm_customer_signup.origin_type_state as origin_type_state,
        dm_customer_signup.payment_time_year as payment_time_year,
       dm_customer_signup.payment_time_month as payment_time_month
from edu_dm.dm_customer_signup where origin_type_state<>'-1' and time_type='month' and grouptype='school_subject';

-- 9 来源渠道占比
insert overwrite table edu_rpt.rpt_origin_proportion partition (payment_time_year,payment_time_month,payment_time_day)
select
    dm_customer_signup.signup_num as application_sum,
       dm_customer_signup.origin_type as origin_type_state,
       dm_customer_signup.payment_time_year as payment_time_year,
       dm_customer_signup.payment_time_month as payment_time_month,
       dm_customer_signup.payment_time_day as payment_time_day
from edu_dm.dm_customer_signup where origin_type_state='-1' and time_type='day' and grouptype='origin';

-- 10 咨询中心报名贡献
insert overwrite table edu_rpt.rpt_tdepart_application partition (payment_time_year,payment_time_month,payment_time_day)
select
        dm_customer_signup.signup_num as application_sum,
    dm_customer_signup.tdepart_id as tdepart_id,
    dm_customer_signup.tdepart_name as tdepart_name,
    dm_customer_signup.origin_type_state as origin_type_state,
       dm_customer_signup.payment_time_year as payment_time_year,
       dm_customer_signup.payment_time_month as payment_time_month,
       dm_customer_signup.payment_time_day as payment_time_day
from edu_dm.dm_customer_signup where origin_type_state<>'-1' and time_type='day' and grouptype='tdepart';
