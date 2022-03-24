create or replace pipe sf_project_1.itr_rds_landing_1.superstore_pipe auto_ingest=true as 
    copy into sf_project_1.itr_rds_landing_1.superstore
    from @sf_project_1.itr_rds_landing_1.superstore_stage;
    
show pipes;
    
alter pipe sf_project_1.itr_rds_landing_1.superstore_pipe refresh;

SELECT SYSTEM$PIPE_STATUS('superstore_pipe');