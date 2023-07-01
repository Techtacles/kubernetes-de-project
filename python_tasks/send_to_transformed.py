from send_to_raw_s3 import get_current_datetime,get_s3_client
import os
import boto3
import pandas as pd
region=os.environ["REGION_NAME"]
bucket_name=os.environ["BUCKET_NAME"]
def get_last_record_key():
    client=get_s3_client()
    objs=client.list_objects(Bucket=bucket_name)['Contents'][-1]['Key']
    return objs

def extract_name_of_file_csv():
    last_object=get_last_record_key()
    name_of_file=last_object.split('.')[0]
    get_s3_client().download_file(bucket_name, last_object, last_object)
    df=pd.read_json(last_object,lines=True)
    csv_data=df.to_csv(index=False)
    return csv_data,name_of_file

def upload_to_s3(client):
    response=client.put_object(Body=extract_name_of_file_csv()[0],Bucket=bucket_name,Key=f'{extract_name_of_file_csv()[1]}.csv')
    return "Successfull moved data to the transformed bucket"
upload_to_s3()
