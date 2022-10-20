
use edu_app;

-- 访问咨询主题看板
-- 1 	总访问客户量
-- 天区间，统计指定时间段内，访问客户的总数量
drop table if exists edu_app.app_sum_visit_consult;
create table if not exists edu_app.app_sum_visit_consult(
 `visit_id` int comment '用户id',
      `time_type`   varchar(255) comment '日期分区',
      `create_time_hour` varchar(255) COMMENT '创建时间 细化到小时信息',
      `create_time_quarter` varchar(255) comment '创建时间 细化到季度',
      `create_time_month` varchar(255)    comment '创建时间 细化到月',
      `create_time_day` varchar(255)     comment '创建时间 细化到天',
      `create_time_year` varchar(255)     comment '创建时间 细化到年'
)comment '天区间,总访问客户量';

-- 2 	地区独立访客热力图
-- 天区间，统计指定时间段内，访问客户中各区域人数热力图。
drop table if exists edu_app.app_area_visit_consult;
create table if not exists edu_app.app_area_visit_consult(
        `visit_id` int comment '用户id',
        `area`    varchar(255)  comment '用户所在区域',
        `time_type`   varchar(255)  comment '日期分区',
        `group_type`  varchar(255)  comment '分区类型 area 区域 origin 来源渠道 source 搜索来源 from 受访页面',
        `create_time_hour` varchar(255)  COMMENT '创建时间 细化到小时信息',
          `create_time_quarter` varchar(255) comment '创建时间 细化到季度',
          `create_time_month` varchar(255)     comment '创建时间 细化到月',
          `create_time_year` varchar(255)      comment '创建时间 细化到年'
)comment '地区独立访客热力图';

-- 3	来源渠道访问量占比
-- 统计指定时间段内，不同来源渠道的访问客户量占比。
drop table if exists edu_app.app_source_channel_visit;
CREATE table if not exists edu_app.app_source_channel_visit(
    `visit_id` int comment '用户id',
    `origin_channel`  varchar(255) comment '来源渠道',
    `time_type`   varchar(255) comment '日期分区',
    `create_time_hour` varchar(255) COMMENT '创建时间 细化到小时信息',
          `create_time_quarter` varchar(255) comment '创建时间 细化到季度',
          `create_time_month` varchar(255)    comment '创建时间 细化到月',
          `create_time_day` varchar(255)      comment '创建时间 细化到天',
          `create_time_year` varchar(255)      comment '创建时间 细化到年'

)comment '来源渠道访问量占比';

-- 4	搜索来源访问量占比
-- 统计指定时间段内，不同搜索来源的访问客户量占比。
drop table if exists edu_app.app_search_source;
create table if not exists edu_app.app_search_source(
   `visit_id` int comment '用户id',
     `seo_source`  varchar(255) comment '搜索来源',
     `time_type`   varchar(255) comment '日期分区',
     `create_time_hour` varchar(255) COMMENT '创建时间 细化到小时信息',
     `create_time_quarter` varchar(255) comment '创建时间 细化到季度',
    `create_time_month` varchar(255)    comment '创建时间 细化到月',
    `create_time_day` varchar(255)      comment '创建时间 细化到天',
     `create_time_year` varchar(255)      comment '创建时间 细化到年'
)comment '搜索来源访问量占比';

-- 5	活跃页面排行榜
-- 统计指定时间段内，产生访问客户量最多的页面排行榜TOPN。
drop table if exists edu_app.app_active_page_topn;
create table if not exists edu_app.app_active_page_topn(
    `visit_id` int comment '用户id',
    `from_url`    text comment '受访页面',
    `time_type`   varchar(255)  comment '日期分区',
     `create_time_hour` varchar(255)  COMMENT '创建时间 细化到小时信息',
     `create_time_quarter` varchar(255)  comment '创建时间 细化到季度',
    `create_time_month` varchar(255)     comment '创建时间 细化到月',
    `create_time_day` varchar(255)       comment '创建时间 细化到天',
     `create_time_year` varchar(255)       comment '创建时间 细化到年'
)comment '活跃页面排行榜TOPN';

show create table edu_app.app_active_page_topn;

