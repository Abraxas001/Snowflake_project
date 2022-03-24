create or replace table superstore_target(
    row_id int,
    order_id varchar,
    order_date date,
    ship_date date,
    ship_mode string, 
    customer_id varchar,
    customer_name string,
    segment string,
    city string,
    country string,
    state string,
    postal_code int,
    region string,
    product_id varchar,
    category string,
    sub_category string,
    product_name string,
    sales double,
    quantity int,
    discount double,
    profit double,
    stream_type string default null, 
    rec_version number default 0,
    REC_DATE TIMESTAMP_LTZ
);

CREATE TASK superstore_task
  WAREHOUSE = my_compute_warehouse
  SCHEDULE = '1 minute'
WHEN
  SYSTEM$STREAM_HAS_DATA('superstore_stream1')
AS
merge into superstore_target t
using superstore_stream1 s
on t.row_id=s.row_id and (metadata$action='DELETE')
when matched and metadata$isupdate='FALSE' then update set rec_version=9999, stream_type='DELETE'
when matched and metadata$isupdate='TRUE' then update set rec_version=rec_version-1
when not matched then insert  (row_id ,order_id,order_date ,ship_date ,ship_mode ,customer_id ,customer_name ,segment ,city ,country ,state ,postal_code,region,product_id ,category ,sub_category,product_name,sales ,quantity ,discount,profit, stream_type,rec_version,REC_DATE) values(s.row_id ,s.order_id,s.order_date ,s.ship_date ,s.ship_mode ,s.customer_id ,s.customer_name ,s.segment ,s.city ,s.country ,s.state ,s.postal_code,s.region,s.product_id ,s.category ,s.sub_category,s.product_name,s.sales ,s.quantity ,s.discount,s.profit,metadata$action,0,CURRENT_TIMESTAMP() );

ALTER TASK superstore_task RESUME;

select * from superstore_target;