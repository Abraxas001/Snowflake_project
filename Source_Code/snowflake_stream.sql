create or replace stream superstore_stream1 on table superstore;

update superstore set region='West' where row_id=6;

select * from superstore_stream1;