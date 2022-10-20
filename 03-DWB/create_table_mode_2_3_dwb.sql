-- 分析出需求所需要的表 并进行创建
-- 创建第二主题DWB宽表
drop table if exists edu_dwb.itcast_intention_dwb;
CREATE TABLE IF NOT EXISTS edu_dwb.`itcast_intention_dwb` (
  `customer_id` STRING COMMENT 'id信息',
  `create_date_time` STRING COMMENT '创建时间',
  `area` STRING COMMENT '区域信息',
  `itcast_school_id` STRING COMMENT '校区id',
  `itcast_school_name` STRING COMMENT '校区名称',
  `origin_type` STRING COMMENT '来源渠道',
  `itcast_subject_id` STRING COMMENT '学科id',
  `itcast_subject_name` STRING COMMENT '学科名称',
  `origin_type_state` STRING COMMENT '数据来源:1.线下；0.线上',
  `clue_state_state` STRING COMMENT '新老客户：0.老客户；1.新客户',
  `tdepart_id` STRING COMMENT '创建者部门id',
  `tdepart_name` STRING COMMENT '咨询中心名称',
  `create_date_time_hour` STRING COMMENT '创建时间 细化到小时信息',
  `create_date_time_month` STRING,
  `create_date_time_day` STRING
)
comment '客户意向dwb表'
PARTITIONED BY(create_date_time_year STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
stored as ORC
TBLPROPERTIES ('orc.compress'='SNAPPY');

-- 创建 第三主题DWB宽表
drop table if exists edu_dwb.customer_signup_dwb;
CREATE TABLE IF NOT EXISTS edu_dwb.customer_signup_dwb (
    customer_id         int     comment '报名客户id',
    itcast_school_id    string  comment '学校id',
    itcast_school_name  string  comment '学校name',
    itcast_subject_id   string  comment '学科id',
    itcast_subject_name string  comment '学科name',
    tdepart_id          int     comment '咨询中心id',
    tdepart_name        string  comment '咨询中心name',
    origin_type         string  comment '来源渠道',
    origin_type_state    string  comment '数据来源:0.线下；1.线上',
    payment_time           string comment '支付时间',
    payment_time_hour   string  comment '支付时间 细化到小时'
)
comment '报名人数统计表'
PARTITIONED BY (payment_time_year string, payment_time_month string, payment_time_day string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
stored as orc
TBLPROPERTIES ('orc.compress'='SNAPPY');




