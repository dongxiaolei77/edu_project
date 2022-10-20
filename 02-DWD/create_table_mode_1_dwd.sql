use edu_dwd;
drop table if exists edu_dwd.dwd_web_chat_ems;
create table if not exists edu_dwd.dwd_web_chat_ems(    		-- 访问咨询主表
        id   	                        int						comment '主键',
        create_date_time                string   			comment '数据创建时间',
        session_id                      string  			comment '会话系统sessionId',
        sid                             string       	    comment '访客id',
        create_time                     string    			comment '会话创建时间',
        seo_source                      string            comment '搜索来源',
        seo_keywords                    string            comment '关键字',
        ip                              string             comment 'IP地址',
        area                            string            comment '地域',
        country                         string             comment '所在国家',
        province                        string             comment '省',
        city                            string            comment '城市',
        origin_channel                  string          	comment '来源渠道(广告)',
        `user`                            string            comment '所属坐席',
        manual_time                     string             	comment '人工开始时间',
        begin_time                      string            	comment '坐席领取时间 ',
        end_time                        string            	comment '会话结束时间',
        last_customer_msg_time_stamp    string	            comment '客户最后一条消息的时间',
        last_agent_msg_time_stamp       string	            comment '坐席最后一下回复的时间',
        reply_msg_count                 int                comment '客服回复消息数',
        msg_count                       int          	    comment '客户发送消息数',
        browser_name                    string            comment '浏览器名称',
        os_info                         string            comment '系统名称',
        create_time_year                string          comment '创建时间细化到年',
        create_time_quarter             string          comment '创建时间细化到季度',
        create_time_month                string          comment '创建时间细化到月',
        create_time_day               string          comment '创建时间细化到日',
        create_time_hour               string          comment '创建时间细化到小时'
) comment '访问咨询主表'
partitioned by (dt string)
row format delimited fields terminated by '\t'
stored as orc
tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_dwd.dwd_web_chat_text_ems;
create table if not exists edu_dwd.dwd_web_chat_text_ems(		-- 访问咨询记录附属表（一对一关系）
        id                   	int		    comment '主键',
        referrer             	string	    comment '上级来源页面',
        from_url             	string	    comment '会话来源页面',
        landing_page_url     	string		comment '访客着陆页面',
        url_title            	string		comment '咨询页面title',
        platform_description 	string		comment '客户平台信息',
        other_params         	string		comment '扩展字段中数据',
        history              	string		comment '历史访问记录'
)comment '访问咨询记录附属表'
    partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');