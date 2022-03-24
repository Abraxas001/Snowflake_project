create or replace storage integration superstore_int
    type = external_stage
    storage_provider = s3
    enabled = true
    storage_aws_role_arn = 'arn:aws:iam::308435124514:role/my-bucket71-policy-role'
    storage_allowed_locations = ('s3://my-bucket71/');
    
DESC INTEGRATION superstore_int;