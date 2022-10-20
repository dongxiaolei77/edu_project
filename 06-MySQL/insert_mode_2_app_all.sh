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
--table app_all_intention_count \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_all_intention_count \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_intention_area_count \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_intention_area_count \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_intention_subject_count \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_intention_subject_count \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_intention_school_count \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_intention_school_count \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_intention_origin_count \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_intention_origin_count \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_intention_tdepart_rate \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_intention_tdepart_rate \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

${SQOOP_HOME} export \
--connect "jdbc:mysql://192.168.52.150:3306/edu_app?useUnicode=true&characterEncoding=utf-8" \
--username root \
--password '123456' \
--table app_valid_clue_count \
--hcatalog-database edu_rpt \
--hcatalog-table rpt_valid_clue_count \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-m 1

