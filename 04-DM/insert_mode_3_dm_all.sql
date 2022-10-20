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

-- 1.1 报名量指标计算, 即: 计算总报名量, 根据时间计算各个时间段的总报名量
-- group_type 报名总人数 all 来源渠道 origin 各个咨询中心 tdepart 各校区 school 各学科 subject 各校区+各学科 school_subject
-- time_type 每年 year 每月 month 每天 day 全部时间 all
-- 1.1.1 统计每年的报名量
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'all' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year;
-- 1.1.2 统计每月的报名量
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'all' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month;
-- 1.1.3 统计每天的报名量
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'all' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day;
-- 统计 总报名量
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'all' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb;
-- 1.1.4 统计年月日中 线上线下的总报名量
-- 1.1.4.1 统计年 线上线下
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'all' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,origin_type_state;
-- 1.1.4.2 统计月 线上线下
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'all' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,origin_type_state;
-- 1.1.4.3 统计日 线上线下
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'all' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,origin_type_state;
-- 1.1.4.4 统计所有累加的 线上线下的
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'all' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by origin_type_state;

-- 1.1.5 根据校区 线上线下 年 月 日
-- 1.1.5.1 根据年 校区
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'school' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,itcast_school_id,itcast_school_name;
-- 1.1.5.2 根据月 校区
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'school' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,itcast_school_id,itcast_school_name;
-- 1.1.5.3 根据日 校区
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'school' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,itcast_school_id,itcast_school_name;
-- 1.1.5.4 根据所有时间 校区
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'school' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by itcast_school_id,itcast_school_name;
-- 1.1.5.5 根据年 线上线下 校区
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'school' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,origin_type_state,itcast_school_id,itcast_school_name;
-- 1.1.5.6 根据月 线上线下 校区
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'school' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,origin_type_state,itcast_school_id,itcast_school_name;
-- 1.1.5.7 根据日 线上线下 校区
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'school' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,origin_type_state,itcast_school_id,itcast_school_name;
-- 1.1.5.8 根据所有时间 线上线下 校区
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'school' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by origin_type_state,itcast_school_id,itcast_school_name;
-- 1.1.6 根据 学科 线上线下 年月日
-- 1.1.6.1 根据 年  学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'subject' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,itcast_subject_id,itcast_subject_name;

-- 1.1.6.2 根据 月  学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'subject' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,itcast_subject_id,itcast_subject_name;

-- 1.1.6.3 根据 日  学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'subject' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,itcast_subject_id,itcast_subject_name;

-- 1.1.6.4 根据 所有时间 学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'subject' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by itcast_subject_id,itcast_subject_name;

-- 1.1.6.5 根据 年 线上线下 学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'subject' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,origin_type_state,itcast_subject_id,itcast_subject_name;

-- 1.1.6.6 根据 月 线上线下 学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'subject' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,origin_type_state,itcast_subject_id,itcast_subject_name;

-- 1.1.6.7 根据 日 线上线下 学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'subject' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,origin_type_state,itcast_subject_id,itcast_subject_name;

-- 1.1.6.8 根据 所有时间 线上线下 学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'subject' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by origin_type_state,itcast_subject_id,itcast_subject_name;

-- 1.2 根据 线上线下 校区+学科 年 月 日 所有时间
-- 1.2.1 根据 年 校区+学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'school_subject' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,itcast_school_id,itcast_school_name,itcast_subject_id,itcast_subject_name;

-- 1.2.2 根据 月 校区+学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'school_subject' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,itcast_school_id,itcast_school_name,itcast_subject_id,itcast_subject_name;

-- 1.2.3 根据 日 校区+学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'school_subject' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,itcast_school_id,itcast_school_name,itcast_subject_id,itcast_subject_name;

-- 1.2.4 根据 所有时间 校区+学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'school_subject' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by itcast_school_id,itcast_school_name,itcast_subject_id,itcast_subject_name;

-- 1.2.5 根据 年 线上线下 校区+学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'school_subject' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,origin_type_state,itcast_school_id,itcast_school_name,itcast_subject_id,itcast_subject_name;

-- 1.2.6 根据 月 线上线下 校区+学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'school_subject' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,origin_type_state,itcast_school_id,itcast_school_name,itcast_subject_id,itcast_subject_name;

-- 1.2.7 根据 日 线上线下 校区+学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'school_subject' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,origin_type_state,itcast_school_id,itcast_school_name,itcast_subject_id,itcast_subject_name;

-- 1.2.8 根据 所有时间 线上线下 校区+学科
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    itcast_school_id,
    itcast_school_name,
    itcast_subject_id,
    itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'school_subject' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by origin_type_state,itcast_school_id,itcast_school_name,itcast_subject_id,itcast_subject_name;

-- 1.3 根据 线上线下 来源渠道 年 月 日
-- 1.3.1 根据 年 来源渠道
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    origin_type,
    '-1' as origin_type_state,
    'origin' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,origin_type;

-- 1.3.2 根据 月 来源渠道
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    origin_type,
    '-1' as origin_type_state,
    'origin' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,origin_type;

-- 1.3.3 根据 日 来源渠道
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    origin_type,
    '-1' as origin_type_state,
    'origin' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,origin_type;

-- 1.3.4 根据 所有时间 来源渠道
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    origin_type,
    '-1' as origin_type_state,
    'origin' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by origin_type;

-- 1.3.5 根据 年 线上线下 来源渠道
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    origin_type,
    origin_type_state,
    'origin' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,origin_type,origin_type_state;

-- 1.3.6 根据 月 线上线下 来源渠道
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    origin_type,
    origin_type_state,
    'origin' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,origin_type,origin_type_state;

-- 1.3.7 根据 日 线上线下 来源渠道
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    origin_type,
    origin_type_state,
    'origin' as group_type,
    ' day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,origin_type,origin_type_state;

-- 1.3.8 根据 所有时间 线上线下 来源渠道
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    '-1' as tdepart_id,
    '-1' as tdepart_name,
    origin_type,
    origin_type_state,
    'origin' as group_type,
    ' all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by origin_type,origin_type_state;

-- 1.4 根据 年 月 日 线上线下 咨询中心
-- 1.4.1 根据所有日期 咨询中心
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    tdepart_id,
    tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'tdepart' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by tdepart_id,tdepart_name;
-- 1.4.2 根据年 咨询中心
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    tdepart_id,
    tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'tdepart' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,tdepart_id,tdepart_name;
-- 1.4.3 根据 月 咨询中心
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    tdepart_id,
    tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'tdepart' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,tdepart_id,tdepart_name;
-- 1.4.4 根据日 咨询中心
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    tdepart_id,
    tdepart_name,
    '-1' as origin_type,
    '-1' as origin_type_state,
    'tdepart' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,tdepart_id,tdepart_name;
-- 1.4.5 根据 所有日期 线上线下 咨询中心
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    tdepart_id,
    tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'tdepart' as group_type,
    'all' as time_type,
    '-1' as payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by origin_type_state,tdepart_id,tdepart_name;
-- 1.4.6 根据 年 线上线下 咨询中心
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    tdepart_id,
    tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'tdepart' as group_type,
    'year' as time_type,
    payment_time_year,
    '-1' as payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,origin_type_state,tdepart_id,tdepart_name;

-- 1.4.7 根据 月 线上线下 咨询中心
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    tdepart_id,
    tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'tdepart' as group_type,
    'month' as time_type,
    payment_time_year,
    payment_time_month,
    '-1' as payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,origin_type_state,tdepart_id,tdepart_name;
-- 1.4.8 根据日 线上线下
insert into table edu_dm.dm_customer_signup partition (payment_time_year,payment_time_month,payment_time_day,payment_time_hour)
select
    count(customer_id) as signup_num,
    '-1' as itcast_school_id,
    '-1' as itcast_school_name,
    '-1' as itcast_subject_id,
    '-1' as itcast_subject_name,
    tdepart_id,
    tdepart_name,
    '-1' as origin_type,
    origin_type_state,
    'tdepart' as group_type,
    'day' as time_type,
    payment_time_year,
    payment_time_month,
    payment_time_day,
    '-1' as payment_time_hour
from edu_dwb.customer_signup_dwb group by payment_time_year,payment_time_month,payment_time_day,origin_type_state,tdepart_id,tdepart_name;
