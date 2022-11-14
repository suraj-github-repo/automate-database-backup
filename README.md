# automate-database-backup to s3 bucket by using crontab

NOTE:- it’s working properly
Reference link :- https://youtu.be/EXvRwOuGpQo

# Step 1] install a AWS CLI on instance or server

--> sudo apt-get update
--> sudo apt install awscli
--> aws --version

# Output 
aws-cli/1.16.301 Python/3.7.6 Linux/5.4.0-9-generic botocore/1.13.37

--> aws configure

# Output

AWS Access Key ID [None]:
AWS secrete Access Key [None]:
Default region name [ap-south-1]:
Default output format [table]:


# Step 2] Create a folder for script like

--> mkdir mongo-backup-s3.sh
--> vi mongo-backup-s3.sh paste the data over here

# Step 3] permissions change of the file
--> sudo chmod 777 mongo-backup-s3.sh # need to change the permission of file

# Step 5] run the script by using following command

--> sh mongo-backup-s3.sh OR
--> ./mongo-backup-s3.sh  OR
--> bash mongo-backup-s3.sh

# Step 6] applying cron to the script to run automatically 

--> crontab -e
--> at the last of the page add following cron expression

0 * * * * /bin/bash /home/ubuntu/workspace/devops/mongodb/autogenarate-database-backup/mongo-backup-s3.sh

# Note :- for taking backup of database in every hrs used above cron expression otherwise you can change as per your requirement



