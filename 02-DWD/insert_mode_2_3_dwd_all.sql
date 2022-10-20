
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


-- # 全量插入操作
INSERT overwrite TABLE edu_dwd.dwd_customer_relationship partition(start_time)
select
id,
create_date_time,
update_date_time,
deleted,
customer_id,
first_id,
belonger,
belonger_name,
initial_belonger,
distribution_handler,
business_scrm_department_id,
last_visit_time,
next_visit_time,
origin_type,
itcast_school_id,
itcast_subject_id,
intention_study_type,
anticipat_signup_date,
`level`,
creator,
current_creator,
creator_name,
origin_channel,
`COMMENT`,
first_customer_clue_id,
last_customer_clue_id,
process_state,
process_time,
payment_state,
payment_time,
signup_state,
signup_time,
notice_state,
notice_time,
lock_state,
lock_time,
itcast_clazz_id,
itcast_clazz_time,
payment_url,
payment_url_time,
ems_student_id,
delete_reason,
deleter,
deleter_name,
delete_time,
course_id,
course_name,
delete_comment,
close_state,
close_time,
appeal_id,
tenant,
total_fee,
belonged,
belonged_time,
belonger_time,
transfer,
transfer_time,
follow_type,
transfer_bxg_oa_account,
transfer_bxg_belonger_name,
'9999-99-99' as end_time,
dt as start_time
from edu_ods.ods_customer_relationship;

-- 分析出dwd_customer_relationship_payment 表 全量导入
insert overwrite table edu_dwd.dwd_customer_relationship_payment partition (payment_time_year,payment_time_month,payment_time_day)
select
    id,
    create_date_time,
    update_date_time,
    deleted,
    customer_id,
    first_id,
    belonger,
    belonger_name,
    initial_belonger,
    distribution_handler,
    business_scrm_department_id,
    last_visit_time,
    next_visit_time,
    origin_type,
    itcast_school_id,
    itcast_subject_id,
    intention_study_type,
    anticipat_signup_date,
    level,
    creator,
    current_creator,
    creator_name,
    origin_channel,
    comment,
    first_customer_clue_id,
    last_customer_clue_id,
    process_state,
    process_time,
    payment_state,
    payment_time,
    signup_state,
    signup_time,
    notice_state,
    notice_time,
    lock_state,
    lock_time,
    itcast_clazz_id,
    itcast_clazz_time,
    payment_url,
    payment_url_time,
    ems_student_id,
    delete_reason,
    deleter,
    deleter_name,
    delete_time,
    course_id,
    course_name,
    delete_comment,
    close_state,
    close_time,
    appeal_id,
    tenant,
    total_fee,
    belonged,
    belonged_time,
    belonger_time,
    transfer,
    transfer_time,
    follow_type,
    transfer_bxg_oa_account,
    transfer_bxg_belonger_name,
    if(origin_type in ('NETSERVICE','PRESIGNUP'),0,1) as origin_type_state,
    substr(payment_time, 12, 2) as payment_time_hour,
    substr(payment_time, 1, 4) as payment_time_year,
    substr(payment_time, 6, 2) as payment_time_month,
    substr(payment_time, 9, 2) as payment_time_day
from edu_dwd.dwd_customer_relationship
where deleted=0 and customer_id is not null and payment_state='PAID' ;


insert overwrite table edu_dwd.dwd_employee partition (start_time)
select
* from edu_ods.ods_employee;

insert overwrite table edu_dwd.dwd_itcast_clazz partition (dt)
select * from edu_ods.ods_itcast_clazz;

insert overwrite table edu_dwd.dwd_scrm_department partition (start_time)
select * from edu_ods.ods_scrm_department;


insert overwrite table edu_dwd.dwd_itcast_school partition (start_time)
select * from edu_ods.ods_itcast_school;

insert overwrite table edu_dwd.dwd_itcast_subject partition (start_time)
select * from edu_ods.ods_itcast_subject;

insert overwrite table edu_dwd.dwd_customer partition (dt)
select * from edu_ods.ods_customer;


insert overwrite table edu_dwd.dwd_customer_relationship_intention partition (create_date_time_year)
select
id,
create_date_time,
update_date_time,
deleted,
customer_id,
first_id,
belonger,
belonger_name,
initial_belonger,
distribution_handler,
business_scrm_department_id,
last_visit_time,
next_visit_time,
origin_type,
itcast_school_id,
itcast_subject_id,
intention_study_type,
anticipat_signup_date,
level,
creator,
current_creator,
creator_name,
origin_channel,
comment,
first_customer_clue_id,
last_customer_clue_id,
process_state,
process_time,
payment_state,
payment_time,
signup_state,
signup_time,
notice_state,
notice_time,
lock_state,
lock_time,
itcast_clazz_id,
itcast_clazz_time,
payment_url,
payment_url_time,
ems_student_id,
delete_reason,
deleter,
deleter_name,
delete_time,
course_id,
course_name,
delete_comment,
close_state,
close_time,
appeal_id,
tenant,
total_fee,
belonged,
belonged_time,
belonger_time,
transfer,
transfer_time,
follow_type,
transfer_bxg_oa_account,
transfer_bxg_belonger_name,
if(origin_type in ('NETSERVICE','PRESIGNUP'),0,1) as origin_type_state,
substr(create_date_time, 12, 2) as create_date_time_hour,
substr(create_date_time, 6, 2) as create_date_time_month,
substr(create_date_time, 9, 2) as create_date_time_day,
substr(create_date_time, 1, 4) as create_date_time_year
from edu_dwd.dwd_customer_relationship
where deleted=0;




insert overwrite table edu_dwd.dwd_customer_appeal partition (dt)
select
*
from edu_ods.ods_customer_appeal
where appeal_status = 1  AND customer_relationship_first_id != 0;

insert overwrite table edu_dwd.dwd_customer_clue partition (create_date_time_year)
select
id,
create_date_time,
update_date_time,
deleted,
customer_id,
customer_relationship_id,
session_id,
sid,
`status`,
`user`,
create_time,
platform,
s_name,
seo_source,
seo_keywords,
ip,
referrer,
from_url,
landing_page_url,
url_title,
to_peer,
manual_time,
begin_time,
reply_msg_count,
total_msg_count,
msg_count,
`comment`,
finish_reason,
finish_user,
end_time,
platform_description,
browser_name,
os_info,
area,
country,
province,
city,
creator,
name,
idcard,
phone,
itcast_school_id,
itcast_school,
itcast_subject_id,
itcast_subject,
wechat,
qq,
email,
gender,
level,
origin_type,
information_way,
working_years,
technical_directions,
customer_state,
valid,
anticipat_signup_date,
clue_state,
scrm_department_id,
superior_url,
superior_source,
landing_url,
landing_source,
info_url,
info_source,
origin_channel,
course_id,
course_name,
zhuge_session_id,
is_repeat,
tenant,
activity_id,
activity_name,
follow_type,
shunt_mode_id,
shunt_employee_group_id,
if(origin_type in ('NETSERVICE','PRESIGNUP'),0,1) as origin_type_state,
case when clue_state='VALID_PUBLIC_NEW_CLUE' then 0
when clue_state='VALID_NEW_CLUES' then 1
else -1 end as clue_state_state,
substr(create_date_time, 12, 2) as create_date_time_hour,
substr(create_date_time, 6, 2) as create_date_time_month,
substr(create_date_time, 9, 2) as create_date_time_day,
substr(create_date_time, 1, 4) as create_date_time_year
from edu_ods.ods_customer_clue
where customer_relationship_id not in(
    select customer_relationship_first_id from edu_dwd.dwd_customer_appeal
    );