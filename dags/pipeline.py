from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta
import sys
sys.path.append('/opt/airflow/python_tasks')
from produce_records import create_stream
from send_to_raw_s3 import main
from send_to_transformed import upload_to_s3


default_args = {
   'start_date': datetime(2023,6,29),
   'owner': 'Airflow'
}



with DAG(dag_id='dag_pipeline', schedule_interval="*/30 * * * *", default_args=default_args) as dag:
  
   produce_records = PythonOperator(task_id='produce_data_records', python_callable=create_stream)
   # Task 2
   send_to_raw_s3 = PythonOperator(task_id='send_to_raw_s3', python_callable=main)


   # Task 3
   send_to_processed = PythonOperator(task_id='send_to_processed_s3', python_callable=upload_to_s3)


   produce_records >> send_to_raw_s3 >> send_to_processed
