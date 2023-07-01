from produce_records import create_stream
import json
import os
import boto3
region=os.environ["REGION_NAME"]
bucket_name=os.environ["BUCKET_NAME"]
#Get the base date and time
def get_current_datetime():
    return datetime.now().strftime('%Y-%m-%d %H:%M')

#Get data from produce_records
def get_records():
    push_event=create_stream()
    return bytes(json.dumps(push_event).encode('utf8'))

#Get the s3 client using Boto3's client api
def get_s3_client():
    s3=boto3.client('s3',region_name=region)
    return s3

#Upload files to s3
def upload_to_s3(client):
    response=client.put_object(Body=get_records(),Bucket=bucket_name,Key=f'{get_current_datetime()}.json')

#Run the ingestion pipeline
def main():
    upload_to_s3(get_s3_client())
    return f'Successfully uploaded {get_current_datetime()}.json to the raw S3 bucket'

main()
