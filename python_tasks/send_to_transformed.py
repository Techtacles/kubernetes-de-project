from send_to_raw_s3 import get_current_datetime
import os
import pandas as pd
import boto3
region=os.environ["REGION_NAME"]
bucket_name=os.environ["BUCKET_NAME"]
trans_bucket_name=os.environ["TRANS_BUCKET_NAME"]
def get_s3_client():
    s3=boto3.client('s3',region_name=region)
    return s3

def get_last_record_key():
    client=get_s3_client()
    objs=client.list_objects(Bucket=bucket_name)['Contents'][-1]['Key']
    return objs

def extract_name_of_file_csv():
    last_object=get_last_record_key()
    name_of_file=last_object.split('.')[0]
    response = get_s3_client().get_object(Bucket=bucket_name, Key=last_object)
    json_data = response['Body'].read().decode('utf-8')
    df = pd.read_json(json_data,lines=True)
    csv_data = df.to_csv(index=False)
    return csv_data,name_of_file

def upload_to_s3(client):
    response=client.put_object(Body=extract_name_of_file_csv()[0],Bucket=trans_bucket_name,Key=f'{extract_name_of_file_csv()[1]}.csv')
    


def send_transformed():
    upload_to_s3(get_s3_client())
    return "Successfull moved data to the transformed bucket" 

