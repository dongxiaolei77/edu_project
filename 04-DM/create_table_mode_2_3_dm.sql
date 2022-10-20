use edu_dm;
create table if not exists edu_dm.dm_customer_signup(
    signup_num  int ,
   itcast_school_id int comment '学校id',
   itcast_school_name  string comment '学校name',
   itcast_subject_id string comment '学科id',
   itcast_subject_name  string comment '学科name',
   tdepart_id   int comment '咨询中心id',
   tdepart_name string  comment '咨询中心name',
   origin_type  string  comment '来源渠道',
   origin_type_state    string  comment '数据来源',
   groupType    string  comment '分组类型',
   time_type    string  comment '时间分组'
)comment '报名用户统计表'
partitioned by (payment_time_year string, payment_time_month string, payment_time_day string, payment_time_hour string)
row format delimited fields terminated by '\t'
stored as orc
tblproperties ('orc.compress'='SNAPPY');


-- 建表
drop table if exists edu_dm.dm_intention_clue;
create table if not exists edu_dm.dm_intention_clue(
    -- 指标
   `customer_total`         INT COMMENT '聚合意向客户数',
   `clue_nums`              INT COMMENT '根据id聚合有效线索数',
    -- 各需求维度
   `area`                   STRING COMMENT '区域信息',
   `itcast_school_id`       STRING COMMENT '校区id',
   `itcast_school_name`     STRING COMMENT '校区名称',
   `origin_type`            STRING COMMENT '来源渠道',
   `itcast_subject_id`      STRING COMMENT '学科id',
   `itcast_subject_name`    STRING COMMENT '学科名称',
   `origin_type_state`      STRING COMMENT '数据来源:1.线下；0.线上',
   `clue_state_state`       STRING COMMENT '客户属性：0.老客户；1.新客户',
   `tdepart_id`             STRING COMMENT '创建者部门id',
   `tdepart_name`           STRING COMMENT '咨询中心名称',
   `group_type`             STRING COMMENT '产品属性类别：1.总累计值；2.区域信息；3.校区、学科组合分组；4.来源渠道；5.咨询中心;',
    -- 时间维度
    time_type               string comment '各时间类型判断：1、按小时聚合；2、按天聚合；3、按周聚合；4、按月聚合；5、按年聚合',
    create_date_time_month  string comment '月',
    create_date_time_day    string comment '天',
    create_date_time_hour   string comment '小时'
)comment '客户意向和线索宽表'
partitioned by (create_date_time_year string)
row format delimited fields terminated by '\t'
stored as orc tblproperties ('orc.compress'='snappy');
