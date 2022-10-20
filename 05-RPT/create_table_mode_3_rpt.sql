use edu_rpt;
-- 报名用户主题看板
-- 1.校区报名柱状图
-- 天区间，报名人数，线上线下，校区
drop table if exists edu_rpt.rpt_school_application;
create table if not exists edu_rpt.rpt_school_application(
    application_sum int comment '报名人数',
    itcast_school_id int comment '学校id',
    itcast_school_name string comment '学校name',
    origin_type_state string comment '线上线下'
)comment '校区报名柱状图'
partitioned by (payment_time_year string,payment_time_month string,payment_time_day string)
stored as orc
tblproperties ('orc.compress'='SNAPPY');

-- 2.学科报名柱状图
-- 天区间，线上线下，报名人数，学科
drop table if exists edu_rpt.rpt_subject_application;
create table if not exists edu_rpt.rpt_subject_application(
    application_sum int comment '报名人数',
    itcast_subject_id int comment '学科id',
    itcast_subject_name string comment '学科name',
    origin_type_state string comment '线上线下'
)comment '学科报名柱状图'
partitioned by (payment_time_year string,payment_time_month string,payment_time_day string)
stored as orc
tblproperties ('orc.compress'='SNAPPY');

-- 3.总报名量
-- 年月，报名客户总量
drop table if exists edu_rpt.rpt_year_month_application;
create table if not exists edu_rpt.rpt_year_month_application(
    application_sum int comment '报名客户总量'
)comment '年月总报名量'
partitioned by (payment_time_year string,payment_time_month string)
stored as orc
tblproperties ('orc.compress'='SNAPPY');

-- 4.线上报名量
-- 天区间，报名客户总量，线上线下
drop table if exists edu_rpt.rpt_origin_application;
create table if not exists edu_rpt.rpt_origin_application(
    application_sum int comment '报名客户总量',
    origin_type_state string comment '线上线下'
)comment '线上报名量'
partitioned by (payment_time_year string,payment_time_month string,payment_time_day string)
stored as orc
tblproperties ('orc.compress'='SNAPPY');

-- 5. 意向用户报名转化率
-- 天，线上线下， 报名转化率=全部报名人数/全部新增的意向人数

-- 6.有效线索报名转化率
-- 天，线上线下，线上报名转化率=线上报名人数/线上有效线索量

-- 7.日报名趋势图
-- 天，线上线下，报名人数
drop table if exists edu_rpt.rpt_day_application;
create table if not exists edu_rpt.rpt_day_application(
    application_sum int comment '报名人数',
    origin_type_state string comment '线上线下'
)comment '日报名趋势图'
partitioned by (payment_time_year string,payment_time_month string,payment_time_day string)
stored as orc
tblproperties ('orc.compress'='SNAPPY');

-- 8.校区学科的报名学员TOP
-- 年月，校区，学科，线上线下，报名学员人数，各校区各学科报名人数
drop table if exists edu_rpt.rpt_school_subject_application;
create table if not exists edu_rpt.rpt_school_subject_application(
    application_sum int comment '报名人数',
    itcast_school_id int comment '学校id',
    itcast_school_name string comment '学校name',
    itcast_subject_id int comment '学科id',
    itcast_subject_name string comment '学科name',
    origin_type_state string comment '线上线下'
)comment '校区学科的报名学员TOP'
partitioned by (payment_time_year string,payment_time_month string)
stored as orc
tblproperties ('orc.compress'='SNAPPY');

-- 9.来源渠道占比
-- 天，线上线下，来源渠道
drop table if exists edu_rpt.rpt_origin_proportion;
create table if not exists edu_rpt.rpt_origin_proportion(
    application_sum int comment '全部报名学员',
    origin_type string comment '来源渠道'
)comment '来源渠道占比'
partitioned by (payment_time_year string,payment_time_month string,payment_time_day string)
stored as orc
tblproperties ('orc.compress'='SNAPPY');

-- 10.咨询中心报名贡献
-- 天，线上线下，咨询中心，报名学员人数，
drop table if exists edu_rpt.rpt_tdepart_application;
create table if not exists edu_rpt.rpt_tdepart_application(
    application_sum int comment '报名学员总数',
    tdepart_id int comment '咨询中心id',
    tdepart_name string comment '咨询中心name',
    origin_type_state string comment '线上线下'
)comment '咨询中心报名贡献'
partitioned by (payment_time_year string,payment_time_month string,payment_time_day string)
stored as orc
tblproperties ('orc.compress'='SNAPPY');
