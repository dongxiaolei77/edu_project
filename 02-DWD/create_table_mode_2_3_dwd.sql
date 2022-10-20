
use edu_dwd;

-- 第三主题所需建表
drop table if exists edu_dwd.dwd_customer_relationship;
create table if not exists edu_dwd.dwd_customer_relationship(			-- 客户意向表  -- 拉链表
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
        anticipat_signup_date	    string		    comment '预计报名时间',
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
        transfer_bxg_belonger_name	string	    comment '转移到博学谷归属人OA姓名',
        end_time                string            comment '拉链结束时间'
 )comment '客户意向表'
    partitioned by (start_time string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_dwd.dwd_customer_relationship_tmp;
create table if not exists edu_dwd.dwd_customer_relationship_tmp(			-- 客户意向表  -- 拉链表
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
        anticipat_signup_date	    string		    comment '预计报名时间',
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
        transfer_bxg_belonger_name	string	    comment '转移到博学谷归属人OA姓名',
        end_time                string            comment '拉链结束时间'
 )comment '客户意向表'
    partitioned by (start_time string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_dwd.dwd_customer_relationship_payment;
create table if not exists edu_dwd.dwd_customer_relationship_payment(			-- 客户意向表  -- 拉链表
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
        anticipat_signup_date	    string		    comment '预计报名时间',
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
        transfer_bxg_belonger_name	string	    comment '转移到博学谷归属人OA姓名',
        origin_type_state            string      comment '数据来源:0.线下；1.线上',
        payment_time_hour            string     comment '支付时间细化到小时'
 )comment '客户意向表'
    partitioned by (payment_time_year string, payment_time_month string, payment_time_day string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');


drop table if exists edu_dwd.dwd_itcast_clazz;
create table if not exists edu_dwd.dwd_itcast_clazz(
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


drop table if exists edu_dwd.dwd_scrm_department;
create table if not exists edu_dwd.dwd_scrm_department(				-- 部门表
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


drop table if exists edu_dwd.dwd_employee;
create table if not exists edu_dwd.dwd_employee(						-- 员工信息表
        id                      int,
        email                   string          comment '公司邮箱，OA登录账号',
        real_name               string      	comment '员工的真实姓名',
        phone                   string   		comment '手机号，目前还没有使用；隐私问题OA接口没有提供这个属性，',
        department_id           string 			comment 'OA中的部门编号，有负值',
        department_name         string			comment 'OA中的部门名',
        remote_login            int			    comment '员工是否可以远程登录',
        job_number              string 			comment '员工工号',
        cross_school            int			    comment '是否有跨校区权限',
        last_login_string         string			comment '最后登录日期',
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

--------------------------------------------------------------
-- 第二主题所需建表

drop table if exists edu_dwd.dwd_customer ;
create table if not exists edu_dwd.dwd_customer(						-- 客户静态信息表（关联获取客户的静态信息，比如地区信息）
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


drop table if exists edu_dwd.dwd_customer_appeal;
create table if not exists edu_dwd.dwd_customer_appeal(				-- 线索申诉表（主要来判断客户线索被投诉无效）
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


drop table if exists edu_dwd.dwd_customer_clue;
create table if not exists edu_dwd.dwd_customer_clue(					-- 客户线索表  -- 拉链表
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
        anticipat_signup_date 	string		    comment '预计报名时间',
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
        shunt_employee_group_id int		        comment '所属分流员工组',
		origin_type_state		int 			comment '统计线上线下 0为线上 其余为线下',
		clue_state_state		int 			comment '统计新老维度 0为老用户 1为新用户',
		create_date_time_hour 	string 			comment '创建时间细化到小时',
		create_date_time_month string,
		create_date_time_day string
)comment '客户线索表'
partitioned by (create_date_time_year string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_dwd.dwd_customer_relationship_intention;
create table if not exists edu_dwd.dwd_customer_relationship_intention(			-- 客户意向表  -- 拉链表
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
        anticipat_signup_date	    string		    comment '预计报名时间',
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
        transfer_bxg_belonger_name	string	    comment '转移到博学谷归属人OA姓名',
		origin_type_state			int 		comment '判断线上线下 0为线上 1为线下',
		create_date_time_hour 		string 		comment '创建时间 细化到小时',
		create_date_time_month string,
		create_date_time_day string
 )comment '客户意向表'
    partitioned by (create_date_time_year string)
    row format delimited fields terminated by '\t'
    stored as orc
    tblproperties ('orc.compress'='SNAPPY');

drop table if exists edu_dwd.dwd_itcast_school;
create table if not exists edu_dwd.dwd_itcast_school(				-- 学校表
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

drop table if exists edu_dwd.dwd_itcast_subject;
create table if not exists edu_dwd.dwd_itcast_subject(				-- 学科表
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
    tblproperties ('orc.compress'='SNAPPY');



