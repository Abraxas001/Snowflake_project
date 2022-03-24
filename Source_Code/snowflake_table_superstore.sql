create table superstore (
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
    profit double
);

desc table superstore;