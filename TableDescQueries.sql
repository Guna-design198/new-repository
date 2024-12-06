select * from all_indexes where TABLE_NAME = 'EGP_SYSTEM_ITEMS';
select * from all_ind_columns where TABLE_NAME in ( 'egp_system_items_b');
select * from all_constraints where TABLE_NAME in ('egp_system_items_b');
select * from all_tab_cols where TABLE_NAME = 'EGP_SYSTEM_ITEMS_B';
select distinct COLUMN_NAME from all_ind_columns where TABLE_NAME in ( 'egp_system_items_b');
select STATUS, VALIDATED  from all_constraints where TABLE_NAME in ('egp_system_items_b');
select distinct DEFERRABLE from all_constraints;
select * from all_constraints where STATUS = 'DISABLED' and TABLE_NAME in ('egp_system_items_b');
select * from all_tab_cols where TABLE_NAME in ('egp_system_items_b');
select * from all_objects where OBJECT_NAME like 'EGP_SYSTEM_ITEMS%' and OBJECT_TYPE = 'INDEX';


select table_name, index_name, column_name from all_ind_columns where table_name like 'egp_sy%' order by 1, 2;
select table_name, constraint_type, constraint_name, search_condition, search_condition_vc 
from all_constraints where table_name like 'egp_sy%' order by 1, 2, 3;

select fkt.table_name, fkt.constraint_name, fkt.column_name, pkt.table_name as pkt_table, 
pkt.constraint_name as pkt_constraint, pkt.column_name as pkt_column  
from all_cons_columns fkt, (select p.table_name, p.constraint_name, p.column_name from all_cons_columns p 
where p.table_name = 'egp_system_items_b' and p.constraint_name like '%_PK%') pkt 
where fkt.column_name in (pkt.column_name) and pkt.column_name = fkt.column_name 
/*and REGEXP_LIKE(fkt.TABLE_NAME,'^PREFIX_[^0-9]*$') AND fkt.TABLE_NAME NOT LIKE 'PREFIX_%$%' 
AND fkt.TABLE_NAME NOT LIKE 'PREFIX_%\\_' ESCAPE '\\'*/; 