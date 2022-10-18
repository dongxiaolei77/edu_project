-- 设置hive
set hive.auto.convert.join=true;
-- smb
set hive.enforce.bucketing=true;
set hive.enforce.sorting=true;
set hive.optimize.bucketmapjoin = true;
set hive.auto.convert.sortmerge.join=true;
set hive.auto.convert.sortmerge.join.noconditionaltask=true;
set hive.optimize.bucketmapjoin.sortedmerge = true;



drop database if exists edu_ods cascade ;
-- 创建ods层数据库
create database if not exists edu_ods;


use edu_ods;
-- 建表  ods层
drop table if exists edu_ods.ods_web_chat_ems_2019_07;
create table if not exists edu_ods.ods_web_chat_ems_2019_07(    		-- 访问咨询主表
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
        os_info                         string            comment '系统名称'
) comment '访问咨询主表'
partitioned by (dt string)
row format delimited fields terminated by '\t'
stored as orc
tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_web_chat_text_ems_2019_07;
create table if not exists edu_ods.ods_web_chat_text_ems_2019_07(		-- 访问咨询记录附属表（一对一关系）
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

-- 来源：scrm
drop table if exists edu_ods.ods_customer ;
create table if not exists edu_ods.ods_customer(						-- 客户静态信息表（关联获取客户的静态信息，比如地区信息）
        id      int,
        customer_relationship_id 	int 	comment '当前意向id',
        create_date_time 		    string		comment '创建时间',
        update_date_time 		    string		comment '最后更新时间',
        deleted 			        int			comment '是否被删除（禁用）',
        name 				        string			comment '姓名',
        idcard				        string	 		comment '身份证号',
        birth_year		 		    int		        comment '出生年份',
        gender 				        string			comment '性别',
        phone				        string			comment '手机号',
        wechat				        string			comment '微信',
        qq					        string			comment 'qq号',
        email				        string			comment '邮箱',
        area				        string			comment '所在区域',
        leave_school_date		    string		    comment '离校时间',
        graduation_date			    string		    comment '毕业时间',
        bxg_student_id		        string			comment '博学谷学员ID，可能未关联到，不存在',
        creator				        int			    comment '创建人ID',
        origin_type			        string			comment '数据来源',
        origin_channel		        string			comment '来源渠道',
        tenant                      int,
        md_id			            int				comment '中台id'
)comment '客户静态信息表'
partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_customer_appeal;
create table if not exists edu_ods.ods_customer_appeal(				-- 线索申诉表（主要来判断客户线索被投诉无效）
        id                                     int,
        customer_relationship_first_id 	       int             comment '第一条客户关系id',
        employee_id                            int             comment '申诉人',
        employee_name                          string          comment '申诉人姓名',
        employee_department_id                 int       	   comment '申诉人部门',
        employee_tdepart_id                    int    	       comment '申诉人所属部门',
        appeal_status                          int    	       comment '申诉状态，0:待稽核 1:无效 2：有效',
        audit_id                               int     	       comment '稽核人id',
        audit_name                             string           comment '稽核人姓名',
        audit_department_id                    int    	        comment '稽核人所在部门',
        audit_department_name                  string    	    comment '稽核人部门名称',
        audit_date_time                        string        comment '稽核时间',
        create_date_time                       string        comment '创建时间（申诉时间）',
        update_date_time                       string       	comment '更新时间',
        deleted                                string         	comment '删除标志位',
        tenant                                 int
)comment '线索申诉表'
    partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_customer_clue;
create table if not exists edu_ods.ods_customer_clue(					-- 客户线索表  -- 拉链表
        id  int,
        create_date_time		    string		        comment '创建时间',
        update_date_time	        string			comment '最后更新时间',
        deleted				        int			        comment '是否被删除（禁用）',
        customer_id 			    int		            comment '客户id',
        customer_relationship_id	int 	            comment '客户关系id',
        session_id				string		            comment '七陌会话id',
        sid				        string				    comment '访客id',
        status				    string			        comment '状态（undeal待领取 deal 已领取 finish 已关闭 changePeer 已流转）',
        `user`   					string		comment '所属坐席',
        create_time				string		comment '七陌创建时间',
        platform   			    string	    comment '平台来源 （pc-网站咨询|wap-wap咨询|sdk-app咨询|weixin-微信咨询）',
        s_name   				string		comment '用户名称',
        seo_source   			string		comment '搜索来源',
        seo_keywords   			string		comment '关键字',
        ip				 		string		comment 'IP地址',
        referrer				string		comment '上级来源页面',
        from_url				string		comment '会话来源页面',
        landing_page_url		string		comment '访客着陆页面',
        url_title   			string		comment '咨询页面title',
        to_peer   				string		comment '所属技能组',
        manual_time				string		comment '人工开始时间',
        begin_time				string		comment '坐席领取时间 ',
        reply_msg_count			int		    comment '客服回复消息数',
        total_msg_count			int		    comment '消息总数',
        msg_count				int		    comment '客户发送消息数',
        comment   				string		comment '备注',
        finish_reason   		string		comment '结束类型',
        finish_user   			string		comment '结束坐席',
        end_time				string		comment '会话结束时间',
        platform_description   	string		comment '客户平台信息',
        browser_name			string		comment '浏览器名称',
        os_info   				string		comment '系统名称',
        area   					string		comment '区域',
        country   				string		comment '所在国家',
        province   				string		comment '省',
        city   					string		comment '城市',
        creator					int		    comment '创建人',
        name					string		comment '客户姓名',
        idcard					string		comment '身份证号',
        phone					string		comment '手机号',
        itcast_school_id		int		    comment '校区Id',
        itcast_school			string		comment '校区',
        itcast_subject_id 		int		    comment '学科Id',
        itcast_subject 			string		comment '学科',
        wechat   				string		comment '微信',
        qq   					string		comment 'qq号',
        email 					string		comment '邮箱',
        gender 					string		comment '性别',
        level 					string		comment '客户级别',
        origin_type   			string		comment '数据来源渠道',
        information_way 		string		comment '资讯方式',
        working_years			string		comment '开始工作时间',
        technical_directions   	string		comment '技术方向',
        customer_state   		string		comment '当前客户状态',
        valid 					int		        comment '该线索是否是网资有效线索',
        anticipat_signup_string 	string		    comment '预计报名时间',
        clue_state				string		    comment '线索状态',
        scrm_department_id 		int		        comment 'SCRM内部部门id',
        superior_url 			string		    comment '诸葛获取上级页面URL',
        superior_source  		string		    comment '诸葛获取上级页面URL标题',
        landing_url				string		    comment '诸葛获取着陆页面URL',
        landing_source			string		    comment '诸葛获取着陆页面URL来源',
        info_url				string		    comment '诸葛获取留咨页URL',
        info_source				string		    comment '诸葛获取留咨页URL标题',
        origin_channel   	    string			comment '投放渠道',
        course_id               int,
        course_name             string,
        zhuge_session_id        string,
        is_repeat		        int				comment '是否重复线索(手机号维度) 0:正常 1：重复',
        tenant				    int			    comment '租户id',
        activity_id 		    string			comment '活动id',
        activity_name		    string			comment '活动名称',
        follow_type			    int			    comment '分配类型，0-自动分配，1-手动分配，2-自动转移，3-手动单个转移，4-手动批量转移，5-公海领取',
        shunt_mode_id 		    int			    comment '匹配到的技能组id',
        shunt_employee_group_id int		        comment '所属分流员工组'
)comment '客户线索表'
partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_customer_relationship;
create table if not exists edu_ods.ods_customer_relationship(			-- 客户意向表  -- 拉链表
        id                          int,
        create_date_time            string,
        update_date_time	        string       comment '最后更新时间',
        deleted				        int			    comment '是否被删除（禁用）',
        customer_id			        int			    comment '所属客户id',
        first_id			        int			    comment '第一条客户关系id',
        belonger			        int			    comment '归属人',
        belonger_name		        string			comment '归属人姓名',
        initial_belonger	        int			    comment '初始归属人',
        distribution_handler	    int		        comment '分配处理人',
        business_scrm_department_id	int	            comment '归属部门',
        last_visit_time			    string		    comment '最后回访时间',
        next_visit_time			    string		    comment '下次回访时间',
        origin_type				    string		    comment '数据来源',
        itcast_school_id		    int		        comment '校区Id',
        itcast_subject_id		    int		        comment '学科Id',
        intention_study_type	    string		    comment '意向学习方式',
        anticipat_signup_date    string		    comment '预计报名时间',
        level				        string			comment '客户级别',
        creator				        int			    comment '创建人',
        current_creator		        int			    comment '当前创建人：初始==创建人，当在公海拉回时为 拉回人',
        creator_name		        string			comment '创建者姓名',
        origin_channel		        string			comment '来源渠道',
        comment				        string			comment '备注',
        first_customer_clue_id	    int		comment '第一条线索id',
        last_customer_clue_id	    int		comment '最后一条线索id',
        process_state		string			comment '处理状态',
        process_time		string			comment '处理状态变动时间',
        payment_state		string			comment '支付状态',
        payment_time		string			comment '支付状态变动时间',
        signup_state		string			comment '报名状态',
        signup_time			string			comment '报名时间',
        notice_state		string			comment '通知状态',
        notice_time			string			comment '通知状态变动时间',
        lock_state			int			    comment '锁定状态',
        lock_time			string			comment '锁定状态修改时间',
        itcast_clazz_id		int			    comment '所属ems班级id',
        itcast_clazz_time		string		comment '报班时间',
        payment_url				string		comment '付款链接',
        payment_url_time		string		comment '支付链接生成时间',
        ems_student_id			int		    comment 'ems的学生id',
        delete_reason			string		comment '删除原因',
        deleter					int		    comment '删除人',
        deleter_name			string		comment '删除人姓名',
        delete_time			    string	    comment '删除时间',
        course_id				int		    comment '课程ID',
        course_name				string		comment '课程名称',
        delete_comment			string		comment '删除原因说明',
        close_state				string		comment '关闭装填',
        close_time				string		comment '关闭状态变动时间',
        appeal_id				int		    comment '申诉id',
        tenant					int		    comment '租户',
        total_fee				string		comment '报名费总金额',
        belonged				int		    comment '小周期归属人',
        belonged_time			string		comment '归属时间',
        belonger_time			string		comment '归属时间',
        transfer				int		    comment '转移人',
        transfer_time			string		    comment '转移时间',
        follow_type				int		        comment '分配类型，0-自动分配，1-手动分配，2-自动转移，3-手动单个转移，4-手动批量转移，5-公海领取',
        transfer_bxg_oa_account		string	    comment '转移到博学谷归属人OA账号',
        transfer_bxg_belonger_name	string	    comment '转移到博学谷归属人OA姓名'
 )comment '客户意向表'
    partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_employee;
create table if not exists edu_ods.ods_employee(						-- 员工信息表
        id                      int,
        email                   string          comment '公司邮箱，OA登录账号',
        real_name               string      	comment '员工的真实姓名',
        phone                   string   		comment '手机号，目前还没有使用；隐私问题OA接口没有提供这个属性，',
        department_id           string 			comment 'OA中的部门编号，有负值',
        department_name         string			comment 'OA中的部门名',
        remote_login            int			    comment '员工是否可以远程登录',
        job_number              string 			comment '员工工号',
        cross_school            int			    comment '是否有跨校区权限',
        last_login_date         string			comment '最后登录日期',
        creator                 int			    comment '创建人',
        create_date_time        string			comment '创建时间',
        update_date_time        string		comment '最后更新时间',
        deleted                 int 			comment '是否被删除（禁用）',
        scrm_department_id  	int		        comment 'SCRM内部部门id',
        leave_office        	int		        comment '离职状态',
        leave_office_time   	string		    comment '离职时间',
        reinstated_time     	string		    comment '复职时间',
        superior_leaders_id 	int		        comment '上级领导ID',
        tdepart_id          	int		        comment '直属部门',
        tenant                  int,
        ems_user_name           string
)comment '员工信息表'
    partitioned by (start_time string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_itcast_clazz;
create table if not exists edu_ods.ods_itcast_clazz(					-- 报名课程表（获取客户报名的校区和学科）
        id             			int		    comment 'ems课程id(非自增)',
        create_date_time    	string		comment '创建时间',
        update_date_time    	string	comment '最后更新时间',
        deleted             	int		    comment '是否被删除（禁用）',
        itcast_school_id    	string		comment 'ems校区ID',
        itcast_school_name  	string		comment 'ems校区名称',
        itcast_subject_id   	string		comment 'ems学科ID',
        itcast_subject_name 	string		comment 'ems学科名称',
        itcast_brand        	string		comment 'ems品牌',
        clazz_type_state    	string		comment '班级类型状态',
        clazz_type_name     	string		comment '班级类型名称',
        teaching_mode       	string		comment '授课模式',
        start_time          	string		comment '开班时间',
        end_time            	string		comment '毕业时间',
        comment             	string		comment '备注',
        detail              	string		comment '详情(比如：27期)',
        uncertain           	int		    comment '待定班(0:否,1:是)',
        tenant                  int
)comment '报名课程表'
    partitioned by (dt string)
row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_itcast_school;
create table if not exists edu_ods.ods_itcast_school(				-- 学校表
        id                      int,
        create_date_time 		string		    comment '创建时间',
        update_date_time 		string		comment '最后更新时间',
        deleted          		int		        comment '是否被删除（禁用）',
        name             		string		    comment '校区名称',
        code                    string,
        tenant                  int
)comment '学校表'
    partitioned by (start_time string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_itcast_subject;
create table if not exists edu_ods.ods_itcast_subject(				-- 学科表
        id                  int,
        create_date_time	string			    comment '创建时间',
        update_date_time	string			comment '最后更新时间',
        deleted     		int			        comment '是否被删除（禁用）',
        name           	  	string			    comment '学科名称',
        code                string,
        tenant              int
)comment '学科表'
    partitioned by (start_time string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPYY');

drop table if exists edu_ods.ods_scrm_department;
create table if not exists edu_ods.ods_scrm_department(				-- 部门表
        id                      int,
        name             		string		    comment '部门名称',
        parent_id        		int		        comment '父部门id',
        create_date_time 		string		    comment '创建时间',
        update_date_time 		string		comment '更新时间',
        deleted          		int		        comment '删除标志',
        id_path          		string		    comment '编码全路径',
        tdepart_code     		int		        comment '直属部门',
        creator          		string		    comment '创建者',
        depart_level     		int		        comment '部门层级',
        depart_sign      		int		        comment '部门标志，暂时默认1',
        depart_line      		int		        comment '业务线，存储业务线编码',
        depart_sort      		int		        comment '排序字段',
        disable_flag     		int		        comment '禁用标志',
        tenant                  int
)comment '部门表'
    partitioned by (start_time string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

-- 来源：teach
drop table if exists edu_ods.ods_calendar;
create table if not exists edu_ods.ods_calendar(
        id		    int				comment '主键',
        datelist    string
)
partitioned by (dt string)
    row format delimited fields terminated by '\t'
 stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_class_studying_student_count;
create table if not exists edu_ods.ods_class_studying_student_count(	-- 班级在读学生人数
        id                          int,
        school_id              		int	    comment '校区id',
        subject_id             		int	    comment '学科id',
        class_id               		int	    comment '班级id',
        studying_student_count 		int	    comment '在读班级人数',
        studying_date          		string	comment '在读日期'
)comment '班级在读人数'
    partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_course_table_upload_detail;
create table if not exists edu_ods.ods_course_table_upload_detail(	-- 班级课表
        id						int		    comment 'id',
        base_id             	int		    comment '课程主表id',
        class_id            	int		    comment '班级id',
        class_date          	string		comment '上课日期',
        content             	string		comment '课程内容',
        teacher_id          	int		    comment '老师id',
        teacher_name        	string		comment '老师名字',
        job_number          	string		comment '工号',
        classroom_id        	int		    comment '教室id',
        classroom_name      	string		comment '教室名称',
        is_outline          	int		    comment '是否大纲 0 否 1 是',
        class_mode          	int		    comment '上课模式 0 传统全天 1 AB上午 2 AB下午 3 线上直播',
        is_stage_exam       	int		    comment '是否阶段考试（0：否 1：是）',
        is_pay              	int		    comment '代课费（0：无 1：有）',
        tutor_teacher_id    	int		    comment '晚自习辅导老师id',
        tutor_teacher_name  	string		comment '辅导老师姓名',
        tutor_job_number    	string		comment '晚自习辅导老师工号',
        is_subsidy          	int		    comment '晚自习补贴（0：无 1：有）',
        answer_teacher_id   	int		    comment '答疑老师id',
        answer_teacher_name 	string		comment '答疑老师姓名',
        answer_job_number   	string		comment '答疑老师工号',
        remark              	string		comment '备注',
        create_time         	string		comment '创建时间'
)comment '班级课表'
    partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_student_leave_apply;
create table if not exists edu_ods.ods_student_leave_apply(			-- 学生请假申请表
        id                  int,
        class_id        	int			comment '班级id',
        student_id      	int			comment '学员id',
        audit_state     	int			comment '审核状态 0 待审核 1 通过 2 不通过',
        audit_person    	int			comment '审核人',
        audit_time      	string			comment '审核时间',
        audit_remark    	string			comment '审核备注',
        leave_type      	int			comment '请假类型  1 请假 2 销假',
        leave_reason    	int			comment '请假原因  1 事假 2 病假',
        begin_time      	string			comment '请假开始时间',
        begin_time_type 	int			comment '1：上午 2：下午',
        end_time        	string			comment '请假结束时间',
        end_time_type   	int			comment '1：上午 2：下午',
        days            	string			comment '请假/已休天数',
        cancel_state    	int			comment '撤销状态  0 未撤销 1 已撤销',
        cancel_time     	string			comment '撤销时间',
        old_leave_id    	int			comment '原请假id，只有leave_type =2 销假的时候才有',
        leave_remark    	string			comment '请假/销假说明',
        valid_state     	int			comment '是否有效（0：无效 1：有效）',
        create_time     	string			comment '创建时间'
)comment '学生请假申请表'
    partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_tbh_class_time_table;
create table if not exists edu_ods.ods_tbh_class_time_table(			-- 班级作息时间表
        id							int	            comment '主键id',
        class_id              		int	            comment '班级id',
        morning_template_id   		int	            comment '上午出勤模板id',
        morning_begin_time    		string	        comment '上午开始时间',
        morning_end_time      		string	        comment '上午结束时间',
        afternoon_template_id 		int	            comment '下午出勤模板id',
        afternoon_begin_time  		string	        comment '下午开始时间',
        afternoon_end_time    		string	        comment '下午结束时间',
        evening_template_id   		int	            comment '晚上出勤模板id',
        evening_begin_time    		string	        comment '晚上开始时间',
        evening_end_time      		string	        comment '晚上结束时间',
        use_begin_date        		string	        comment '使用开始日期',
        use_end_date          		string	        comment '使用结束日期',
        create_time           		string	        comment '创建时间',
        create_person         		int	            comment '创建人',
        remark                		string	        comment '备注'
)comment '班级作息时间表'
    partitioned by (dt string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_ods.ods_tbh_student_signin_record;
create table if not exists edu_ods.ods_tbh_student_signin_record(		-- 学生打卡记录表
        id            			int		comment '主键id',
        normal_class_flag 		int		comment '是否正课 1 正课 2 自习',
        time_table_id     		int		comment '作息时间id 关联tbh_school_time_table 或者 tbh_class_time_table',
        class_id          		int		comment '班级id',
        student_id        		int		comment '学员id',
        signin_time       		string		comment '签到时间',
        signin_date       		string		comment '签到日期',
        inner_flag        		int		comment '内外网标志  0 外网 1 内网',
        signin_type       		int		comment '签到类型 1 心跳打卡 2 老师补卡',
        share_state       		int		comment '共享屏幕状态 0 否 1是  在上午或下午段有共屏记录，则该段所有记录该字段为1，内网默认为1 外网默认为0 ',
        inner_ip          		string		comment '内网ip地址'
)comment '学生打卡记录表'
partitioned by (start_time string)
row format delimited fields terminated by '\t'
stored as orc
tblproperties ('orc.compress'='SNAPPY');
