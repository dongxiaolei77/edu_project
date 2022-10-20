
-- 第 2 主题：意向及有效线索客户主题看板
-- 2.1 总意向量表，维度--年、月、线上线下、新老
drop table if exists edu_app.app_all_intention_count;
create table if not exists edu_app.app_all_intention_count(
    customer_total          int comment '聚合意向客户数',
    `origin_type_state`     varchar(255) comment '0，线上；1，线下',
    `clue_state_state`      varchar(255) comment '0，老客户；1，新客户',
    create_date_time_year   varchar(255) comment '年',
    create_date_time_month  varchar(255) comment '月',
    create_date_time_day    varchar(255) comment '日'
)comment '总意向量线状图';

-- 2.2 意向学员位置热力图，维度--年、月、线上线下、新老
drop table if exists edu_app.app_intention_area_count;
create table if not exists edu_app.app_intention_area_count(
    customer_total         int comment '聚合意向客户数',
    `origin_type_state`    varchar(255) comment '0，线上；1，线下',
    `clue_state_state`     varchar(255) comment '0，老客户；1，新客户',
    area                   varchar(255) comment '地区',
    create_date_time_year  varchar(255) comment '年',
    create_date_time_month varchar(255) comment '月',
    create_date_time_day   varchar(255) comment '日'
)comment '意向学员地图热力图';

-- 2.3 意向学科排名表，维度--年、月、线上线下、学科、新老
drop table if exists edu_app.app_intention_subject_count;
create table if not exists edu_app.app_intention_subject_count(
    customer_total         int comment '聚合意向客户数',
    `origin_type_state`    varchar(255) comment '0，线上；1，线下',
    `clue_state_state`     varchar(255) comment '0，老客户；1，新客户',
    itcast_subject_id      varchar(255) comment '学科id',
    itcast_subject_name    varchar(255) comment '学科名',
    create_date_time_year  varchar(255) comment '年',
    create_date_time_month varchar(255) comment '月',
    create_date_time_day   varchar(255) comment '日'
)comment '意向学科排名柱状图';

-- 2.4 意向校区排名表，维度--年、月、线上线下、校区、新老
drop table if exists edu_app.app_intention_school_count;
create table if not exists edu_app.app_intention_school_count(
    customer_total          int comment '聚合意向客户数',
    `origin_type_state`     varchar(255) comment '0，线上；1，线下',
    `clue_state_state`      varchar(255) comment '0，老客户；1，新客户',
    itcast_school_id        varchar(255) comment '校区id',
    itcast_school_name      varchar(255) comment '校区名',
    create_date_time_year   varchar(255) comment '年',
    create_date_time_month  varchar(255) comment '月',
    create_date_time_day    varchar(255) comment '日'
)comment '意向校区排名柱状图';

-- 2.5 来源渠道占比，维度--年、月、线上线下、来源渠道、新老
drop table if exists edu_app.app_intention_origin_count;
create table if not exists edu_app.app_intention_origin_count(
    customer_total          int comment '聚合意向客户数',
    `origin_type_state`     varchar(255) comment '0，线上；1，线下',
    `clue_state_state`      varchar(255) comment '0，老客户；1，新客户',
    origin_type             varchar(255) comment '渠道',
    create_date_time_year   varchar(255) comment '年',
    create_date_time_month  varchar(255) comment '月',
    create_date_time_day    varchar(255) comment '日'
)comment '来源渠道占比饼状图';

-- 2.6 意向贡献中心占比，维度--年、月、线上线下、咨询中心、新老
drop table if exists edu_app.app_intention_tdepart_rate;
create table if not exists edu_app.app_intention_tdepart_rate(
    customer_total          int comment '聚合意向客户数',
    `origin_type_state`     varchar(255) comment '0，线上；1，线下',
    `clue_state_state`      varchar(255) comment '0，老客户；1，新客户',
    tdepart_id              varchar(255) comment '咨询中心id',
    tdepart_name            varchar(255) comment '咨询中心名',
    create_date_time_year   varchar(255) comment '年',
    create_date_time_month  varchar(255) comment '月',
    create_date_time_day    varchar(255) comment '日'
)comment '咨询中心产生的意向客户数占比饼状图';

-- 2.7 有效线索量，维度--年、月、线上线下、新老
drop table if exists edu_app.app_valid_clue_count;
create table if not exists edu_app.app_valid_clue_count(
    clue_nums               int comment '根据id聚合有效线索数',
    `origin_type_state`     varchar(255) comment '0，线上；1，线下',
    `clue_state_state`      varchar(255) comment '0，老客户；1，新客户',
    create_date_time_year   varchar(255) comment '年',
    create_date_time_month  varchar(255) comment '月',
    create_date_time_day    varchar(255) comment '日'
)comment '有效线索量线状图';