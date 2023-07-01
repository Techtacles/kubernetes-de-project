from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta


default_args = {
   'start_date': datetime.now(2023,7,1),
   'owner': 'Airflow'
}



with DAG(dag_id='depends_task', schedule_interval="*/30 * * * *", default_args=default_args) as dag:
  
   produce_records = BashOperator(task_id='produce_data_records', bash_command="python3 python_tasks/produce_records.py")
   # Task 2
   send_to_raw_s3 = BashOperator(task_id='send_to_raw_s3', bash_command="python3 python_tasks/send_to_raw_s3.py")


   # Task 3
   send_to_processed = BashOperator(task_id='send_to_processed_s3', bash_command="python3 python_tasks/send_to_transformed.py")


   produce_records >> send_to_raw_s3 >> send_to_processed
