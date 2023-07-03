# kubernetes-de-project
An end to end data pipeline using Terraform, Airflow, Docker , Kubernetes and AWS resources.<br>

## INFRASTRUCTURE
This project consists of two separate layers. One for the data pipeline and the other for the CICD workflows.<br>

The AWS resources used are as follows<br>
1.) S3 buckets: There are two s3 modules created for this project. One for the raw S3 bucket and the other to store the transformed data.<br>
2.) Redshift: Data from the transformed S3 bucket are sent to this Redshift cluster to be utilized by the downstream users such as data analysts, BI analysts or data scientists.<br>
3.) ECR: Elastic Container Registry will  be utilized by the CICD layer to push the built docker images<br>
4.) EC2 : EC2 is used in this scope to run the Airflow docker container. This EC2 instance pulls the data from the latest image built and pushed to ECR by the Github Actions workflow.<br>
5.) EKS: Elastic Kubernetes Service is used for orchestrating the docker containers running on the EC2 instance.
The architectural diagram for the data infra and CICD infra is shown below.<br>

![Data Pipeline Infra](https://github.com/Techtacles/kubernetes-de-project/assets/57522480/3a300304-0849-4b94-a1b2-4e4e1455ae29)
<br><br>

![CICD INFRA](https://github.com/Techtacles/kubernetes-de-project/assets/57522480/f4fdd75b-d903-4b05-ab6e-1c69e01582af)
<br><br>
## ACTIONS
The Github Actions worfklow file contains two workflows. Workflow.yml file creates the terraform resources, authenticates to AWS using OIDC connect , builds the docker images and pushes the built docker image to AWS ECR.<br><br> Destroy.yml file destroys the terraform modules originally created. <br> ALso, in the code, there is a toggle. Enabling the toggle creates all the resources and destroying the toggle deletes all the resources. <br>

<img width="1433" alt="ACTIONS" src="https://github.com/Techtacles/kubernetes-de-project/assets/57522480/6a05a56a-a2eb-4efe-87ea-506cba308605">
<br>

## DAG
The Airflow Webserver could be viewed by using the public IP of your EC2 instance. There, you can view your DAG graph or manually run your dags.<br>
<img width="1440" alt="AIRFLOW DAG" src="https://github.com/Techtacles/kubernetes-de-project/assets/57522480/40543fc0-1755-40a1-a9d1-826a06dac94c"><br>
To verify that the data was actually uploaded to S3, the image below shows that data in the S3 bucket.<br>
<img width="1425" alt="DATA IN S3" src="https://github.com/Techtacles/kubernetes-de-project/assets/57522480/14820048-9214-4911-b734-1511cebb93d8">
<br>

## CONCLUSION
This is just the first version of the project. Subsequent builds will involve code improvements and adding extra modules for visualization. Going further, I will also create an RDS module whose database credentials will be used to configure the airflow.cfg. I will also change the default executor type from Sequential Executor to Celery Executor for improved parallelism.
