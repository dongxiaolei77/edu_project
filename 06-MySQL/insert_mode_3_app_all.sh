#! /bin/bash
export SQOOP_HOME=/usr/bin/sqoop
if [ $# == 1 ]
then
   dateStr=$1
else
   dateStr=`date -d '-1 day' "+%Y-%m-%d"`
fi

TD_YEAR=$(date -d "$dateStr" +%Y)

mysql -uroot -p123456 -h192.168.52.150 -P3306 -e "delete from edu_app.visit_dm where yearinfo='${TD_YEAR}';"


wait

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_day_application \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_day_application \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_origin_application \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_origin_application \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_origin_proportion \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_origin_proportion \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_school_application \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_school_application \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_school_subject_application \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_school_subject_application \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_subject_application \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_subject_application \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_tdepart_application \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_tdepart_application \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_year_month_application \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_year_month_application \
-m 1
