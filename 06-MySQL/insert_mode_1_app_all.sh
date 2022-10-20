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
--table app_sum_visit_consult \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_sum_visit_consult \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_area_visit_consult \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_area_visit_consult \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_source_channel_visit \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_source_channel_visit \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_search_source \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_search_source \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_active_page_topn \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_active_page_topn \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1
