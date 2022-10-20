set hive.exec.dynamic.partition.mode=nonstrict;
-- 1、根据 年 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb group by create_date_time_year;
-- 2、根据 年、月 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month;
-- 3、根据 年、月、天 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day;
-- 4、根据 年、月、天、小时 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour;
-- 5、根据 所有时间 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb;
-- 6、根据 年、线上线下 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state;
-- 7、根据 年、月、线上线下 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state;
-- 8、根据 年、月、天、线上线下 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state;
-- 9、根据 年、月、天、小时、线上线下 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state;
-- 10、根据 所有时间、线上线下 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by origin_type_state;
-- 11、根据 年、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,clue_state_state;
-- 12、根据 年、月、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,clue_state_state;
-- 13、根据 年、月、日、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,clue_state_state;
-- 14、根据 年、月、日、小时、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,clue_state_state;
-- 15、根据 所有时间、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by clue_state_state;
-- 16、根据 年、线上线下、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb group by create_date_time_year,origin_type_state,clue_state_state;
-- 17、根据 年、月、线上线下、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,clue_state_state;
-- 18、根据 年、月、日、线上线下、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,create_date_time_day,clue_state_state;
-- 19、根据 年、月、日、小时、线上线下、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,create_date_time_day,
         create_date_time_hour,clue_state_state;
-- 20、根据 所有时间、线上线下、新老客户 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'all' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,clue_state_state;
-- 21、根据 年、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,area;
-- 22、根据 年、月、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,area;
-- 23、根据 年、月、日、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,area;
-- 24、根据 年、月、日、小时、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,area;
-- 25、根据 所有时间、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by area;
-- 26、根据 年、线上线下、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,area;
-- 27、根据 年、月、线上线下、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,area;
-- 28、根据 年、月、日、线上线下、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,area;
-- 29、根据 年、月、日、小时、线上线下、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,area;
-- 30、根据 所有时间、线上线下、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by origin_type_state,area;
-- 31、根据 年、新老客户、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb group by create_date_time_year,clue_state_state,area;
-- 32、根据 年、月、新老客户、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,clue_state_state,area;
-- 33、根据 年、月、日、新老客户、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,clue_state_state,area;
-- 34、根据 年、月、日、时、新老客户、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,clue_state_state,area;
-- 35、根据 所有时间、新老客户、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by clue_state_state,area;
-- 36、根据 年、线上线下、新老客户地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,clue_state_state,area;
-- 37、根据 年、月、线上线下、新老客户地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,clue_state_state,area;
-- 38、根据 年、月、日、线上线下、新老客户地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,clue_state_state,area;
-- 39、根据 年、月、日、时、线上线下、新老客户地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,
         clue_state_state,area;
-- 40、根据 所有时间、线上线下、新老客户、地区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'area' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,clue_state_state,area;
-- 41、根据 年、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,itcast_school_id,itcast_school_name;
-- 42、根据 年、月、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,itcast_school_id,itcast_school_name;
-- 43、根据 年、月、日、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,itcast_school_id,itcast_school_name;
-- 44、根据 年、月、日、小时、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,
         itcast_school_id,itcast_school_name;
-- 45、根据 所有时间、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by itcast_school_id,itcast_school_name;
-- 46、根据 年、线上线下、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,itcast_school_id,itcast_school_name;
-- 47、根据 年、月、线上线下、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,itcast_school_id,itcast_school_name;
-- 48、根据 年、月、日、线上线下、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,
         itcast_school_id,itcast_school_name;
-- 49、根据 年、月、日、小时、线上线下、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,
         itcast_school_id,itcast_school_name;
-- 50、根据 所有时间、线上线下、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,itcast_school_id,itcast_school_name;
-- 51、根据 年、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,clue_state_state,itcast_school_id,itcast_school_name;
-- 52、根据 年、月、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,clue_state_state,itcast_school_id,itcast_school_name;
-- 53、根据 年、月、日、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,clue_state_state,itcast_school_id,
         itcast_school_name;
-- 54、根据 年、月、日、时、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,clue_state_state,
         itcast_school_id,itcast_school_name;
-- 55、根据 所有时间、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by clue_state_state,itcast_school_id,itcast_school_name;
-- 56、根据 年、线上线下、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,clue_state_state,itcast_school_id,itcast_school_name;
-- 57、根据 年、月、线上线下、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,clue_state_state,itcast_school_id,itcast_school_name;
-- 58、根据 年、月、日、线上线下、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,clue_state_state,
         itcast_school_id,itcast_school_name;
-- 59、根据 年、月、日、时、线上线下、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,
         clue_state_state,itcast_school_id,itcast_school_name;
-- 60、根据 所有时间、线上线下、新老客户、校区 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        itcast_school_id,
        itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'school' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,clue_state_state,itcast_school_id,itcast_school_name;
-- 61、根据 年、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type;
-- 62、根据 年、月、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type;
-- 63、根据 年、月、日、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type;
-- 64、根据 年、月、日、小时、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type;
-- 65、根据 所有时间、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by origin_type;
-- 66、根据 年、线上线下、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,origin_type;
-- 67、根据 年、月、线上线下、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,origin_type;
-- 68、根据 年、月、日、线上线下、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,origin_type;
-- 69、根据 年、月、日、小时、线上线下、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,origin_type;
-- 70、根据 所有时间、线上线下、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,origin_type;
-- 71、根据 年、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,clue_state_state,origin_type;
-- 72、根据 年、月、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,clue_state_state,origin_type
;
-- 73、根据 年、月、日、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,clue_state_state,origin_type
;
-- 74、根据 年、月、日、时、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,clue_state_state,origin_type
;
-- 75、根据 所有时间、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by clue_state_state,origin_type
;
-- 76、根据 年、线上线下、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,clue_state_state,origin_type
;
-- 77、根据 年、月、线上线下、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,clue_state_state,origin_type
;
-- 78、根据 年、月、日、线上线下、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,clue_state_state,origin_type
;
-- 79、根据 年、月、日、时、线上线下、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,
         clue_state_state,origin_type
;
-- 80、根据 所有时间、线上线下、新老客户、渠道 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'origin' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,clue_state_state,origin_type
;
-- 81、根据 年、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,itcast_subject_id,itcast_subject_name
;
-- 82、根据 年、月、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,itcast_subject_id,itcast_subject_name
;
-- 83、根据 年、月、日、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,itcast_subject_id,itcast_subject_name
;
-- 84、根据 年、月、日、小时、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,
         itcast_subject_id,itcast_subject_name
;
-- 85、根据 所有时间、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by itcast_subject_id,itcast_subject_name
;
-- 86、根据 年、线上线下、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,itcast_subject_id,itcast_subject_name
;
-- 87、根据 年、月、线上线下、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,itcast_subject_id,itcast_subject_name
;
-- 88、根据 年、月、日、线上线下、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,
         itcast_subject_id,itcast_subject_name
;
-- 89、根据 年、月、日、小时、线上线下、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,
         itcast_subject_id,itcast_subject_name
;
-- 90、根据 所有时间、线上线下、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,itcast_subject_id,itcast_subject_name
;
-- 91、根据 年、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,clue_state_state,itcast_subject_id,itcast_subject_name
;
-- 92、根据 年、月、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,clue_state_state,itcast_subject_id,itcast_subject_name
;
-- 93、根据 年、月、日、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,clue_state_state,
         itcast_subject_id,itcast_subject_name
;
-- 94、根据 年、月、日、时、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,clue_state_state,
         itcast_subject_id,itcast_subject_name
;
-- 95、根据 所有时间、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by clue_state_state,itcast_subject_id,itcast_subject_name
;
-- 96、根据 年、线上线下、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,clue_state_state,itcast_subject_id,itcast_subject_name;
-- 97、根据 年、月、线上线下、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,clue_state_state,
         itcast_subject_id,itcast_subject_name;
-- 98、根据 年、月、日、线上线下、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,clue_state_state,
         itcast_subject_id,itcast_subject_name;
-- 99、根据 年、月、日、时、线上线下、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,
         clue_state_state,itcast_subject_id,itcast_subject_name;
-- 100、根据 所有时间、线上线下、新老客户、学科 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        itcast_subject_id,
        itcast_subject_name,
        origin_type_state,
        clue_state_state,
        '-1' as tdepart_id,
        '-1' as tdepart_name,
        'subject' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,clue_state_state,itcast_subject_id,itcast_subject_name;
-- 101、根据 年、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,tdepart_id,tdepart_name;
-- 102、根据 年、月、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,tdepart_id,tdepart_name;
-- 103、根据 年、月、日、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,tdepart_id,tdepart_name;
-- 104、根据 年、月、日、小时、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,
         tdepart_id,tdepart_name;
-- 105、根据 所有时间、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by tdepart_id,tdepart_name;
-- 106、根据 年、线上线下、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,tdepart_id,tdepart_name;
-- 107、根据 年、月、线上线下、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,tdepart_id,tdepart_name;
-- 108、根据 年、月、日、线上线下、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,
         tdepart_id,tdepart_name;
-- 109、根据 年、月、日、小时、线上线下、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,
         tdepart_id,tdepart_name;
-- 110、根据 所有时间、线上线下、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        '-1' as clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,tdepart_id,tdepart_name;
-- 111、根据 年、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,clue_state_state,tdepart_id,tdepart_name;
-- 112、根据 年、月、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,clue_state_state,tdepart_id,tdepart_name;
-- 113、根据 年、月、日、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,clue_state_state,
         tdepart_id,tdepart_name;
-- 114、根据 年、月、日、时、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,clue_state_state,
         tdepart_id,tdepart_name;
-- 115、根据 所有时间、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        '-1' as origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb group by clue_state_state,tdepart_id,tdepart_name;
-- 116、根据 年、线上线下、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'year' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,origin_type_state,clue_state_state,tdepart_id,tdepart_name;
-- 117、根据 年、月、线上线下、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'month' as time_type,
        create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,origin_type_state,clue_state_state,
         tdepart_id,tdepart_name;
-- 118、根据 年、月、日、线上线下、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'day' as time_type,
        create_date_time_month,
        create_date_time_day,
        '-1' as create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,origin_type_state,clue_state_state,
         tdepart_id,tdepart_name;
-- 119、根据 年、月、日、时、线上线下、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'hour' as time_type,
        create_date_time_month,
        create_date_time_day,
        create_date_time_hour,
        create_date_time_year
from edu_dwb.itcast_intention_dwb
group by create_date_time_year,create_date_time_month,create_date_time_day,create_date_time_hour,origin_type_state,
         clue_state_state,tdepart_id,tdepart_name;
-- 120、根据 所有时间、线上线下、新老客户、咨询 维度统计总指标
insert into edu_dm.dm_intention_clue partition (create_date_time_year) select
        count(distinct customer_id) as customer_total,
        count(customer_id) as clue_nums,
        '-1' as area,
        '-1' as itcast_school_id,
        '-1' as itcast_school_name,
        '-1' as origin_type,
        '-1' as itcast_subject_id,
        '-1' as itcast_subject_name,
        origin_type_state,
        clue_state_state,
        tdepart_id,
        tdepart_name,
        'tdepart' as group_type,
        'all' as time_type,
        '-1' as create_date_time_month,
        '-1' as create_date_time_day,
        '-1' as create_date_time_hour,
        '-1' as create_date_time_year
from edu_dwb.itcast_intention_dwb
group by origin_type_state,clue_state_state,tdepart_id,tdepart_name;