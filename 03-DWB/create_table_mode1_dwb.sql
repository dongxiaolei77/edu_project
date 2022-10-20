-- # 创建第一主题所需宽表
drop table if exists edu_dwb.visit_consult_dwb;
CREATE TABLE IF NOT EXISTS edu_dwb.`visit_consult_dwb` (
  `visit_id` string comment '用户id',
  `area`    string comment '用户所在区域',
  `origin_channel`  string comment '来源渠道',
  `seo_source`  string comment '搜索来源',
  `from_url`    string comment '受访页面',
  `create_time_hour` STRING COMMENT '创建时间 细化到小时信息',
  `create_time_quarter` string comment '创建时间 细化到季度',
  `create_time_month` STRING,
  `create_time_day` STRING
)
comment '访问量dwb宽表'
PARTITIONED BY(create_time_year STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
stored as ORC
TBLPROPERTIES ('orc.compress'='SNAPPY');

drop table if exists edu_dwb.consultation_consult_dwb;
CREATE TABLE IF NOT EXISTS edu_dwb.`consultation_consult_dwb` (
  `consultation_id` string comment '用户id',
  `area`    string comment '用户所在区域',
  `origin_channel`  string comment '来源渠道',
  `seo_source`  string comment '搜索来源',
  `create_time_hour` STRING COMMENT '创建时间 细化到小时信息',
  `create_time_quarter` string comment '创建时间 细化到季度',
  `create_time_month` STRING,
  `create_time_day` STRING
)
comment '咨询量dwb宽表'
PARTITIONED BY(create_time_year STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
stored as ORC
TBLPROPERTIES ('orc.compress'='SNAPPY');